class X2Effect_EPPApplyRegenMistToWorld extends X2Effect_EPPApplyAdditionalSmokeEffectToWorld;

event array<X2Effect> GetTileEnteredEffects()
{
    local array<X2Effect> TileEnteredEffects;

    TileEnteredEffects.AddItem(class'X2Effect_EPPRegenMist'.static.RegenMistEffect(true));

    return TileEnteredEffects;
}

defaultproperties
{
    RelevantAbilityName = F_RegenerativeMist
}