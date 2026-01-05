class X2Effect_UnloadDamage extends X2Effect_Persistent;

var array<name> AffectedAbilities;
var int DamagePenalty;

function float GetPostDefaultAttackingDamageModifier_CH(XComGameState_Effect EffectState, XComGameState_Unit SourceUnit, Damageable Target, XComGameState_Ability AbilityState, const out EffectAppliedData ApplyEffectParameters, float CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, XComGameState NewGameState)
{
    if (ApplyEffectParameters.EffectRef.ApplyOnTickIndex != INDEX_NONE)
        return 0;

    if (AffectedAbilities.Find(AbilityState.GetMyTemplateName()) != INDEX_NONE)
    {
        if (class'XComGameStateContext_Ability'.static.IsHitResultHit(ApplyEffectParameters.AbilityResultContext.HitResult))
        {
            if (CurrentDamage > 0)
            {
                return CurrentDamage * DamagePenalty / 100;
            }
        }
    }

    return 0;
}