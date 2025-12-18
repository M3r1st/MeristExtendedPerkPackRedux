//---------------------------------------------------------------------------------------
//  FILE:    X2Effect_EPPAdditionalSmokeEffect.uc
//  AUTHOR:  Merist
//  PURPOSE: Pseudo-interface for effects that should apply to units in the area of the smoke grenades.
//           Expects effect-specific X2Effect_EPPApplyAdditionalSmokeEffectToWorld classes to be present.
//---------------------------------------------------------------------------------------
class X2Effect_EPPAdditionalSmokeEffect extends X2Effect_Persistent config(GameData_SoldierSkills) abstract;

var class<X2Effect_EPPApplyAdditionalSmokeEffectToWorld> WorldEffectClass;

var localized string strEffectBonusName;
var localized string strEffectBonusDesc;

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    return TargetUnit.IsInWorldEffectTile(default.WorldEffectClass.Name);
}

defaultproperties
{
    DuplicateResponse = eDupe_Refresh

    WorldEffectClass = class'X2Effect_EPPApplyAdditionalSmokeEffectToWorld'
}