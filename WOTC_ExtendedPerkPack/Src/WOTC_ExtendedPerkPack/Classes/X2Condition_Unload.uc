class X2Condition_Unload extends X2Condition;

event name CallAbilityMeetsCondition(XComGameState_Ability kAbility, XComGameState_BaseObject kTarget)
{
    local XComGameState_Item SourceWeapon;

    SourceWeapon = kAbility.GetSourceWeapon();

    if (SourceWeapon == none || SourceWeapon.HasInfiniteAmmo())
    {
        return 'AA_WeaponIncompatible';
    }

    return 'AA_Success';
}