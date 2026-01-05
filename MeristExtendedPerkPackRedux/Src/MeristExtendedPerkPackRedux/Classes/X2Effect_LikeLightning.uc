class X2Effect_LikeLightning extends X2Effect_RefundActionPoints;

var name RequiredEffectName;

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    if (TargetUnit.AffectedByEffectNames.Find(RequiredEffectName) != INDEX_NONE)
    {
        return super.IsEffectCurrentlyRelevant(EffectGameState, TargetUnit);
    }
    
    return false;
}

defaultproperties
{
    EffectName = F_LikeLightning

    ActivationsPerTurn = 1
    RequiredEffectName = F_LikeLightning_Active
    CountValueName = F_LikeLightning_Activations
    FlyoverEventName = F_LikeLightning_Refund_Flyover
}