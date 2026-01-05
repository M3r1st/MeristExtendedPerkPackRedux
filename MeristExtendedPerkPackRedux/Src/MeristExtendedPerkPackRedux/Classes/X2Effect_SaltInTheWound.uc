class X2Effect_SaltInTheWound extends X2Effect_Persistent;

var array<name> AllowedEffects;
var int DamageBonus;

function int GetAttackingDamageModifier( XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
    local XComGameState_Unit Target;

    Target = XComGameState_Unit(TargetDamageable);

    if (Target == none)
        return 0;

    if (!ValidateEffects(Target))
        return 0;

    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult))
    {
        if (CurrentDamage > 0)
        {
            return DamageBonus;
        }
    }

    return 0;
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