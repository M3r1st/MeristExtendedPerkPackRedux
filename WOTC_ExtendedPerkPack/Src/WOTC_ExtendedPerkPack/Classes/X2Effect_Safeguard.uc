class X2Effect_Safeguard extends X2Effect_PersistentAura;

var int DefenseBonus;
var int ShieldDefenseBonus;
var array<name> EffectsForShieldBonus;

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
    local XComGameState_Unit SourceUnit;
    local ShotModifierInfo ShotInfo;
    local name AffectedByEffectName;
    local bool bUseShieldBonus;

    if (IsEffectCurrentlyRelevant(EffectState, Target))
    {
        SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
        foreach EffectsForShieldBonus(AffectedByEffectName)
        {
            if (SourceUnit.AffectedByEffectNames.Find(AffectedByEffectName) != INDEX_NONE)
            {
                bUseShieldBonus = true;
                break;
            }
        }

        if (bUseShieldBonus)
        {
            ShotInfo.Value = -1 * ShieldDefenseBonus;
        }
        else
        {
            ShotInfo.Value = -1 * DefenseBonus;
        }
        ShotInfo.ModType = eHit_Success;
        ShotInfo.Reason = FriendlyName;
        ShotModifiers.AddItem(ShotInfo);
    }
}

defaultproperties
{
    EffectName = F_ShoulderToLeanOn
}