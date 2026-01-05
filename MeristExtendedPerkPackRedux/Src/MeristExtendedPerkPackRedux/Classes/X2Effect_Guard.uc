class X2Effect_Guard extends X2Effect_Persistent;

var name CountValueName;

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{
    local UnitValue         ParryUnitValue;
    local XComGameState     NewGameState;

    if (TargetUnit.GetUnitValue(CountValueName, ParryUnitValue) && TargetUnit.IsAbleToAct())
    {
        if (ParryUnitValue.fValue > 0)
        {
            NewHitResult = eHit_Parry;

            NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));
            TargetUnit.SetUnitFloatValue(CountValueName, ParryUnitValue.fValue - 1);
            TargetUnit = XComGameState_Unit(NewGameState.ModifyStateObject(TargetUnit.Class, TargetUnit.ObjectID));
            `TACTICALRULES.SubmitGameState(NewGameState);

            return true;
        }
    }

    return false;
}

defaultproperties
{
    EffectName = F_Guard
    DuplicateResponse = eDupe_Ignore

    CountValueName = F_Guard_Counter
}