class X2Effect_ColdBlooded extends X2Effect_RefundActionPoints;

var array<name> AllowedEffects;

function bool PostAbilityCostPaid(
    XComGameState_Effect EffectState,
    XComGameStateContext_Ability AbilityContext,
    XComGameState_Ability kAbility,
    XComGameState_Unit SourceUnit,
    XComGameState_Item AffectWeapon, XComGameState NewGameState, const array<name> PreCostActionPoints, const array<name> PreCostReservePoints)
{
    local XComGameState_Unit OldTargetState;

    OldTargetState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));

    if (ValidateEffects(OldTargetState))
    {
        return super.PostAbilityCostPaid(EffectState, AbilityContext, kAbility, SourceUnit, AffectWeapon, NewGameState, PreCostActionPoints, PreCostReservePoints);;
    }

    return false;
}

simulated function bool ValidateEffects(XComGameState_Unit UnitState)
{
    local name AllowedEffectName;

    if (UnitState == none)
        return false;

    foreach AllowedEffects(AllowedEffectName)
    {
        if (UnitState.AffectedByEffectNames.Find(AllowedEffectName) != INDEX_NONE)
        {
            return true;
        }
    }
    
    return false;
}

defaultproperties
{
    EffectName = F_ColdBlooded

    CountValueName = F_ColdBlooded_Counter
    FlyoverEventName = F_ColdBlooded_Refund_Flyover

    bRefundAll = true
}
