class X2Effect_Rampart extends X2Effect_PersistentAura;

var int DamageReduction;
var name RequiredEffectName;

function float GetPostDefaultDefendingDamageModifier_CH(XComGameState_Effect EffectState, XComGameState_Unit SourceUnit, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, const out EffectAppliedData ApplyEffectParameters, float WeaponDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, XComGameState NewGameState)
{
    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(ApplyEffectParameters.AbilityResultContext.HitResult))
    {
        if (WeaponDamage > 0)
        {
            if (IsEffectCurrentlyRelevant(EffectState, TargetUnit))
            {
                return -1 * Min(WeaponDamage, WeaponDamage * DamageReduction / 100);
            }
        }
    }

    return 0;
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    local XComGameState_Unit SourceUnit;

    SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (SourceUnit.AffectedByEffectNames.Find(RequiredEffectName) != INDEX_NONE)
    {
        return super.IsEffectCurrentlyRelevant(EffectGameState, TargetUnit);
    }

    return false;
}

defaultproperties
{
    EffectName = F_Rampart
    
    RequiredEffectName = F_Rampart_Active
}