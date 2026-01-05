class X2Effect_ChangeHitResultForAttacker extends X2Effect_Persistent;

var EAbilityHitResult ChangeHitResults[EAbilityHitResult.EnumCount]<BoundEnum=EAbilityHitResult>;
var bool bMatchSourceWeapon;

var name CountValueName;
var int ActivationsPerTurn;

var bool bShowFlyover;
var name FlyoverEventName;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager EventMgr;
    local XComGameState_Unit UnitState;
    local Object EffectObj;

    EventMgr = `XEVENTMGR;

    EffectObj = EffectGameState;
    UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (bShowFlyover && FlyoverEventName != '')
    {
        EventMgr.RegisterForEvent(EffectObj, FlyoverEventName, EffectGameState.TriggerAbilityFlyover, ELD_OnStateSubmitted,, UnitState);
    }
}

function bool ChangeHitResultForAttacker(
    XComGameState_Unit Attacker,
    XComGameState_Unit TargetUnit,
    XComGameState_Ability AbilityState,
    const EAbilityHitResult CurrentResult,
    out EAbilityHitResult NewHitResult)
{
    local XComGameState_Ability EffectAbilityState;
    local XComGameState_Effect EffectState;
    local UnitValue CountUnitValue;

    if (CurrentResult != ChangeHitResults[CurrentResult])
    {
        if (bMatchSourceWeapon)
        {
            EffectState = GetMyEffectState(Attacker);
            if (EffectState != none)
            {
                if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
                    return false;
            }
            else
            {
                return false;
            }
        }
        
        if (CountValueName != '')
        {
            Attacker.GetUnitValue(CountValueName, CountUnitValue);
            if (ActivationsPerTurn > 0 && CountUnitValue.fValue >= ActivationsPerTurn)
                return false;

            Attacker.SetUnitFloatValue(CountValueName, CountUnitValue.fValue + 1, eCleanup_BeginTurn);
        }

        if (bShowFlyover && FlyoverEventName != '')
        {
            EffectAbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
            `XEVENTMGR.TriggerEvent(FlyoverEventName, EffectAbilityState, Attacker);
        }

        NewHitResult = ChangeHitResults[CurrentResult];
        return true;
    }

    return false;
}

function XComGameState_Effect GetMyEffectState(XComGameState_Unit UnitState)
{
    local XComGameState_Effect EffectState;

    foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Effect', EffectState)
    {
        if (EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID == UnitState.ObjectID)
        {
            if (EffectState.GetX2Effect() == self)
            {
                return EffectState;
            }
        }
    }

    return none;
}


defaultproperties
{
    ChangeHitResults[eHit_Success] = eHit_Success
    ChangeHitResults[eHit_Crit] = eHit_Crit
    ChangeHitResults[eHit_Graze] = eHit_Graze
    ChangeHitResults[eHit_Miss] = eHit_Miss
    ChangeHitResults[eHit_LightningReflexes] = eHit_LightningReflexes
    ChangeHitResults[eHit_Untouchable] = eHit_Untouchable
    ChangeHitResults[eHit_CounterAttack] = eHit_CounterAttack
    ChangeHitResults[eHit_Parry] = eHit_Parry
    ChangeHitResults[eHit_Deflect] = eHit_Deflect
    ChangeHitResults[eHit_Reflect] = eHit_Reflect
}