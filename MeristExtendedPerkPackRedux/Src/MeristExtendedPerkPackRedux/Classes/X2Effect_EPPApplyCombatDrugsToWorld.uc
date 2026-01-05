class X2Effect_EPPApplyCombatDrugsToWorld extends X2Effect_EPPApplyAdditionalSmokeEffectToWorld;

event array<X2Effect> GetTileEnteredEffects()
{
    local array<X2Effect> TileEnteredEffects;

    TileEnteredEffects.AddItem(class'X2Effect_EPPCombatDrugs'.static.CombatDrugsEffect(true));

    return TileEnteredEffects;
}

defaultproperties
{
    RelevantAbilityName = F_CombatDrugs
}