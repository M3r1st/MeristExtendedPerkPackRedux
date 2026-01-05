class X2Effect_SensePanic extends X2Effect_Persistent;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
    local X2AbilityTemplate                 AbilityTemplate;
    local X2AbilityToHitCalc_StandardAim    StandardAim;
    local GameRulesCache_VisibilityInfo     VisInfo;
    local ShotModifierInfo                  ShotInfo;

    AbilityTemplate = AbilityState.GetMyTemplate();

    StandardAim = X2AbilityToHitCalc_StandardAim(AbilityTemplate.AbilityToHitCalc);

    if (StandardAim != none)
    {
        if (StandardAim.bIgnoreCoverBonus)
            return;

        if (Target.IsPanicked() || Target.IsDisoriented() || Target.IsDazed() || Target.IsStunned())
        {
            if (Target.CanTakeCover() && `TACTICALRULES.VisibilityMgr.GetVisibilityInfo(Attacker.ObjectID, Target.ObjectID, VisInfo))
            {
                if (Target.GetCurrentStat(eStat_AlertLevel) != 0 || Target.GetTeam() == eTeam_XCom)
                {
                    if (VisInfo.TargetCover == CT_Standing || VisInfo.TargetCover == CT_Midlevel && Target.bTreatLowCoverasHigh)
                    {
                        ShotInfo.ModType = eHit_Success;
                        ShotInfo.Reason = FriendlyName;
                        ShotInfo.Value = class'X2AbilityToHitCalc_StandardAim'.default.HIGH_COVER_BONUS / 2;
                        ShotModifiers.AddItem(ShotInfo);
                    }
                    else if (VisInfo.TargetCover == CT_Midlevel)
                    {
                        ShotInfo.ModType = eHit_Success;
                        ShotInfo.Reason = FriendlyName;
                        ShotInfo.Value = class'X2AbilityToHitCalc_StandardAim'.default.LOW_COVER_BONUS / 2;
                        ShotModifiers.AddItem(ShotInfo);
                    }
                }
            }
        }
    }
}