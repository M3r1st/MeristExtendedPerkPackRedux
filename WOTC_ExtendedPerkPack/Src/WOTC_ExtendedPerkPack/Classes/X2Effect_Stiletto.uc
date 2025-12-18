class X2Effect_Stiletto extends X2Effect_Persistent;

var int PierceBonus;

function int GetExtraArmorPiercing(
    XComGameState_Effect EffectState,
    XComGameState_Unit Attacker,
    Damageable TargetDamageable,
    XComGameState_Ability AbilityState,
    const out EffectAppliedData AppliedData)
{
    if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
    {
        return 0;
    }

    if (AppliedData.EffectRef.ApplyOnTickIndex != INDEX_NONE)
    {
        return 0;
    }

    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult))
    {
        return PierceBonus;
    }

    return 0;
}