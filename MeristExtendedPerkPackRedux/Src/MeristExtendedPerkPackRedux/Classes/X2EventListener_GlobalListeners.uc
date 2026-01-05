class X2EventListener_GlobalListeners extends X2EventListener config(GameData_SoldierSkills);

var config bool bLog;
var config int EventPriority_OnPostMissionUpdateSoldierHealing;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;

    Templates.AddItem(CreateTacticalListeners());
    Templates.AddItem(CreateStrategyListeners());

    return Templates;
}

static function CHEventListenerTemplate CreateTacticalListeners()
{
    local CHEventListenerTemplate Template;

    `CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'F_TacticalListeners');
    Template.AddCHEvent('UnitBleedingOut', OnUnitBleedingOut, ELD_Immediate);

    Template.RegisterInTactical = true;

    return Template;
}

static function CHEventListenerTemplate CreateStrategyListeners()
{
    local CHEventListenerTemplate Template;

    `CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'F_StrategyListeners');

    Template.AddCHEvent('PostMissionUpdateSoldierHealing', OnPostMissionUpdateSoldierHealing, ELD_Immediate, default.EventPriority_OnPostMissionUpdateSoldierHealing);

    Template.RegisterInStrategy = true;

    return Template;
}

static function EventListenerReturn OnUnitBleedingOut(Object EventData, Object EventSource, XComGameState NewGameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit Unit;

    Unit = XComGameState_Unit(EventData);
    if (Unit != none)
    {
        if (Unit.IsBleedingOut() && Unit.GetBleedingOutTurnsRemaining() > 0)
        {
            Unit = XComGameState_Unit(NewGameState.ModifyStateObject(Unit.Class, Unit.ObjectID));
            Unit.SetUnitFloatValue(class'X2Effect_HealOnMissionEnd'.default.BleedoutValueName, 1, eCleanup_BeginTactical);
        }
    }

    return ELR_NoInterrupt;
}

static function EventListenerReturn OnPostMissionUpdateSoldierHealing(Object EventData, Object EventSource, XComGameState NewGameState, Name InEventID, Object CallbackData)
{
    local XComGameState_Unit    Unit;
    local UnitValue             UnitValue;
    local int AmountToHeal, CurrentHP, MaxHP;

    `LOG(GetFuncName(), class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());

    Unit = XComGameState_Unit(EventSource);

    if (Unit != none && Unit.GetUnitValue(class'X2Effect_HealOnMissionEnd'.default.HealValueName, UnitValue))
    {
        AmountToHeal = int(UnitValue.fValue);
        if (AmountToHeal > 0)
        {
            `LOG(Unit.GetFullName() $ " can be healed for " $ AmountToHeal $ " HP", class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
            Unit = XComGameState_Unit(NewGameState.ModifyStateObject(Unit.Class, Unit.ObjectID));
            if (class'X2Effect_HealOnMissionEnd'.static.IsEffectValidForTarget(Unit))
            {
                `LOG("Healing is valid for the target", class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
                `LOG("Previous LowestHP = " $ Unit.LowestHP, class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
                Unit.LowestHP = Min(Unit.HighestHP, Unit.LowestHP + AmountToHeal);
                `LOG("New LowestHP = " $ Unit.LowestHP, class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());

                CurrentHP = Unit.GetCurrentStat(eStat_HP);
                MaxHP = Unit.GetMaxStat(eStat_HP);
                if (CurrentHP < MaxHP)
                {
                    `LOG("Previous HP = " $ CurrentHP, class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
                    `LOG("Max HP = " $ MaxHP, class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
                    if (Unit.LowestHP < Unit.HighestHP && MaxHP > CurrentHP)
                    {
                        Unit.ModifyCurrentStat(eStat_HP, Min(AmountToHeal, MaxHP - CurrentHP - 1));
                    }
                    else
                    {
                        Unit.ModifyCurrentStat(eStat_HP, Min(AmountToHeal, MaxHP - CurrentHP));
                    }
                    
                    `LOG("New HP = " $ int(Unit.GetCurrentStat(eStat_HP)), class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
                }
            }
        }
        `LOG("Clearing the value", class'X2Effect_HealOnMissionEnd'.default.bLog, GetFuncName());
        Unit.ClearUnitValue(class'X2Effect_HealOnMissionEnd'.default.HealValueName);
    }

    return ELR_NoInterrupt;
}