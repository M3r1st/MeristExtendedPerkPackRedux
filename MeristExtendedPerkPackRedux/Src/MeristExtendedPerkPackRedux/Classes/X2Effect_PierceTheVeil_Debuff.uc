class X2Effect_PierceTheVeil_Debuff extends X2Effect_BonusArmor;

var int AsTargetAimBonus;
var int AsTargetCritBonus;
var int AsTargetDamageBonus;
var int ArmorPenalty;

function GetToHitAsTargetModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
    local ShotModifierInfo AimInfo, CritInfo;

    AimInfo.ModType = eHit_Success;
    AimInfo.Reason = FriendlyName;
    AimInfo.Value = AsTargetAimBonus;
    ShotModifiers.AddItem(AimInfo);

    CritInfo.ModType = eHit_Crit;
    CritInfo.Reason = FriendlyName;
    CritInfo.Value = AsTargetCritBonus;
    ShotModifiers.AddItem(CritInfo);
}

function int GetDefendingDamageModifier( XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
    if (class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult))
    {
        if (CurrentDamage > 0)
        {
            return -1 * Min(CurrentDamage, AsTargetDamageBonus);
        }
    }
}

function int GetArmorMitigation(XComGameState_Effect EffectState, XComGameState_Unit UnitState)
{
    return -1 * ArmorPenalty;
}


defaultproperties
{
    EffectName = F_PierceTheVeil_Debuff
    DuplicateResponse = eDupe_Refresh
}