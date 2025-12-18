class X2Condition_WantsReload extends X2Condition;

var EInventorySlot Slot;

event name CallAbilityMeetsCondition(XComGameState_Ability kAbility, XComGameState_BaseObject kTarget)
{
    local XComGameState_Unit UnitState;
    local XComGameState_Item ItemState;

    UnitState = XComGameState_Unit(kTarget);
    ItemState = UnitState.GetItemInSlot(Slot);

    if (ItemState == none)
    {
        return 'AA_WeaponIncompatible';
    }

    if (ItemState.Ammo >= ItemState.GetClipSize())
    {
        return 'AA_AmmoAlreadyFull';
    }

    return 'AA_Success';
}

defaultproperties
{
    Slot = eInvSlot_PrimaryWeapon
}