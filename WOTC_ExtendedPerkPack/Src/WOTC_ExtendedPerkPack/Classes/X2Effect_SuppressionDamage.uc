class X2Effect_SuppressionDamage extends X2Effect_Shredder;

var array<int> Damage;

function WeaponDamageValue GetBonusEffectDamageValue(
    XComGameState_Ability AbilityState,
    XComGameState_Unit SourceUnit,
    XComGameState_Item SourceWeapon,
    StateObjectReference TargetRef)
{
    local WeaponDamageValue ReturnDamageValue;
    local int Tech;

    ReturnDamageValue = super.GetBonusEffectDamageValue(AbilityState, SourceUnit, SourceWeapon, TargetRef);

    Tech = `GetItemTech(SourceWeapon.GetMyTemplate());
    Tech = Clamp(Tech, 0, Damage.Length - 1);
    ReturnDamageValue.Damage += Damage[Tech];

    return ReturnDamageValue;
}

DefaultProperties
{
    bAllowFreeKill = false
    bAllowWeaponUpgrade = false
    bIgnoreBaseDamage = true
}