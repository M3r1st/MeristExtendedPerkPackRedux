class X2Effect_NoSquadsightPenalties extends X2Effect_Persistent implements(XMBEffectInterface);

function bool IgnoreSquadsightPenalty(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState)
{
    return true;
}

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
    local X2AbilityTemplate                 AbilityTemplate;
    local X2AbilityToHitCalc_StandardAim    StandardAim;
    local GameRulesCache_VisibilityInfo     VisInfo;
    local ShotModifierInfo                  AimInfo, CritInfo;
    local int                               Tiles;

    AbilityTemplate = AbilityState.GetMyTemplate();
    StandardAim = X2AbilityToHitCalc_StandardAim(AbilityTemplate.AbilityToHitCalc);

    if (StandardAim != none && !StandardAim.IsA('XMBAbilityToHitCalc_StandardAim'))
    {
        if (IgnoreSquadsightPenalty(EffectState, Attacker, Target, AbilityState))
        {
            if (!StandardAim.bIndirectFire)
            {
                if (`TACTICALRULES.VisibilityMgr.GetVisibilityInfo(Attacker.ObjectID, Target.ObjectID, VisInfo))
                {
                    if (VisInfo.bClearLOS && !VisInfo.bVisibleGameplay)
                    {
                        Tiles = Attacker.TileDistanceBetween(Target);
                        //  remove number of tiles within visible range (which is in meters, so convert to units, and divide that by tile size)
                        Tiles -= `METERSTOTILES(Attacker.GetVisibilityRadius());

                        AimInfo.ModType = eHit_Success;
                        AimInfo.Reason = class'XLocalizedData'.default.SquadsightMod;
                        AimInfo.Value = -1 * class'X2AbilityToHitCalc_StandardAim'.default.SQUADSIGHT_DISTANCE_MOD * (Tiles > 0 ? Tiles : 1);
                        ShotModifiers.AddItem(AimInfo);

                        if (StandardAim.bAllowCrit)
                        {
                            CritInfo.ModType = eHit_Crit;
                            CritInfo.Reason = class'XLocalizedData'.default.SquadsightMod;
                            CritInfo.Value = -1 * class'X2AbilityToHitCalc_StandardAim'.default.SQUADSIGHT_CRIT_MOD;
                            ShotModifiers.AddItem(CritInfo);
                        }
                    }
                }
            }
        }
    }
}

function bool GetTagValue(name Tag, XComGameState_Ability AbilityState, out string TagValue) { return false; }

function bool GetExtValue(LWTuple Data) { return false; }

function bool GetExtModifiers(name Type, XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, ShotBreakdown ShotBreakdown, out array<ShotModifierInfo> ShotModifiers)
{
    switch (Type)
    {
        case 'IgnoreSquadsightPenalty':
            return IgnoreSquadsightPenalty(EffectState, Attacker, Target, AbilityState);
    }

    return false;
}