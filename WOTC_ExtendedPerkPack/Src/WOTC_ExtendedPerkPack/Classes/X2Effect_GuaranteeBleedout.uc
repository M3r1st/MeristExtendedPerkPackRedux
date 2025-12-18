class X2Effect_GuaranteeBleedout extends X2Effect_Persistent;

var name CountValueName;
var int BonusBleedOutTurns;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager EventMgr;
    local Object EffectObj;
    local XComGameState_Unit TargetUnit;

    EventMgr = `XEVENTMGR;
    EffectObj = EffectGameState;
    TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

    if (BonusBleedOutTurns > 0)
    {
        EventMgr.RegisterForEvent(EffectObj, 'UnitBleedingOut', OnUnitBleedingOut, ELD_OnStateSubmitted,, TargetUnit,, EffectObj);
    }
}

static function EventListenerReturn OnUnitBleedingOut(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit            UnitState;
    local XComGameState_Effect          EffectState;
    local X2Effect_GuaranteeBleedout    Effect;
    local XComGameState_Effect          BleedOutEffectState;
    local XComGameState                 NewGameState;

    UnitState = XComGameState_Unit(EventData);
    EffectState = XComGameState_Effect(CallbackData);
    Effect = X2Effect_GuaranteeBleedout(EffectState.GetX2Effect());

    if (Effect == none)
    {
        return ELR_NoInterrupt;
    }

    if (UnitState.IsBleedingOut())
    {
        BleedOutEffectState = UnitState.GetUnitAffectedByEffectState(class'X2StatusEffects'.default.BleedingOutName);
        if (BleedOutEffectState != none)
        {
            NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));
            BleedOutEffectState = XComGameState_Effect(NewGameState.ModifyStateObject(BleedOutEffectState.Class, BleedOutEffectState.ObjectID));
            BleedOutEffectState.iTurnsRemaining += Effect.BonusBleedOutTurns;
            `TACTICALRULES.SubmitGameState(NewGameState);
        }
    }

    return ELR_NoInterrupt;
}

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit TargetUnitState;
    
    TargetUnitState = XComGameState_Unit(kNewTargetState);

    if (TargetUnitState != none)
    {
        TargetUnitState.SetUnitFloatValue(CountValueName, 1, eCleanup_BeginTactical);
    }
}

function bool ForcesBleedout(XComGameState NewGameState, XComGameState_Unit UnitState, XComGameState_Effect EffectState)
{
    local UnitValue UnitValue;

    if (UnitState.GetUnitValue(default.CountValueName, UnitValue))
    {
        if (UnitValue.fValue > 0)
        {
            UnitState.SetUnitFloatValue(default.CountValueName, UnitValue.fValue - 1, eCleanup_BeginTactical);
            return false;
        }
    }

    return false;
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    local UnitValue UnitValue;

    if (TargetUnit.GetUnitValue(CountValueName, UnitValue))
    {
        if (UnitValue.fValue > 0)
        {
            return true;
        }
    }

    return false;
}

defaultproperties
{
    EffectName = F_GuaranteeBleedout
    DuplicateResponse = eDupe_Ignore

    CountValueName = F_GuaranteeBleedout_Activations
}
