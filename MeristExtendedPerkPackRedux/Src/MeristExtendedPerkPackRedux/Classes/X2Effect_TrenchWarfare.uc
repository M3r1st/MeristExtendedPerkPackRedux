class X2Effect_TrenchWarfare extends X2Effect_Persistent config(GameData_SoldierSkills);

var int EventPriority;
var name CountValueName;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local XComGameState_Unit    UnitState;
    local XComGameState_Player  PlayerState;
    local X2EventManager        EventMgr;
    local Object                EffectObj;

    UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

    if (UnitState != none)
    {
        PlayerState = XComGameState_Player(`XCOMHISTORY.GetGameStateForObjectID(UnitState.ControllingPlayer.ObjectID));

        if (PlayerState != none)
        {
            EventMgr = `XEVENTMGR;

            EffectObj = EffectGameState;
        
            EventMgr.RegisterForEvent(EffectObj, 'KillMail', TrenchWarfare_KillMailListener, ELD_OnStateSubmitted,, UnitState,, EffectObj);
            EventMgr.RegisterForEvent(EffectObj, 'PlayerTurnEnded', TrenchWarfare_TurnEndListener, ELD_OnStateSubmitted, EventPriority, PlayerState,, EffectObj);
        }
    }
}

static function EventListenerReturn TrenchWarfare_KillMailListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit        Killer;
    local XComGameState_Effect      EffectState;
    local X2Effect_TrenchWarfare    Effect;
    local XComGameState             NewGameState;
    local UnitValue                 UnitValue;

    Killer = XComGameState_Unit(EventSource);
    EffectState = XComGameState_Effect(CallbackData);

    if (Killer != none && EffectState != none)
    {
        Effect = X2Effect_TrenchWarfare(EffectState.GetX2Effect());
        if (Effect != none)
        {
            Killer.GetUnitValue(Effect.CountValueName, UnitValue);
            if (UnitValue.fValue <= 0)
            {
                NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));
                Killer = XComGameState_Unit(NewGameState.ModifyStateObject(Killer.Class, Killer.ObjectID));
                Killer.SetUnitFloatValue(Effect.CountValueName, UnitValue.fValue + 1, eCleanup_BeginTurn);
                `TACTICALRULES.SubmitGameState(NewGameState);
            }
        }
    }

    return ELR_NoInterrupt;
}

static function EventListenerReturn TrenchWarfare_TurnEndListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateHistory          History;
    local XComGameState_Effect          EffectState;
    local X2Effect_TrenchWarfare        Effect;
    local XComGameState_Unit            UnitState;
    local UnitValue                     UnitValue;

    local XComGameState                 NewGameState;
    local XComGameState_Ability         AbilityState;
    local StateObjectReference          AbilityRef;
    local X2AbilityTemplate             AbilityTemplate;
    local X2AbilityCost                 Cost;
    local X2AbilityCost_ActionPoints    ActionPointCost;

    History = `XCOMHISTORY;

    EffectState = XComGameState_Effect(CallbackData);

    if (EffectState != none)
    {
        Effect = X2Effect_TrenchWarfare(EffectState.GetX2Effect());
        UnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
        if (UnitState != none && Effect != none)
        {
            if (UnitState.GetUnitValue(Effect.CountValueName, UnitValue) && UnitValue.fValue > 0)
            {
                foreach UnitState.Abilities(AbilityRef)
                {
                    AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(AbilityRef.ObjectID));
                    if (AbilityState != none)
                    {
                        AbilityTemplate = AbilityState.GetMyTemplate();

                        foreach AbilityTemplate.AbilityCosts(Cost)
                        {
                            ActionPointCost = X2AbilityCost_ActionPoints(Cost);
                            if (ActionPointCost != none && ActionPointCost.AllowedTypes.Find(class'X2CharacterTemplateManager'.default.DeepCoverActionPoint) != INDEX_NONE)
                            {
                                if (AbilityState.CanActivateAbility(UnitState,, true) == 'AA_Success')
                                {
                                    if (UnitState.NumActionPoints() == 0)
                                    {
                                        NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));
                                        UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
                                        UnitState.ActionPoints.AddItem(class'X2CharacterTemplateManager'.default.DeepCoverActionPoint);
                                        `TACTICALRULES.SubmitGameState(NewGameState);
                                    }

                                    return AbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return ELR_NoInterrupt;
}

defaultproperties
{
    EffectName = F_TrenchWarfare
    DuplicateResponse = eDupe_Ignore

    CountValueName = F_TrenchWarfare_KillsThisTurn
    EventPriority = 55
}