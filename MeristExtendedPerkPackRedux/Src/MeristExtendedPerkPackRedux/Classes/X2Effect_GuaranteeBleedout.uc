class X2Effect_GuaranteeBleedout extends X2Effect_Persistent;

var name ActiveValueName;
var name CountValueName;
var int MaxActivations;
var int BonusBleedOutTurns;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager EventMgr;
    local Object EffectObj;
    local XComGameState_Unit TargetUnit;

    EventMgr = `XEVENTMGR;
    EffectObj = EffectGameState;
    TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

    EventMgr.RegisterForEvent(EffectObj, 'UnitBleedingOut', OnUnitBleedingOut, ELD_OnStateSubmitted,, TargetUnit,, EffectObj);
}

static function EventListenerReturn OnUnitBleedingOut(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit            UnitState;
    local XComGameState_Effect          EffectState;
    local X2Effect_GuaranteeBleedout    Effect;
    local XComGameState_Effect          BleedOutEffectState;
    local XComGameState                 NewGameState;
    local UnitValue                     UnitValue;

    UnitState = XComGameState_Unit(EventData);
    EffectState = XComGameState_Effect(CallbackData);

    if (UnitState == none || EffectState == none)
        return ELR_NoInterrupt;

    Effect = X2Effect_GuaranteeBleedout(EffectState.GetX2Effect());
    if (Effect == none)
        return ELR_NoInterrupt;

    if (UnitState.IsBleedingOut())
    {
        BleedOutEffectState = UnitState.GetUnitAffectedByEffectState(class'X2StatusEffects'.default.BleedingOutName);
        if (BleedOutEffectState != none)
        {
            NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(Effect.EffectName @ GetFuncName());

            BleedOutEffectState = XComGameState_Effect(NewGameState.ModifyStateObject(BleedOutEffectState.Class, BleedOutEffectState.ObjectID));
            BleedOutEffectState.iTurnsRemaining += Effect.BonusBleedOutTurns;

            if (UnitState.GetUnitValue(Effect.ActiveValueName, UnitValue) && UnitValue.fValue > 0)
            {
                UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
                UnitState.GetUnitValue(Effect.CountValueName, UnitValue);
                UnitState.SetUnitFloatValue(Effect.CountValueName, UnitValue.fValue + 1, eCleanup_BeginTactical);
                if (UnitValue.fValue + 1 >= Effect.MaxActivations)
                {
                    UnitState.ClearUnitValue(Effect.ActiveValueName);
                }
            }

            `TACTICALRULES.SubmitGameState(NewGameState);
        }
    }

    return ELR_NoInterrupt;
}

function bool ForcesBleedout(XComGameState NewGameState, XComGameState_Unit UnitState, XComGameState_Effect EffectState)
{
    local UnitValue UnitValue;

    if (UnitState.GetUnitValue(CountValueName, UnitValue) && UnitValue.fValue >= MaxActivations)
    {
        return false;
    }

    UnitState.SetUnitFloatValue(ActiveValueName, 1, eCleanup_BeginTactical);

    return false;
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    local UnitValue UnitValue;

    TargetUnit.GetUnitValue(CountValueName, UnitValue);
    if (UnitValue.fValue < MaxActivations)
    {
        return true;
    }

    return false;
}

defaultproperties
{
    EffectName = F_GuaranteeBleedout
    DuplicateResponse = eDupe_Ignore

    ActiveValueName = F_GuaranteeBleedout_Active
    CountValueName = F_GuaranteeBleedout_Activations
}
