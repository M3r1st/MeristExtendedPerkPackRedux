class X2Effect_ChipAwayBonuses extends X2Effect_Persistent;

var array<int> ShredBonuses;

function int GetExtraShredValue(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData)
{
    local XComGameState_Item SourceWeapon;
    local int Tech;

    if (AbilityState.GetMyTemplateName() == 'F_ChipAway')
    {
        SourceWeapon = AbilityState.GetSourceWeapon();
        if (SourceWeapon != none)
        {
            Tech = `GetItemTech(SourceWeapon.GetMyTemplate());
            Tech = Clamp(Tech, 0, ShredBonuses.Length - 1);
            return ShredBonuses[Tech];
        }
    }

    return 0;
}

defaultproperties
{
    EffectName = F_ChipAway_Bonuses
    DuplicateResponse = eDupe_Ignore
}