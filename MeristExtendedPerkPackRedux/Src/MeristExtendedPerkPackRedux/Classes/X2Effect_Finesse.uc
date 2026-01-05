class X2Effect_Finesse extends X2Effect_RefundActionPoints;

var array<name> IncludeAbilities;

function bool IsAbilityRelevant(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Effect EffectState)
{
    if (AbilityState.IsMeleeAbility() || IncludeAbilities.Find(AbilityState.GetMyTemplateName()) != INDEX_NONE)
    {
        return super.IsAbilityRelevant(AbilityState, SourceUnit, EffectState);
    }

    return false;
}

defaultproperties
{
    EffectName = F_Finesse

    CountValueName = F_Finesse_Activations
    FlyoverEventName = F_Finesse_Refund_Flyover
}