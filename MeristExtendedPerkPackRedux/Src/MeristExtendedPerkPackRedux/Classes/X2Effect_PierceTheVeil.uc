class X2Effect_PierceTheVeil extends X2Effect_Persistent;

var int AimBonus;
var int CritBonus;
var int DamageBonus;
var int PierceBonus;
var bool bMatchSourceWeapon;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
    local ShotModifierInfo AimInfo, CritInfo;

    if (bMatchSourceWeapon && AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
    {
        return;
    }

    if (!Target.IsRobotic())
    {
        AimInfo.ModType = eHit_Success;
        AimInfo.Reason = FriendlyName;
        AimInfo.Value = AimBonus;
        ShotModifiers.AddItem(AimInfo);

        CritInfo.ModType = eHit_Crit;
        CritInfo.Reason = FriendlyName;
        CritInfo.Value = CritBonus;
        ShotModifiers.AddItem(CritInfo);
    }
}

function int GetAttackingDamageModifier( XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
    local XComGameState_Unit TargetUnit;

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
            TargetUnit = XComGameState_Unit(TargetDamageable);
            if (TargetUnit != none && !TargetUnit.IsRobotic())
            {
                return DamageBonus;
            }
        }
    }

    return 0;
}

function int GetExtraArmorPiercing(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData)
{
    local XComGameState_Unit TargetUnit;

    if (bMatchSourceWeapon && AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
    {
        return 0;
    }

    if (AppliedData.EffectRef.ApplyOnTickIndex != INDEX_NONE)
    {
        return 0;
    }

    TargetUnit = XComGameState_Unit(TargetDamageable);
    if (TargetUnit != none && !TargetUnit.IsRobotic())
    {
        return PierceBonus;
    }

    return 0;
}

defaultproperties
{
    EffectName = F_PierceTheVeil
    DuplicateResponse = eDupe_Refresh

    bMatchSourceWeapon = true
}