
class X2Effect_PerfectGuard extends X2Effect_BonusArmor;

var array<name> AllowedEffects;
var int ArmorBonus;

function int GetArmorChance(XComGameState_Effect EffectState, XComGameState_Unit UnitState)
{
    return 100;
}

function int GetArmorMitigation(XComGameState_Effect EffectState, XComGameState_Unit UnitState)
{
    if (IsEffectCurrentlyRelevant(EffectState, UnitState))
    {
        return ArmorBonus;
    }

    return 0;
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    local name AllowedEffectName;

    foreach AllowedEffects(AllowedEffectName)
    {
        if (TargetUnit.AffectedByEffectNames.Find(AllowedEffectName) != INDEX_NONE)
        {
            return true;
        }
    }

    return false;
}