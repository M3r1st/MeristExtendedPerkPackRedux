class X2Effect_CoverArea extends X2Effect_PersistentAura;

var int DamageReduction;
var bool bIncludeExplosiveDamage;
var array<name> IncludeAbilities;

function float GetPostDefaultDefendingDamageModifier_CH(XComGameState_Effect EffectState, XComGameState_Unit SourceUnit, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, const out EffectAppliedData ApplyEffectParameters, float WeaponDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, XComGameState NewGameState)
{
    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(ApplyEffectParameters.AbilityResultContext.HitResult))
    {
        if (WeaponDamage > 0)
        {
            if (IsEffectCurrentlyRelevant(EffectState, TargetUnit))
            {
                if (IsDamageExplosive(AbilityState, WeaponDamageEffect))
                {
                    return -1 * Min(WeaponDamage, WeaponDamage * DamageReduction / 100);
                }
            }
        }
    }

    return 0;
}

function int ModifyDamageFromDestructible(XComGameState_Destructible DestructibleState, int IncomingDamage, XComGameState_Unit TargetUnit, XComGameState_Effect EffectState)
{
    // destructible damage is always considered to be explosive
    return -1 * Min(IncomingDamage, IncomingDamage * DamageReduction / 100);
}

simulated function bool IsDamageExplosive(XComGameState_Ability AbilityState, X2Effect_ApplyWeaponDamage WeaponDamageEffect)
{
    local XComGameState_Item    SourceWeapon;
    local X2WeaponTemplate      WeaponTemplate;
    local array<name>           ExplosiveDamageTypes;
    local name                  DamageType;

    if (IncludeAbilities.Length > 0 && IncludeAbilities.Find(AbilityState.GetMyTemplateName()) != INDEX_NONE)
    {
        return true;
    }

    ExplosiveDamageTypes = class'X2DLCInfo_MeristExtendedPerkPackRedux'.default.ExplosiveDamageTypes;

    if (!WeaponDamageEffect.bIgnoreBaseDamage)
    {
        SourceWeapon = AbilityState.GetSourceWeapon();
        if (SourceWeapon != none)
        {
            WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
            if (WeaponTemplate != none)
            {
                DamageType = WeaponTemplate.BaseDamage.DamageType;
                if (DamageType != '' && ExplosiveDamageTypes.Find(DamageType) != INDEX_NONE)
                {
                    return true;
                }
            }
        }
    }

    DamageType = WeaponDamageEffect.EffectDamageValue.DamageType;
    if (DamageType != '' && ExplosiveDamageTypes.Find(DamageType) != INDEX_NONE)
    {
        return true;
    }

    foreach ExplosiveDamageTypes(DamageType)
    {
        if (WeaponDamageEffect.DamageTypes.Find(DamageType) != INDEX_NONE)
        {
            return true;
        }
    }

    if (bIncludeExplosiveDamage && WeaponDamageEffect.bExplosiveDamage)
    {
        return true;
    }

    return false;
}

defaultproperties
{
    EffectName = F_CoverArea
}