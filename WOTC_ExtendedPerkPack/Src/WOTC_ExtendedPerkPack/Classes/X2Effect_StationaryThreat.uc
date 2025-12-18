class X2Effect_StationaryThreat extends X2Effect_Persistent;

var name CountValueName;
var bool bMatchSourceWeapon;
var int DamagePerTurn;
var int MaxTurns;
var int StartingValue;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local XComGameStateHistory  History;
    local X2EventManager        EventMgr;
    local XComGameState_Unit    UnitState;
    local XComGameState_Player  PlayerState;
    local Object                EffectObj;

    History = `XCOMHISTORY;
    EventMgr = `XEVENTMGR;

    EffectObj = EffectGameState;
    UnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
    PlayerState = XComGameState_Player(History.GetGameStateForObjectID(UnitState.GetAssociatedPlayerID()));

    EventMgr.RegisterForEvent(EffectObj, 'PlayerTurnBegun', OnPlayerTurnBegun, ELD_OnStateSubmitted,, PlayerState,, EffectObj);
    EventMgr.RegisterForEvent(EffectObj, 'UnitMoveFinished', OnUnitMoveFinished, ELD_OnStateSubmitted,, UnitState,, EffectObj);
}

function int GetAttackingDamageModifier(
    XComGameState_Effect EffectState,
    XComGameState_Unit Attacker,
    Damageable TargetDamageable,
    XComGameState_Ability AbilityState,
    const out EffectAppliedData AppliedData,
    const int CurrentDamage,
    optional XComGameState NewGameState)
{
    local UnitValue CountUnitValue;

    if (bMatchSourceWeapon && AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
        return 0;

    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult))
    {
        if (CurrentDamage > 0)
        {
            Attacker.GetUnitValue(CountValueName, CountUnitValue);
            if (CountUnitValue.fValue > 0)
            {
                return DamagePerTurn * int(CountUnitValue.fValue);
            }
        }
    }

    return 0;
}

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit TargetUnitState;
    
    TargetUnitState = XComGameState_Unit(kNewTargetState);

    if (TargetUnitState != none)
    {
        TargetUnitState.SetUnitFloatValue(CountValueName, StartingValue, eCleanup_BeginTactical);
    }
}

static function EventListenerReturn OnPlayerTurnBegun(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Effect  EffectState;
    local X2Effect_StationaryThreat Effect;
    local XComGameState_Unit    UnitState;
    local UnitValue             CountUnitValue;
    local int                   CurrentMaxTurns;
    local int                   NewCount;
    local XComGameState         NewGameState;
    
    EffectState = XComGameState_Effect(CallbackData);

    if (EffectState != none)
    {
        Effect = X2Effect_StationaryThreat(EffectState.GetX2Effect());
        UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
        if (UnitState != none && Effect != none)
        {
            UnitState.GetUnitValue(Effect.CountValueName, CountUnitValue);
            CurrentMaxTurns = Effect.GetMaxTurns(UnitState);

            if (CountUnitValue.fValue < CurrentMaxTurns)
            {
                NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));
                UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
                
                NewCount = CountUnitValue.fValue + 1;
                NewCount = Min(NewCount, CurrentMaxTurns);
                UnitState.SetUnitFloatValue(Effect.CountValueName, NewCount, eCleanup_BeginTactical);

                NewGameState.ModifyStateObject(class'XComGameState_Ability', EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID);
                // XComGameStateContext_ChangeContainer(NewGameState.GetContext()).BuildVisualizationFn = EffectState.ForwardOperatorVisualizationFn;
                XComGameStateContext_ChangeContainer(NewGameState.GetContext()).BuildVisualizationFn = EffectState.TriggerAbilityFlyoverVisualizationFn;

                `TACTICALRULES.SubmitGameState(NewGameState);
            }

        }
    }

    return ELR_NoInterrupt;
}

static function EventListenerReturn OnUnitMoveFinished(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Effect  EffectState;
    local X2Effect_StationaryThreat Effect;
    local XComGameState_Unit    UnitState;
    local XComGameState         NewGameState;

    EffectState = XComGameState_Effect(CallbackData);

    if (EffectState != none)
    {
        Effect = X2Effect_StationaryThreat(EffectState.GetX2Effect());
        UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
        if (UnitState != none && Effect != none)
        {
            NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));

            UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
            UnitState.SetUnitFloatValue(Effect.CountValueName, Effect.StartingValue, eCleanup_BeginTactical);

            `TACTICALRULES.SubmitGameState(NewGameState);
        }
    }

    return ELR_NoInterrupt;
}

simulated function int GetMaxTurns(XComGameState_Unit SourceUnit)
{
    return MaxTurns;
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    local UnitValue CountUnitValue;

    TargetUnit.GetUnitValue(CountValueName, CountUnitValue);

    return CountUnitValue.fValue > 0;
}

defaultproperties
{
    CountValueName = F_StationaryThreat_TurnsWithoutMovement
    bMatchSourceWeapon = true
}