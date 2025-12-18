class X2Effect_FirstStrike extends X2Effect_Persistent;

var int ConcealedDamageBonus;
var int FlankingDamageBonus;
var bool bMatchSourceWeapon;

function int GetAttackingDamageModifier(
    XComGameState_Effect EffectState,
    XComGameState_Unit Attacker,
    Damageable TargetDamageable,
    XComGameState_Ability AbilityState,
    const out EffectAppliedData AppliedData,
    const int CurrentDamage,
    optional XComGameState NewGameState)
{
    local XComGameState_Unit Target;
    local int DamageBonus;

    if (bMatchSourceWeapon && AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
    {
        return 0;
    }

    if (AppliedData.EffectRef.ApplyOnTickIndex != INDEX_NONE)
    {
        return 0;
    }

    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult))
    {
        if (CurrentDamage > 0)
        {
            Target = XComGameState_Unit(TargetDamageable);
            if (Target != none)
            {
                if (!AbilityState.IsMeleeAbility() && class'X2AbilityHelpers'.static.IsFlanking(Attacker, Target))
                {
                    DamageBonus += FlankingDamageBonus;
                }
            }
            
            if (Attacker.IsConcealed())
            {
                DamageBonus += ConcealedDamageBonus;
            }

            return DamageBonus;
        }
    }

    return 0;
}