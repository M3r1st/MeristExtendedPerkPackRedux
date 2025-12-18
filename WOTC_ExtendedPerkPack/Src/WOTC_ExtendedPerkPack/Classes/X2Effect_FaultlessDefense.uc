class X2Effect_FaultlessDefense extends X2Effect_Persistent;

var array<name> AllowedEffects;
var int EventPriority;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager EventMgr;
    local Object EffectObj;

    EventMgr = `XEVENTMGR;

    EffectObj = EffectGameState;

    /// EventID: PostModifyNewAbilityContext
    /// EventData: XComGameStateContext_Ability NewContext
    ///	EventSource: XComGameState_Ability AbilityState
    /// NewGameState: no
    EventMgr.RegisterForEvent(EffectObj, 'PostModifyNewAbilityContext', OnPostModifyNewAbilityContext, ELD_Immediate, EventPriority,,, EffectObj);
}

static function EventListenerReturn OnPostModifyNewAbilityContext(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackObject)
{
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Ability         AbilityState;
    local XComGameState_Effect          EffectState;
    local XComGameState_Unit            TargetState;
    local X2Effect_Persistent           Effect;
    local int Index;

    AbilityContext = XComGameStateContext_Ability(EventData);
    AbilityState = XComGameState_Ability(EventSource);
    EffectState = XComGameState_Effect(CallbackObject);

    if (AbilityContext == none || AbilityState == none || EffectState == none)
        return ELR_NoInterrupt;

    TargetState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

    if (TargetState == none)
        return ELR_NoInterrupt;

    Effect = EffectState.GetX2Effect();
    
    if (Effect.IsEffectCurrentlyRelevant(EffectState, TargetState))
    {
        if (AbilityContext.InputContext.PrimaryTarget.ObjectID == TargetState.ObjectID)
        {
            if (AbilityContext.ResultContext.HitResult == eHit_Crit)
            {
                AbilityContext.ResultContext.HitResult = eHit_Success;
            }
        }
        for (Index = 0; Index < AbilityContext.ResultContext.MultiTargetHitResults.Length; Index++)
        {
            if (AbilityContext.InputContext.MultiTargets[Index].ObjectID == TargetState.ObjectID)
            {
                if (AbilityContext.ResultContext.MultiTargetHitResults[Index] == eHit_Crit)
                {
                    AbilityContext.ResultContext.MultiTargetHitResults[Index] = eHit_Success;
                }
            }
        }
    }

    return ELR_NoInterrupt;
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

defaultproperties
{
    EffectName = F_FaultlessDefense
    DuplicateResponse = eDupe_Ignore

    EventPriority = 50
}