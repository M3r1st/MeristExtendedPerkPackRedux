class X2Effect_BolsteredWall extends X2Effect_Persistent;

var int DodgeBonus;
var array<name> AllowedEffects;

function GetToHitAsTargetModifiers(
    XComGameState_Effect EffectState,
    XComGameState_Unit Attacker,
    XComGameState_Unit Target,
    XComGameState_Ability AbilityState,
    class<X2AbilityToHitCalc> ToHitType,
    bool bMelee,
    bool bFlanking,
    bool bIndirectFire,
    out array<ShotModifierInfo> ShotModifiers)
{
    local ShotModifierInfo ShotInfo;

    if (ValidateEffects(Target))
    {
        ShotInfo.ModType = eHit_Graze;
        ShotInfo.Reason = FriendlyName;
        ShotInfo.Value = DodgeBonus;
        ShotModifiers.AddItem(ShotInfo);
    }
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

defaultproperties
{
    EffectName = F_BolsteredWall
}