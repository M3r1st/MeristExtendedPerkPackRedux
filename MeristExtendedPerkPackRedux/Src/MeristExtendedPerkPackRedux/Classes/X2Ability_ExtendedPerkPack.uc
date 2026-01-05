class X2Ability_ExtendedPerkPack extends X2AbilityHelpers config(GameData_SoldierSkills);

var config array<name> LikeLightning_RunAndGunAbilities;
var config array<name> LikeLightning_AllowedAbilities;
var config array<name> QuickPatch_AllowedAbilities;
var config array<name> LickYourWounds_AllowedAbilities;
var config array<name> ThousandsToGo_ExcludeCharacterGroups;
var config array<name> Recharge_ExcludeCharacterGroups;
var config array<name> Imposition_AllowedAbilities;
var config array<name> TrenchWarfare_AllowedAbilities;
var config array<name> Compensation_AllowedAbilities;
var config array<name> Botnet_AllowedAbilities;
var config array<name> ReadyForAnything_AllowedAbilities;
var config array<name> AmmoConservation_ExcludeAbilities;
var config array<name> FieldMedic_AllowedItems;
var config array<name> Bloodlet_AllowedAbilities;
var config array<name> SaltInTheWound_AllowedEffects;
var config array<name> Havoc_AllowedAbilities;
var config array<name> Finesse_IncludeAbilities;
var config array<name> ShoulderToLeanOn_EffectsForShieldBonus;
var config array<name> ProtectAndServe_AllowedAbilities;
var config array<name> BolsteredWall_AllowedEffects;
var config array<name> FaultlessDefense_AllowedEffects;
var config array<name> Adrenaline_ExcludeCharacterGroups;
var config array<name> WatchThemRun_AllowedAbilities;
var config array<name> ShieldTrauma_IncludeAbilities;
var config array<name> ColdBlooded_AllowedAbilities;
var config array<name> ColdBlooded_AllowedEffects;
var config array<name> ControlledFire_AllowedAbilities;
var config array<name> PerfectGuard_AllowedEffects;
var config array<name> SuppressingFire_AllowedAbilities;
var config array<name> Safeguard_EffectsForShieldBonus;
var config array<EInventorySlot> StrongBack_ApplyToSlots;
var config array<name> CoordinateFire_IncludeAbilities;
var config array<name> PackTactics_AllowedEffects;

var localized string LikeLightning_RefundAvailableText;
var localized string PierceTheVeil_BuffText;
var localized string PierceTheVeil_DebuffText;
var localized string Imposition_DebuffText;
var localized string Botnet_BuffText;
var localized string Immunize_BuffText;
var localized string BleedingFriendlyDesc;
var localized string BlindingFire_DebuffText;
var localized string ShoulderToLeanOn_BuffText;
var localized string CoverArea_BuffText;
var localized string Safeguard_BuffText;
var localized string Rampart_BuffText;

var privatewrite name SuppressingFireActionPoint;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;

    Templates.AddItem(ShootAnyone());
    Templates.AddItem(ChipAway());
    /*>>*/Templates.AddItem(ChipAwayBonuses());
    Templates.AddItem(Concentration());
    Templates.AddItem(LikeLightning());
    /*>>*/Templates.AddItem(LikeLightningRefund());
    Templates.AddItem(StationaryThreat());
    Templates.AddItem(Opportunist());
    Templates.AddItem(Maim());
    Templates.AddItem(QuickPatch());
    Templates.AddItem(Preservation());
    /*>>*/Templates.AddItem(PreservationPassive());
    Templates.AddItem(LickYourWounds());
    /*>>*/Templates.AddItem(LickYourWoundsPassive());
    Templates.AddItem(Momentum());
    Templates.AddItem(ThousandsToGo());
    /*>>*/Templates.AddItem(ThousandsToGoPassive());
    Templates.AddItem(Recharge());
    /*>>*/Templates.AddItem(RechargePassive());
    Templates.AddItem(PierceTheVeil());
    Templates.AddItem(TheBiggerTheyAre());
    Templates.AddItem(CallForFire());
    Templates.AddItem(LockNLoad());
    /*>>*/Templates.AddItem(LockNLoadPassive());
    Templates.AddItem(Imposition());
    Templates.AddItem(TrenchWarfare());
    /*>>*/Templates.AddItem(TrenchWarfareActivation());
    /*>>*/Templates.AddItem(TrenchWarfarePassive());
    Templates.AddItem(Compensation());
    Templates.AddItem(FirstStrike());
    Templates.AddItem(DisablingShot());
    Templates.AddItem(Blend());
    Templates.AddItem(Botnet());
    Templates.AddItem(ReadyForAnything());
    /*>>*/Templates.AddItem(ReadyForAnythingPassive());
    Templates.AddItem(Resupply());
    Templates.AddItem(Immunize());
    Templates.AddItem(Rush());
    Templates.AddItem(AmmoConservation());
    Templates.AddItem(WellProtected());
    Templates.AddItem(Dedication());
    Templates.AddItem(Triage());
    Templates.AddItem(Steadfast());
    Templates.AddItem(Corpsman());
    Templates.AddItem(FieldMedic());
    Templates.AddItem(Stimulate());
    Templates.AddItem(Bloodlet());
    Templates.AddItem(BlindingFire());
    Templates.AddItem(QuickFeet());
    /*>>*/Templates.AddItem(QuickFeetPassive());
    Templates.AddItem(CombatDrugs());
    Templates.AddItem(SaltInTheWound());
    Templates.AddItem(Unload());
    /*>>*/Templates.AddItem(Unload2());
    /*>>*/Templates.AddItem(UnloadDamage());
    Templates.AddItem(Ambush());
    /*>>*/Templates.AddItem(AmbushShot());
    Templates.AddItem(Renewal());
    /*>>*/Templates.AddItem(RenewalPassive());
    Templates.AddItem(WarningShot());
    Templates.AddItem(OpenFire());
    Templates.AddItem(Havoc());
    Templates.AddItem(Finesse());
    Templates.AddItem(ShoulderToLeanOn());
    /*>>*/Templates.AddItem(ShoulderToLeanOnPassive());
    Templates.AddItem(BolsteredWall());
    Templates.AddItem(ProtectAndServe());
    /*>>*/Templates.AddItem(ProtectAndServePassive());
    Templates.AddItem(FaultlessDefense());
    Templates.AddItem(Adrenaline());
    /*>>*/Templates.AddItem(AdrenalinePassive());
    Templates.AddItem(WatchThemRun());
    /*>>*/Templates.AddItem(WatchThemRunPassive());
    Templates.AddItem(WatchThemRun2());
    /*>>*/Templates.AddItem(WatchThemRun2Activation());
    /*>>*/Templates.AddItem(WatchThemRun2Passive());
    Templates.AddItem(CoverArea());
    /*>>*/Templates.AddItem(CoverAreaPassive());
    Templates.AddItem(Rally());
    Templates.AddItem(ShieldTrauma());
    Templates.AddItem(Avenger());
    /*>>*/Templates.AddItem(AvengerShot());
    Templates.AddItem(FireFirst());
    /*>>*/Templates.AddItem(FireFirstShot());
    Templates.AddItem(Flatline());
    Templates.AddItem(ColdBlooded());
    Templates.AddItem(Predator());
    Templates.AddItem(Survivor());
    Templates.AddItem(RegenerativeMist());
    Templates.AddItem(ControlledFire());
    Templates.AddItem(Stiletto());
    Templates.AddItem(StayCovered());
    Templates.AddItem(Indomitable());
    Templates.AddItem(PerfectGuard());
    Templates.AddItem(ShieldRegeneration());
    /*>>*/Templates.AddItem(ShieldRegenerationPassive());
    Templates.AddItem(CalmMind());
    Templates.AddItem(SuppressingFire());
    /*>>*/Templates.AddItem(SuppressingFireAddActions());
    /*>>*/Templates.AddItem(SuppressingFireRemoveActions());
    Templates.AddItem(PutEmDown());
    Templates.AddItem(WillToSurvive());
    Templates.AddItem(WatchfulEye());
    /*>>*/Templates.AddItem(WatchfulEyeShot());
    Templates.AddItem(Guard());
    /*>>*/Templates.AddItem(GuardPassive());
    Templates.AddItem(TradeFire());
    /*>>*/Templates.AddItem(TradeFireShot());
    Templates.AddItem(Safeguard());
    /*>>*/Templates.AddItem(SafeguardPassive());
    Templates.AddItem(Intimidate());
    /*>>*/Templates.AddItem(IntimidateTrigger());
    Templates.AddItem(Rampart());
    /*>>*/Templates.AddItem(RampartTrigger());
    /*>>*/Templates.AddItem(RampartPassive());
    Templates.AddItem(StrongBack());
    Templates.AddItem(CoordinateFire());
    /*>>*/Templates.AddItem(CoordinateFireShot());
    Templates.AddItem(PackTactics());
    /*>>*/Templates.AddItem(PackTacticsPassive());
    Templates.AddItem(Parry());
    /*>>*/Templates.AddItem(ParryAttack());
    /*>>*/Templates.AddItem(ParryPreparation());
    /*>>*/Templates.AddItem(ParryCounterattack());
    Templates.AddItem(MindBlast());
    /*>>*/Templates.AddItem(MindBlastAnims());
    Templates.AddItem(SensePanic());
    Templates.AddItem(OverExertion());
    Templates.AddItem(RiotControl());

    return Templates;
}

// For testing purposes. Useful for seeing if defensive bonuses apply properly.
static function X2AbilityTemplate ShootAnyone()
{
    local X2AbilityTemplate         Template;
    local X2Condition_Visibility    VisibilityCondition;

    Template = Attack('F_ShootAnyone', "img:///UILibrary_LW_PerkPack.LW_Ability_WalkingFire", false, true, true, true);

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    AddActionPointCost(Template, eCost_Free);
    AddAmmoCost(Template, 1);

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = true;

    Template.AbilityTargetConditions.Length = 0;
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingTargetOnlyProperty);

    return Template;
}

// Chip Away
// (AbilityName="F_ChipAway", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that shreds additional armor. Cooldown-based.
static function X2AbilityTemplate ChipAway()
{
    local X2AbilityTemplate Template;

    Template = Attack('F_ChipAway', "img:///UILibrary_FavidsPerkPack.UIPerk_ChipAway", `GetConfigBool("F_ChipAway_bAWC"), true);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_ChipAway_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_ChipAway_AmmoCost"));

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_ChipAway_Bonuses');

    return Template;
}

static function X2AbilityTemplate ChipAwayBonuses()
{
    local X2AbilityTemplate         Template;
    local X2Effect_ChipAwayBonuses  Effect;

    Template = Passive('F_ChipAway_Bonuses', "img:///UILibrary_FavidsPerkPack.UIPerk_ChipAway", false, false, true);

    Effect = new class'X2Effect_ChipAwayBonuses';
    Effect.ShredBonuses = `GetConfigArrayInt("F_ChipAway_ShredBonuses");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Concentration
// (AbilityName="F_Concentration")
// Your grazing shots are automatically upgraded to normal hits. Passive.
static function X2AbilityTemplate Concentration()
{
    local X2AbilityTemplate         Template;
    local X2Effect_ChangeHitResultForAttacker Effect;

    Template = Passive('F_Concentration', "img:///UILibrary_FavidsPerkPack.UIPerk_Concentration", `GetConfigBool("F_Concentration_bAWC"), true, true);

    Effect = new class'X2Effect_ChangeHitResultForAttacker';
    Effect.EffectName = 'F_Concentration';
    Effect.DuplicateResponse = eDupe_Ignore;
    Effect.ChangeHitResults[eHit_Graze] = eHit_Success;
    Effect.bShowFlyover = `GetConfigBool("F_Concentration_bShowFlyover");
    Effect.FlyoverEventName = 'F_Concentration_Flyover';
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Like Lightning
// (AbilityName="F_LikeLightning", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// When Run and Gun is activated, your Arc Thrower cooldown is immediately removed and your next Arc Thrower shot that turn does not cost an action. Passive.
static function X2AbilityTemplate LikeLightning()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_ReduceCooldowns          ReduceCooldownEffect;
    local X2Effect_Persistent               PersistentEffect;
    local X2Effect_SetUnitValue             SetValueEffect;

    Template = SelfTargetTrigger('F_LikeLightning', "img:///UILibrary_XPerkIconPack.UIPerk_lightning_chevron");

    Template.bCrossClassEligible = `GetConfigBool("F_LikeLightning_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_LikeLightning;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    ReduceCooldownEffect = new class'X2Effect_ReduceCooldowns';
    ReduceCooldownEffect.ReduceAll = true;
    ReduceCooldownEffect.AbilitiesToTick = default.LikeLightning_AllowedAbilities;
    Template.AddTargetEffect(ReduceCooldownEffect);

    PersistentEffect = new class'X2Effect_Persistent';
    PersistentEffect.EffectName = class'X2Effect_LikeLightning'.default.RequiredEffectName;
    PersistentEffect.DuplicateResponse = eDupe_Refresh;
    PersistentEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
    PersistentEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(PersistentEffect);

    SetValueEffect = new class'X2Effect_SetUnitValue';
    SetValueEffect.UnitName = class'X2Effect_LikeLightning'.default.CountValueName;
    SetValueEffect.NewValueToSet = 0;
    SetValueEffect.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(SetValueEffect);

    Template.bShowActivation = true;

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    Template.AdditionalAbilities.AddItem('F_LikeLightning_Refund');

    return Template;
}

static function X2AbilityTemplate LikeLightningRefund()
{
    local X2AbilityTemplate         Template;
    local X2Effect_LikeLightning    Effect;

    Template = Passive('F_LikeLightning_Refund', "img:///UILibrary_XPerkIconPack.UIPerk_lightning_chevron", false, true, true);

    Effect = new class'X2Effect_LikeLightning';
    Effect.EffectName = 'F_LikeLightning';
    Effect.AllowedAbilities = default.LikeLightning_AllowedAbilities;
    Effect.bShowFlyover = `GetConfigBool("F_LikeLightning_bShowFlyover");
    Effect.bAllowCBACOverride = `GetConfigBool("F_LikeLightning_bAllowCBACOverride");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.LikeLightning_RefundAvailableText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_LikeLightning(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Ability         ActivatedAbilityState;
    local XComGameState_Ability         CallbackAbilityState;
    local XComGameStateContext_Ability  AbilityContext;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        ActivatedAbilityState = XComGameState_Ability(EventData);
        CallbackAbilityState = XComGameState_Ability(CallbackData);

        if (default.LikeLightning_RunAndGunAbilities.Find(ActivatedAbilityState.GetMyTemplateName()) != INDEX_NONE)
        {

            return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
        }
    }

    return ELR_NoInterrupt;
}

// Stationary Threat
// (AbilityName="F_StationaryThreat", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Gain bonus damage to your primary weapon for each turn that you do not move.
static function X2AbilityTemplate StationaryThreat()
{
    local X2AbilityTemplate Template;
    local X2Effect_StationaryThreat Effect;

    Template = Passive('F_StationaryThreat', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_blaze", `GetConfigBool("F_StationaryThreat_bAWC"), true, false);

    Effect = new class'X2Effect_StationaryThreat';
    Effect.DamagePerTurn = `GetConfigInt("F_StationaryThreat_DamagePerTurn");
    Effect.MaxTurns = `GetConfigInt("F_StationaryThreat_MaxTurns");
    Effect.StartingValue = `GetConfigInt("F_StationaryThreat_StartingValue");
    Effect.bMatchSourceWeapon = `GetConfigBool("F_StationaryThreat_bMatchSourceWeapon");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Opportunist
// (AbilityName="F_Opportunist")
// Reaction fire shots ignore half of cover bonuses
static function X2AbilityTemplate Opportunist()
{
    local X2AbilityTemplate         Template;
    local X2Effect_Opportunist      Effect;

    Template = Passive('F_Opportunist', "img:///UILibrary_FavidsPerkPack.UIPerk_Opportunist", `GetConfigBool("F_Opportunist_bAWC"), true, false);

    Effect = new class'X2Effect_Opportunist';
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Maim
// (AbilityName="F_Maim", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that immobilizes the target until the end of their next turn. Cooldown-based.
static function X2AbilityTemplate Maim()
{
    local X2AbilityTemplate         Template;
    local X2Effect_Immobilize       Effect;

    Template = Attack('F_Maim', "img:///UILibrary_FavidsPerkPack.UIPerk_Maim", `GetConfigBool("F_Maim_bAWC"), true);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Maim_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_Maim_AmmoCost"));

    Effect = new class'X2Effect_Immobilize';
    Effect.EffectName = 'F_Maim_Immobilize';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.AddPersistentStatChange(eStat_Mobility, 0, MODOP_Multiplication);
    Effect.BuildPersistentEffect(`GetConfigInt("F_Maim_Duration"), false, true, false, eGameRule_PlayerTurnEnd);
    Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    Effect.VisualizationFn = EffectFlyoverVisualization;
    Template.AddTargetEffect(Effect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Quick Patch
// (AbilityName="F_QuickPatch")
// Using a Medikit does not cost an action. Passive.
static function X2AbilityTemplate QuickPatch()
{
    local X2AbilityTemplate             Template;
    local X2Effect_RefundActionPoints   Effect;

    Template = Passive('F_QuickPatch', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_chevron", `GetConfigBool("F_QuickPatch_bAWC"), true, true);

    Effect = new class'X2Effect_RefundActionPoints';
    Effect.EffectName = 'F_QuickPatch';
    Effect.AllowedAbilities = default.QuickPatch_AllowedAbilities;
    Effect.ActivationsPerTurn = `GetConfigInt("F_QuickPatch_ActivationsPerTurn");
    Effect.CountValueName = 'F_QuickPatch_Activations';
    Effect.bShowFlyover = `GetConfigBool("F_QuickPatch_bShowFlyover");
    Effect.FlyoverEventName = 'F_QuickPatch_Flyover';
    Effect.bAllowCBACOverride = `GetConfigBool("F_QuickPatch_bAllowCBACOverride");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Preservation
// (AbilityName="F_Preservation")
// When your concealment is broken, gain a bonus to defense for a few turns. Passive.
static function X2AbilityTemplate Preservation()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_PersistentStatChange     DefenseEffect;

    Template = SelfTargetTrigger('F_Preservation', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_defense2");

    Template.bCrossClassEligible = `GetConfigBool("F_Preservation_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'UnitConcealmentBroken';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    DefenseEffect = new class'X2Effect_PersistentStatChange';
    DefenseEffect.EffectName = 'F_Preservation';
    DefenseEffect.DuplicateResponse = eDupe_Refresh;
    DefenseEffect.AddPersistentStatChange(eStat_Defense, `GetConfigInt("F_Preservation_DefenseBonus"));
    DefenseEffect.BuildPersistentEffect(`GetConfigInt("F_Preservation_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    DefenseEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    // DefenseEffect.VisualizationFn = EffectFlyoverVisualization;
    Template.AddTargetEffect(DefenseEffect);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_Preservation_Passive');

    return Template;
}

static function X2AbilityTemplate PreservationPassive()
{
    return Passive('F_Preservation_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_defense2", false, true, true);
}

// Lick Your Wounds
// (AbilityName="F_LickYourWounds")
// Hunker Down restores some health and removes poison, burning, and acid burning. Passive.
static function X2AbilityTemplate LickYourWounds()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_ApplyHeal                HealEffect;

    Template = SelfTargetTrigger('F_LickYourWounds', "img:///UILibrary_FavidsPerkPack.UIPerk_LickYourWounds");

    Template.bCrossClassEligible = `GetConfigBool("F_LickYourWounds_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_LickYourWounds;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    // Restore health effect
    HealEffect = new class'X2Effect_ApplyHeal';
    HealEffect.HealAmount = `GetConfigInt("F_LickYourWounds_HealAmount");
    HealEffect.MaxHealAmount = `GetConfigInt("F_LickYourWounds_MaxHealAmount");
    HealEffect.HealthRegeneratedName = 'F_LickYourWounds_Heal';
    Template.AddTargetEffect(HealEffect);

    // Heal the status effects that a Medkit would heal
    Template.AddTargetEffect(class'X2Ability_SpecialistAbilitySet'.static.RemoveAllEffectsByDamageType());

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_LickYourWounds_Passive');

    return Template;
}

static function X2AbilityTemplate LickYourWoundsPassive()
{
    return Passive('F_LickYourWounds_Passive', "img:///UILibrary_FavidsPerkPack.UIPerk_LickYourWounds", false, true, true);
}

static function EventListenerReturn AbilityTriggerEventListener_LickYourWounds(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Ability         ActivatedAbilityState;
    local XComGameState_Ability         CallbackAbilityState;
    local XComGameStateContext_Ability  AbilityContext;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        ActivatedAbilityState = XComGameState_Ability(EventData);
        CallbackAbilityState = XComGameState_Ability(CallbackData);

        if (default.LickYourWounds_AllowedAbilities.Find(ActivatedAbilityState.GetMyTemplateName()) != INDEX_NONE)
        {

            return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
        }
    }

    return ELR_NoInterrupt;
}

// Momentum
// (AbilityName="F_Momentum", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Grants increased aim and critical chance if you have moved this turn. Passive.
static function X2AbilityTemplate Momentum()
{
    local X2AbilityTemplate     Template;
    local X2Effect_Momentum     Effect;

    Template = Passive('F_Momentum', "img:///UILibrary_FavidsPerkPack.UIPerk_Momentum", `GetConfigBool("F_Momentum_bAWC"), true, true);

    Effect = new class'X2Effect_Momentum';
    Effect.EffectName = 'F_Momentum';
    Effect.AimBonus = `GetConfigInt("F_Momentum_AimBonus");
    Effect.CritBonus = `GetConfigInt("F_Momentum_CritBonus");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Thousands To Go
// (AbilityName="F_ThousandsToGo", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Once per turn, after killing an enemy with your primary weapon, you may take an additional non-movement action. Passive.
static function X2AbilityTemplate ThousandsToGo()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_GrantActionPoints        Effect;

    Template = SelfTargetTrigger('F_ThousandsToGo', "img:///UILibrary_FavidsPerkPack.UIPerk_ThousandsToGo");

    Template.bCrossClassEligible = `GetConfigBool("F_ThousandsToGo_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'KillMail';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_ThousandsToGo;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    Effect = new class'X2Effect_GrantActionPoints';
    Effect.NumActionPoints = 1;
    Effect.PointType = class'X2CharacterTemplateManager'.default.RunAndGunActionPoint;
    Template.AddTargetEffect(Effect);

    AddUnitValueCondition(Template, 'F_ThousandsToGo_Activations', `GetConfigInt("F_ThousandsToGo_ActivationsPerTurn"));

    Template.bShowActivation = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_ThousandsToGo_Passive');

    return Template;
}

static function X2AbilityTemplate ThousandsToGoPassive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_ThousandsToGo_Passive', "img:///UILibrary_FavidsPerkPack.UIPerk_ThousandsToGo", false, true, true);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_ThousandsToGo(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Ability         CallbackAbilityState;
    local XComGameState_Unit            SourceUnit;
    local XComGameState_Unit            TargetUnit;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        SourceUnit = XComGameState_Unit(EventSource);

        if (class'X2AbilityHelpers'.static.IsUnitInterruptingEnemyTurn(SourceUnit))
        {
            return ELR_NoInterrupt;
        }

        if (CallbackAbilityState.SourceWeapon.ObjectID == AbilityContext.InputContext.ItemObject.ObjectID)
        {
            TargetUnit = XComGameState_Unit(EventData);
            if (TargetUnit != none)
            {
                if (default.ThousandsToGo_ExcludeCharacterGroups.Find(TargetUnit.GetMyTemplateGroupName()) == INDEX_NONE)
                {
                    return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
                }
            }
        }
    }

    return ELR_NoInterrupt;
}

// Recharge
// (AbilityName="F_Recharge", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Killing an enemy with your primary weapon reduces the cooldown of all abilities. Passive.
static function X2AbilityTemplate Recharge()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_ReduceCooldowns          Effect;

    Template = SelfTargetTrigger('F_Recharge', "img:///UILibrary_FavidsPerkPack.UIPerk_Recharge");

    Template.bCrossClassEligible = `GetConfigBool("F_Recharge_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'KillMail';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_Recharge;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    Effect = new class'X2Effect_ReduceCooldowns';
    Effect.Amount = `GetConfigInt("F_Recharge_CooldownReduction");
    Effect.ReduceAll = false;
    Template.AddTargetEffect(Effect);

    AddUnitValueCondition(Template, 'F_Recharge_Activations', `GetConfigInt("F_Recharge_ActivationsPerTurn"));

    Template.bShowActivation = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_Recharge_Passive');

    return Template;
}

static function X2AbilityTemplate RechargePassive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_Recharge_Passive', "img:///UILibrary_FavidsPerkPack.UIPerk_Recharge", false, true, true);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_Recharge(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Ability         CallbackAbilityState;
    local XComGameState_Unit            TargetUnit;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        if (CallbackAbilityState.SourceWeapon.ObjectID == AbilityContext.InputContext.ItemObject.ObjectID)
        {
            TargetUnit = XComGameState_Unit(EventData);
            if (TargetUnit != none)
            {
                if (default.Recharge_ExcludeCharacterGroups.Find(TargetUnit.GetMyTemplateGroupName()) == INDEX_NONE)
                {
                    return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
                }
            }
        }
    }

    return ELR_NoInterrupt;
}

// Pierce The Veil
// (AbilityName="F_PierceTheVeil", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// WAS: Activated ability that confers bonus aim, damage, and armor piercing to organic targets with your primary weapon, while increasing the cooldown of all of your other abilities. Cooldown-based.
static function X2AbilityTemplate PierceTheVeil()
{
    local X2AbilityTemplate             Template;
    local X2Effect_PierceTheVeil        Effect;
    local X2Effect_PierceTheVeil_Debuff DebuffEffect;
    
    Template = SelfTargetActivated('F_PierceTheVeil', "img:///UILibrary_FavidsPerkPack.UIPerk_AmplifiedShot", `GetConfigBool("F_PierceTheVeil_bAWC"));
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_PierceTheVeil_Cooldown"));
    AddActionPointCost(Template, eCost_Free);

    Template.AddShooterEffectExclusions();

    Effect = new class'X2Effect_PierceTheVeil';
    Effect.EffectName = 'F_PierceTheVeil';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.AimBonus = `GetConfigInt("F_PierceTheVeil_AimBonus");
    Effect.CritBonus = `GetConfigInt("F_PierceTheVeil_CritBonus");
    Effect.DamageBonus = `GetConfigInt("F_PierceTheVeil_DamageBonus");
    Effect.PierceBonus = `GetConfigInt("F_PierceTheVeil_PierceBonus");
    Effect.bMatchSourceWeapon = true;
    Effect.BuildPersistentEffect(`GetConfigInt("F_PierceTheVeil_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.PierceTheVeil_BuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    DebuffEffect = new class'X2Effect_PierceTheVeil_Debuff';
    DebuffEffect.EffectName = 'F_PierceTheVeil_Debuff';
    DebuffEffect.DuplicateResponse = eDupe_Refresh;
    DebuffEffect.AsTargetAimBonus = `GetConfigInt("F_PierceTheVeil_AsTargetAimBonus");
    DebuffEffect.AsTargetCritBonus = `GetConfigInt("F_PierceTheVeil_AsTargetCritBonus");
    DebuffEffect.AsTargetDamageBonus = `GetConfigInt("F_PierceTheVeil_AsTargetDamageBonus");
    DebuffEffect.ArmorPenalty = `GetConfigInt("F_PierceTheVeil_ArmorPenalty");
    DebuffEffect.BuildPersistentEffect(`GetConfigInt("F_PierceTheVeil_DebuffDuration"), false, true, false, eGameRule_PlayerTurnBegin);
    DebuffEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.PierceTheVeil_DebuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(DebuffEffect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// The Bigger They Are
// (AbilityName="F_TheBiggerTheyAre")
// Grants increased aim against targets that cannot take cover. Passive.
static function X2AbilityTemplate TheBiggerTheyAre()
{
    local X2AbilityTemplate         Template;
    local X2Effect_TheBiggerTheyAre Effect;

    Template = Passive('F_TheBiggerTheyAre', "img:///UILibrary_FavidsPerkPack.UIPerk_TheBiggerTheyAre", `GetConfigBool("F_TheBiggerTheyAre_bAWC"), true, true);

    Effect = new class'X2Effect_TheBiggerTheyAre';
    Effect.EffectName = 'F_TheBiggerTheyAre';
    Effect.AimBonus = `GetConfigInt("F_TheBiggerTheyAre_AimBonus");
    Effect.CritBonus = `GetConfigInt("F_TheBiggerTheyAre_CritBonus");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Call For Fire
// (AbilityName="F_CallForFire")
// Enter overwatch. All allies in a radius around you also enter overwatch.
static function X2AbilityTemplate CallForFire()
{
    local X2AbilityTemplate                         Template;
    local X2AbilityMultiTarget_Radius               RadiusMultiTarget;
    local X2AbilityPassiveAOE_AbilityRadius         PassiveRadius;
    local X2Condition_UnitProperty                  UnitPropertyCondition;
    local X2Effect_MeristReserveOverwatchPoints     ReserveEffect;
    local X2Effect_MeristCoveringFire               CoveringFireEffect;
    local X2Condition_TargetHasOneOfTheAbilities    CoveringFireCondition;

    Template = SelfTargetActivated('F_CallForFire', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_circle", `GetConfigBool("F_CallForFire_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

    RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_CallForFire_Radius"));
    RadiusMultiTarget.bIgnoreBlockingCover = true;
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    PassiveRadius = new class'X2AbilityPassiveAOE_AbilityRadius';
    PassiveRadius.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_CallForFire_Radius"));
    Template.AbilityPassiveAOEStyle = PassiveRadius;

    AddCooldown(Template, `GetConfigInt("F_CallForFire_Cooldown"));
    AddActionPointCost(Template, eCost_SingleConsumeAll);

    AddSuppressedCondition(Template);
    Template.AddShooterEffectExclusions();

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.RequireSquadmates = true;
    UnitPropertyCondition.FailOnNonUnits = true;
    UnitPropertyCondition.ExcludeUnableToAct = true;
    UnitPropertyCondition.TreatMindControlledSquadmateAsHostile = false;
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    ReserveEffect = new class'X2Effect_MeristReserveOverwatchPoints';
    Template.AddTargetEffect(ReserveEffect);
    Template.AddMultiTargetEffect(ReserveEffect);

    CoveringFireCondition = new class'X2Condition_TargetHasOneOfTheAbilities';
    CoveringFireCondition.AbilityNames.AddItem('CoveringFire');

    CoveringFireEffect = new class'X2Effect_MeristCoveringFire';
    CoveringFireEffect.AbilitiesToActivate = class'X2Effect_MeristReserveOverwatchPoints'.default.OverwatchAbilities;
    CoveringFireEffect.bMatchSourceWeapon = false;
    CoveringFireEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    CoveringFireEffect.TargetConditions.AddItem(CoveringFireCondition);
    Template.AddTargetEffect(CoveringFireEffect);
    Template.AddMultiTargetEffect(CoveringFireEffect);

    Template.bShowActivation = false;
    Template.bSkipFireAction = false;
    
    Template.CustomFireAnim = 'HL_SignalHalt';
    Template.CinescriptCameraType = "Overwatch";
    Template.AbilityConfirmSound = "Unreal2DSounds_OverWatch";

    Template.PostActivationEvents.AddItem('OverwatchUsed');

    Template.BuildVisualizationFn = CallForFire_BuildVisualization;

    return Template;
}

simulated function CallForFire_BuildVisualization(XComGameState VisualizeGameState)
{
    local XComGameStateHistory          History;
    local XComGameStateContext_Ability  Context;

    local StateObjectReference          SourceUnitRef;
    local StateObjectReference          TargetUnitRef;
    local X2AbilityTemplate             AbilityTemplate;

    local VisualizationActionMetadata   EmptyTrack;
    local VisualizationActionMetadata   SourceTrack;
    local VisualizationActionMetadata   TargetTrack;
    local X2Action_PlaySoundAndFlyOver  SoundAndFlyOver;
    local X2Action_PlaySoundAndFlyOver  SoundAndFlyoverTarget;
    local X2Action_PlayAnimation        PlayAnimationAction;

    local int                           Index;

    History = `XCOMHISTORY;
    Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

    AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);

    SourceUnitRef = Context.InputContext.SourceObject;

    SourceTrack = EmptyTrack;
    SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(SourceUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(SourceUnitRef.ObjectID);
    SourceTrack.VisualizeActor = History.GetVisualizer(SourceUnitRef.ObjectID);

    SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
    SoundAndFlyOver.SetSoundAndFlyOverParameters(none, AbilityTemplate.LocFlyOverText, 'Overwatch', eColor_Good, AbilityTemplate.IconImage);

    PlayAnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
    PlayAnimationAction.Params.AnimName = AbilityTemplate.CustomFireAnim;
    PlayAnimationAction.bFinishAnimationWait = true;

    for (Index = 0; Index < Context.InputContext.MultiTargets.Length; Index++)
    {
        TargetUnitRef = Context.InputContext.MultiTargets[Index];
        if (TargetUnitRef.ObjectID != 0 && TargetUnitRef.ObjectID != SourceUnitRef.ObjectID)
        {
            TargetTrack = EmptyTrack;
            TargetTrack.StateObject_OldState = History.GetGameStateForObjectID(TargetUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
            TargetTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(TargetUnitRef.ObjectID);
            TargetTrack.VisualizeActor = History.GetVisualizer(TargetUnitRef.ObjectID);

            SoundAndFlyoverTarget = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(TargetTrack, context, false, TargetTrack.LastActionAdded));
            SoundAndFlyoverTarget.SetSoundAndFlyOverParameters(none, AbilityTemplate.LocFlyOverText, 'None', eColor_Good, AbilityTemplate.IconImage);
        }
    }
}

// Lock 'N Load
// (AbilityName="F_LockNLoad", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Kills with your primary weapon restore one ammo. Passive.
static function X2AbilityTemplate LockNLoad()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_ReloadWeapon             Effect;

    Template = SelfTargetTrigger('F_LockNLoad', "img:///UILibrary_XPerkIconPack.UIPerk_reload_shot");

    Template.bCrossClassEligible = `GetConfigBool("F_LockNLoad_bAWC");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'KillMail';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_LockNLoad;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    Effect = new class'X2Effect_ReloadWeapon';
    Effect.bReloadSourceWeapon = true;
    Effect.AmmoToReload = `GetConfigInt("F_LockNLoad_AmmoToReload");
    Template.AddTargetEffect(Effect);

    AddUnitValueCondition(Template, 'F_LockNLoad_Activations', `GetConfigInt("F_LockNLoad_ActivationsPerTurn"));

    Template.bShowActivation = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_LockNLoad_Passive');

    return Template;
}

static function X2AbilityTemplate LockNLoadPassive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_LockNLoad_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_reload_shot", false, true, true);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_LockNLoad(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Ability         CallbackAbilityState;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        if (CallbackAbilityState.SourceWeapon.ObjectID == AbilityContext.InputContext.ItemObject.ObjectID)
        {
            return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
        }
    }

    return ELR_NoInterrupt;
}

// Imposition
// (AbilityName="F_Imposition")
// Standard shots with the unit's primary weapon lower the target's aim until next turn. Passive.
static function X2AbilityTemplate Imposition()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_Imposition', "img:///UILibrary_FavidsPerkPack.UIPerk_Imposition", `GetConfigBool("F_Imposition_bAWC"), true, false);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Added in OnPostTemplatesCreated()
static function X2Effect_PersistentStatChange ImpositionEffect()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_PersistentStatChange     Effect;
    local X2Condition_SoldierAbilities      Condition;

    // Get the template that we'll use for this effect's display info
    Template = Imposition();

    // Effect that reduces aim
    Effect = new class'X2Effect_PersistentStatChange';
    Effect.EffectName = 'F_Imposition';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.AddPersistentStatChange(eStat_Offense, -1 * `GetConfigInt("F_Imposition_AimPenalty"));
    Effect.BuildPersistentEffect(`GetConfigInt("F_Imposition_Duration"), false, false, false, eGameRule_PlayerTurnBegin);
    Effect.bUseSourcePlayerState = true;
    Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.Imposition_DebuffText, Template.IconImage,,, Template.AbilitySourceName);
    Effect.SetupEffectOnShotContextResult(true, `GetConfigBool("F_Imposition_bApplyOnMiss"));
    // Effect.VisualizationFn = EffectFlyoverVisualization;

    // Only apply if shooter has Imposition passive attached to the same weapon
    Condition = new class'X2Condition_SoldierAbilities';
    Condition.RequiredAbilities.AddItem('F_Imposition');
    Condition.bMatchSourceWeapon = true;
    Effect.TargetConditions.AddItem(Condition);

    return Effect;
}

// Trench Warfare
// (AbilityName="F_TrenchWarfare")
// If you get at least one kill during your turn, automatically hunker down at the end of it. Passive.
static function X2AbilityTemplate TrenchWarfare()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_IncrementUnitValue       ValueEffect;

    Template = SelfTargetTrigger('F_TrenchWarfare', "img:///UILibrary_FavidsPerkPack.UIPerk_TrenchWarfare");

    Template.bCrossClassEligible = `GetConfigBool("F_TrenchWarfare_bAWC");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'KillMail';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    ValueEffect = new class'X2Effect_IncrementUnitValue';
    ValueEffect.UnitName = 'F_TrenchWarfare_KillsThisTurn';
    ValueEffect.NewValueToSet = 1;
    ValueEffect.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(ValueEffect);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_TrenchWarfare_Activation');
    Template.AdditionalAbilities.AddItem('F_TrenchWarfare_Passive');

    return Template;
}

static function X2AbilityTemplate TrenchWarfareActivation()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitEffects           EffectsCondition;
    local X2Condition_UnitValue             ValueCondition;
    local X2Effect_GrantActionPoints        ActionPointEffect;

    Template = SelfTargetTrigger('F_TrenchWarfare_Activation', "img:///UILibrary_FavidsPerkPack.UIPerk_TrenchWarfare");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'PlayerTurnEnded';
    Trigger.ListenerData.Filter = eFilter_Player;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 45;
    Template.AbilityTriggers.AddItem(Trigger);

    // Require not already hunkered down
    EffectsCondition = new class'X2Condition_UnitEffects';
    EffectsCondition.AddExcludeEffect('HunkerDown', 'AA_UnitIsImmune');
    Template.AbilityTargetConditions.AddItem(EffectsCondition);

    // Require that a kill has been made
    ValueCondition = new class'X2Condition_UnitValue';
    ValueCondition.AddCheckValue('F_TrenchWarfare_KillsThisTurn', 0, eCheck_GreaterThan);
    Template.AbilityTargetConditions.AddItem(ValueCondition);

    ActionPointEffect = new class'X2Effect_GrantActionPoints';
    ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.DeepCoverActionPoint;
    ActionPointEffect.NumActionPoints = 1;
    ActionPointEffect.bApplyOnlyWhenOut = true;
    Template.AddTargetEffect(ActionPointEffect);

    Template.PostActivationEvents.AddItem('F_TrenchWarfare');

    return Template;
}

static function X2AbilityTemplate TrenchWarfarePassive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_TrenchWarfare_Passive', "img:///UILibrary_FavidsPerkPack.UIPerk_TrenchWarfare", false, true, true);

    return Template;
}

// Added in OnPostTemplatesCreated()
static function X2AbilityTrigger_EventListener TrenchWarfareTrigger()
{
    local X2AbilityTrigger_EventListener Trigger;

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'F_TrenchWarfare';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 80;

    return Trigger;
}

// Compensation
// (AbilityName="F_Compensation")
// Once per turn, gain a standard action after taking a standard sniper shot. Passive.
static function X2AbilityTemplate Compensation()
{
    local X2AbilityTemplate             Template;
    local X2Effect_RefundActionPoints   Effect;

    Template = Passive('F_Compensation', "img:///UILibrary_XPerkIconPack.UIPerk_sniper_chevron_x2", `GetConfigBool("F_Compensation_bAWC"), true, true);

    Effect = new class'X2Effect_RefundActionPoints';
    Effect.EffectName = 'F_Compensation';
    Effect.bRefundAll = false;
    Effect.ActionPointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
    Effect.AllowedAbilities = default.Compensation_AllowedAbilities;
    Effect.ActivationsPerTurn = `GetConfigInt("F_Compensation_ActivationsPerTurn");
    Effect.CountValueName = 'F_Compensation_Activations';
    Effect.bShowFlyover = `GetConfigBool("F_Compensation_bShowFlyover");
    Effect.FlyoverEventName = 'F_Compensation_Flyover';
    Effect.bAllowCBACOverride = `GetConfigBool("F_Compensation_bAllowCBACOverride");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// First Strike
// (AbilityName="F_FirstStrike", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Grants a large damage bonus while concealed, and a small damage bonus while flanking. Passive.
static function X2AbilityTemplate FirstStrike()
{
    local X2AbilityTemplate     Template;
    local X2Effect_FirstStrike  Effect;

    Template = Passive('F_FirstStrike', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_shot2", `GetConfigBool("F_FirstStrike_bAWC"), true, true);

    Effect = new class'X2Effect_FirstStrike';
    Effect.EffectName = 'F_FirstStrike';
    Effect.FlankingDamageBonus = `GetConfigInt("F_FirstStrike_FlankingDamageBonus");
    Effect.ConcealedDamageBonus = `GetConfigInt("F_FirstStrike_ConcealedDamageBonus");
    Effect.bMatchSourceWeapon = true;
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Disabling Shot
// (AbilityName="F_DisablingShot", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot that stuns the target. This attack cannot critically hit.
static function X2AbilityTemplate DisablingShot()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_Stunned                  StunnedEffect;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;

    Template = Attack('F_DisablingShot', "img:///UILibrary_XPerkIconPack.UIPerk_shot_repair", `GetConfigBool("F_DisablingShot_bAWC"), false);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bAllowCrit = false;
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    AddCooldown(Template, `GetConfigInt("F_DisablingShot_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_DisablingShot_AmmoCost"));

    StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(`GetConfigInt("F_DisablingShot_StunDuration"), 100, false);
    StunnedEffect.bRemoveWhenSourceDies = false;
    Template.AddTargetEffect(StunnedEffect);
    Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
    Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
    Template.AddTargetEffect(default.WeaponUpgradeMissDamage);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Blend
// (AbilityName="F_Blend")
// Immediately grants concealment that is automatically broken after a few turns.
static function X2AbilityTemplate Blend()
{
    local X2AbilityTemplate         Template;
    local X2Effect_RangerStealth    StealthEffect;

    Template = SelfTargetActivated('F_Blend', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_blaze", `GetConfigBool("F_Blend_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Blend_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Blend_Charges"));
    AddActionPointCost(Template, eCost_Free);

    Template.AbilityShooterConditions.AddItem(new class'X2Condition_Stealth');
    Template.AddShooterEffectExclusions();

    StealthEffect = new class'X2Effect_RangerStealth';
    StealthEffect.EffectName = 'F_Blend';
    StealthEffect.EffectRemovedFn = Blend_EffectRemoved;
    StealthEffect.bRemoveWhenTargetConcealmentBroken = true;
    StealthEffect.BuildPersistentEffect(`GetConfigInt("F_Blend_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    StealthEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(StealthEffect);

    Template.AddTargetEffect(class'X2Effect_Spotted'.static.CreateUnspottedEffect());

    Template.ActivationSpeech = 'ActivateConcealment';

    return Template;
}

static function Blend_EffectRemoved(X2Effect_Persistent PersistentEffect, const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState, bool bCleansed)
{
    local XComGameState_Unit UnitState;

    UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
    if (UnitState != none)
    {
        `XEVENTMGR.TriggerEvent('EffectBreakUnitConcealment', UnitState, UnitState, NewGameState);
    }
}

// Botnet
// (AbilityName="F_Botnet")
// While active, standard shots from all allies lower their target's hack defense.
static function X2AbilityTemplate Botnet()
{
    local X2AbilityTemplate                 Template;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Effect_Persistent               Effect;

    Template = SelfTargetActivated('F_Botnet', "img:///UILibrary_XPerkIconPack.UIPerk_gremlin_circle", `GetConfigBool("F_Botnet_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Botnet_Cooldown"));
    AddActionPointCost(Template, eCost_Free);

    Template.AbilityMultiTargetStyle = new class'X2AbilityMultiTarget_AllAllies';

    Template.AddShooterEffectExclusions();

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.RequireSquadmates = true;
    UnitPropertyCondition.ExcludeCivilian = true;
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    Effect = new class'X2Effect_Persistent';
    Effect.EffectName = 'F_Botnet';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.BuildPersistentEffect(`GetConfigInt("F_Botnet_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.Botnet_BuffText, Template.IconImage, true,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);
    Template.AddMultiTargetEffect(Effect);

    Template.AbilityConfirmSound = "Unreal2DSounds_TargetLock";

    return Template;
}

// Added in OnPostTemplatesCreated()
static function X2Effect_PersistentStatChange BotnetEffect()
{
    local X2Effect_PersistentStatChange     Effect;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitEffectsOnSource   EffectCondition;

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeOrganic = true;
    UnitPropertyCondition.IncludeWeakAgainstTechLikeRobot = true;
    UnitPropertyCondition.TreatMindControlledSquadmateAsHostile = true;

    Effect = class'X2StatusEffects'.static.CreateHackDefenseChangeStatusEffect(`GetConfigInt("F_Botnet_HackPenalty"), UnitPropertyCondition);
    Effect.EffectName = 'F_Botnet_Debuff';
    Effect.DuplicateResponse = eDupe_Allow;
    Effect.IconImage = "img:///UILibrary_PerkIcons.UIPerk_comm_hack";

    EffectCondition = new class'X2Condition_UnitEffectsOnSource';
    EffectCondition.AddRequireEffect('F_Botnet', 'AA_MissingRequiredEffect');
    Effect.TargetConditions.AddItem(EffectCondition);

    return Effect;
}

// Ready For Anything
// (AbilityName="F_ReadyForAnything", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// When you make a standard attack with your primary weapon you automatically enter overwatch.
static function X2AbilityTemplate ReadyForAnything()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_MeristReserveOverwatchPoints ReserveOverwatchPointsEffect;

    Template = SelfTargetTrigger('F_ReadyForAnything', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_shot_2");

    Template.bCrossClassEligible = `GetConfigBool("F_ReadyForAnything_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_ReadyForAnything;
    Trigger.ListenerData.Priority = 20;
    Template.AbilityTriggers.AddItem(Trigger);

    AddSuppressedCondition(Template);
    Template.AddShooterEffectExclusions();
    if (`GetConfigBool("F_ReadyForAnything_bMatchSourceWeapon"))
    {
        AddAmmoCost(Template, 1, true);
    }

    ReserveOverwatchPointsEffect = new class'X2Effect_MeristReserveOverwatchPoints';
    ReserveOverwatchPointsEffect.bMatchSourceWeapon = `GetConfigBool("F_ReadyForAnything_bMatchSourceWeapon");
    Template.AddTargetEffect(ReserveOverwatchPointsEffect);
    Template.AddTargetEffect(class'X2Effect_MeristCoveringFire'.static.CreateCoveringFireEffect(`GetConfigBool("F_ReadyForAnything_bMatchSourceWeapon")));

    AddUnitValueCondition(Template, 'F_ReadyForAnything_Activations', `GetConfigInt("F_ReadyForAnything_ActivationsPerTurn"));

    Template.bFrameEvenWhenUnitIsHidden = true;
    Template.BuildVisualizationFn = ReadyForAnything_BuildVisualization;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_ReadyForAnything_Passive');

    return Template;
}

static function X2AbilityTemplate ReadyForAnythingPassive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_ReadyForAnything_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_shot_2", false, true, true);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_ReadyForAnything(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability      AbilityContext;
    local XComGameState_Ability             ActivatedAbilityState;
    local XComGameState_Ability             CallbackAbilityState;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        ActivatedAbilityState = XComGameState_Ability(EventData);
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        if (CallbackAbilityState.SourceWeapon.ObjectID > 0 && CallbackAbilityState.SourceWeapon.ObjectID == AbilityContext.InputContext.ItemObject.ObjectID)
        {
            if (default.ReadyForAnything_AllowedAbilities.Find(ActivatedAbilityState.GetMyTemplateName()) != INDEX_NONE)
            {
                return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
            }
        }
    }

    return ELR_NoInterrupt;
}

static simulated function ReadyForAnything_BuildVisualization(XComGameState VisualizeGameState)
{
    local XComGameStateHistory              History;
    local XComGameStateContext_Ability      Context;
    local StateObjectReference              InteractingUnitRef;

    local VisualizationActionMetadata       EmptyTrack;
    local VisualizationActionMetadata       ActionMetadata;

    local X2Action_CameraFrameAbility       FrameAction;
    local X2Action_PlaySoundAndFlyOver      SoundAndFlyOver;
    local X2Action_CameraRemove             RemoveCameraAction;
    local XComGameState_Unit                UnitState;
    local X2AbilityTemplate                 AbilityTemplate;
    local string                            FlyOverText, FlyOverImage;
    local XGUnit                            UnitVisualizer;

    History = `XCOMHISTORY;

    Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
    InteractingUnitRef = Context.InputContext.SourceObject;

    ActionMetadata = EmptyTrack;
    ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
    ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

    UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);

    FrameAction = X2Action_CameraFrameAbility(class'X2Action_CameraFrameAbility'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
    FrameAction.AbilitiesToFrame.AddItem(Context);
    FrameAction.CameraTag = 'OverwatchCamera';

    AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);
    FlyOverText = AbilityTemplate.LocFlyOverText;
    FlyOverImage = AbilityTemplate.IconImage;
    if (UnitState != none && UnitState.HasSoldierAbility('CoveringFire'))
    {
        AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate('CoveringFire');
        FlyOverText = FlyOverText $ ": " $ AbilityTemplate.LocFriendlyName;
    }
    SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));

    if (UnitState != none)
    {
        UnitVisualizer = XGUnit(UnitState.GetVisualizer());
        if ((UnitVisualizer != none) && !UnitVisualizer.IsMine())
        {
            SoundAndFlyOver.SetSoundAndFlyOverParameters(SoundCue'SoundUI.OverwatchCue', FlyOverText, '', eColor_Bad, FlyOverImage);
        }
        else
        {
            SoundAndFlyOver.SetSoundAndFlyOverParameters(none, FlyOverText, '', eColor_Good, FlyOverImage);
        }
    }

    if (FrameAction != none)
    {
        RemoveCameraAction = X2Action_CameraRemove(class'X2Action_CameraRemove'.static.AddToVisualizationTree(ActionMetaData, Context));
        RemoveCameraAction.CameraTagToRemove = 'OverwatchCamera';
    }
}

// Resupply
// (AbilityName="F_Resupply", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Your GREMLIN moves to every ally, reloading the ammo in their primary weapon.
static function X2AbilityTemplate Resupply()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityMultiTarget_AllAllies    MultiTargetingStyle;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Effect_ReloadWeapon             Effect;

    Template = SelfTargetActivated('F_Resupply', "img:///UILibrary_FavidsPerkPack.UIPerk_Resupply", `GetConfigBool("F_Resupply_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    // Targets all allies
    MultiTargetingStyle = new class'X2AbilityMultiTarget_AllAllies';
    MultiTargetingStyle.bAllowSameTarget = true;
    MultiTargetingStyle.NumTargetsRequired = 1;
    Template.AbilityMultiTargetStyle = MultiTargetingStyle;

    Template.TargetingMethod = class'X2TargetingMethod_GremlinAOE';

    // Allied squadmates only
    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.RequireSquadmates = true;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    Template.AddShooterEffectExclusions();

    // Targets must want a reload
    Template.AbilityMultiTargetConditions.AddItem(new class'X2Condition_WantsReload');

    AddCooldown(Template, `GetConfigInt("F_Resupply_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Resupply_Charges"));

    // Create an effect that reloads ammo
    Effect = new class'X2Effect_ReloadWeapon';
    Effect.SpecificSlot = eInvSlot_PrimaryWeapon;
    Effect.AmmoToReload = `GetConfigInt("F_Resupply_AmmoToReload");
    Template.AddMultiTargetEffect(Effect);
    
    // Gremlin animation code
    Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.SendGremlinToOwnerLocation_BuildGameState;
    Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinRestoration_BuildVisualization;
    Template.bSkipFireAction = true;
    Template.bShowActivation = true;
    Template.bStationaryWeapon = true;
    Template.bSkipPerkActivationActions = true;
    Template.PostActivationEvents.AddItem('ItemRecalled');
    
    Template.ActivationSpeech = 'Reloading';

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// Immunize
// (AbilityName="F_Immunize", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Your GREMLIN flies to an ally, granting them immunity to damage until the beginning of next turn.
static function X2AbilityTemplate Immunize()
{
    local X2AbilityTemplate         Template;
    local X2Condition_UnitProperty  UnitPropertyCondition;
    local X2Effect_DamageImmune     Effect;

    Template = SelfTargetActivated('F_Immunize', "img:///UILibrary_XPerkIconPack.UIPerk_shield_gremlin", `GetConfigBool("F_Immunize_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    Template.AbilityTargetStyle = default.SingleTargetWithSelf;

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.RequireSquadmates = true;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    Template.AddShooterEffectExclusions();

    AddCooldown(Template, `GetConfigInt("F_Immunize_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Immunize_Charges"));
    AddActionPointCost(Template, eCost_Single);

    Effect = new class'X2Effect_DamageImmune';
    Effect.EffectName = 'F_Immunize';
    Effect.DuplicateResponse = eDupe_Ignore;
    Effect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.Immunize_BuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    // Gremlin animation code
    Template.BuildNewGameStateFn = class'X2Ability_SpecialistAbilitySet'.static.SendGremlinToOwnerLocation_BuildGameState;
    Template.BuildVisualizationFn = class'X2Ability_SpecialistAbilitySet'.static.GremlinSingleTarget_BuildVisualization;
    Template.bSkipFireAction = false;
    Template.bShowActivation = true;
    Template.bStationaryWeapon = true;
    Template.bSkipPerkActivationActions = true;
    Template.PostActivationEvents.AddItem('ItemRecalled');
    
    Template.CustomSelfFireAnim = 'NO_DefenseProtocolA';

    // If this ability is set up as a cross class ability, but it's not directly assigned to any classes, this is the weapon slot it will use
    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// Rush
// (AbilityName="F_Rush", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Run towards an enemy and stab them with your knife. Can only perform with single-action moves. Costs a single action and does not end the turn.
static function X2AbilityTemplate Rush()
{
    local X2AbilityTemplate         Template;
    local array<name>               SkipExclusions;
    local X2AbilityTarget_MovingMelee_FixedRange    MovingMeleeTargeting;

    // Start with a copy of the Ranger's running Slash
    Template = class'X2Ability_RangerAbilitySet'.static.AddSwordSliceAbility('F_Rush');
    Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_knife_move2";
    Template.bCrossClassEligible = `GetConfigBool("F_Rush_bAWC");

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    Template.AbilityTriggers.Length = 0;
    Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

    // Can only blue move
    MovingMeleeTargeting = new class'X2AbilityTarget_MovingMelee_FixedRange';
    MovingMeleeTargeting.iFixedRange = 1;
    Template.AbilityTargetStyle = MovingMeleeTargeting;

    // No longer ends the turn
    AddCooldown(Template, `GetConfigInt("F_Rush_Cooldown"));
    Template.AbilityCosts.Length = 0;
    AddActionPointCost(Template, eCost_Single);

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
    if (`GetConfigBool("F_Rush_bAllowWhileDisoriented"))
        SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
    if (`GetConfigBool("F_Rush_bAllowWhileBurning"))
        SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
    Template.AddShooterEffectExclusions(SkipExclusions);

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// Ammo Conservation
// (AbilityName="F_AmmoConservation")
// Activated ability that does not cost an action point. Until the beginning of next turn, your ammo will be refunded after each shot you take. Cooldown-based.
static function X2AbilityTemplate AmmoConservation()
{
    local X2AbilityTemplate         Template;
    local X2Effect_RefundAmmoCost   Effect;

    Template = SelfTargetActivated('F_AmmoConservation', "img:///UILibrary_FavidsPerkPack.UIPerk_LockNLoad", `GetConfigBool("F_AmmoConservation_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_AmmoConservation_Cooldown"));
    AddActionPointCost(Template, eCost_Free);

    Template.AddShooterEffectExclusions();

    Effect = new class'X2Effect_RefundAmmoCost';
    Effect.EffectName = 'F_AmmoConservation';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.ExcludeAbilities = default.AmmoConservation_ExcludeAbilities;
    Effect.ApplyToSlots.AddItem(eInvSlot_PrimaryWeapon);
    if (`GetConfigBool("F_AmmoConservation_bApplyToSecondaryWeapons"))
    {
        Effect.ApplyToSlots.AddItem(eInvSlot_SecondaryWeapon);
    }
    Effect.MaxAmmoPerUse = `GetConfigInt("F_AmmoConservation_MaxAmmoPerUse");
    Effect.CountValueName = 'F_AmmoConservation_Count';
    Effect.bShowFlyover = `GetConfigBool("F_AmmoConservation_bShowFlyover");
    Effect.FlyoverEventName = 'F_AmmoConservation_Flyover';
    Effect.BuildPersistentEffect(`GetConfigInt("F_AmmoConservation_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Well Protected
// (AbilityName="F_WellProtected")
// Grants a vest only utility slot. Passive.
static function X2AbilityTemplate WellProtected()
{
    // Create the template using a helper function - XComVestSlot.ini sets this perk as unlocking the vest pocket
    return Passive('F_WellProtected', "img:///UILibrary_FavidsPerkPack.Perk_Ph_WellProtected", `GetConfigBool("F_WellProtected_bAWC"), false, true);
}

// Dedication
// (AbilityName="F_Dedication")
// Free action. Gain bonus mobility and ignore reaction fire for the rest of the turn. Cooldown-based.
static function X2AbilityTemplate Dedication()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_PersistentStatChange     Effect;

    Template = SelfTargetActivated('F_Dedication', "img:///UILibrary_FavidsPerkPack.Perk_Ph_Dedication", `GetConfigBool("F_Dedication_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Dedication_Cooldown"));
    AddActionPointCost(Template, eCost_Free);

    Template.AddShooterEffectExclusions();

    Effect = new class'X2Effect_PersistentStatChange';
    Effect.EffectName = 'F_Dedication';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.AddPersistentStatChange(eStat_Mobility, `GetConfigInt("F_Dedication_MobilityBonus"));
    Effect.BuildPersistentEffect(`GetConfigInt("F_Dedication_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Triage
// (AbilityName="F_Triage")
// Restores health to the user and all allies in the surrounding area. Also removes physical status effects.
static function X2AbilityTemplate Triage()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
    local X2AbilityPassiveAOE_AbilityRadius PassiveRadius;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitStatCheck         UnitStatCheckCondition;
    local array<name>                       SkipExclusions;
    local X2Condition_UnitProperty          BleedingOutCondition;
    local X2Effect_RemoveEffects            RemoveBleedOut;
    local X2Effect_Persistent               UnconsciousEffect;
    local X2Condition_UnitEffects           UnitEffectsCondition;
    local X2Effect_ApplyMedikitHeal         HealEffect;
    local X2Effect_RemoveEffectsByDamageType RemoveEffects;

    Template = SelfTargetActivated('F_Triage', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_circle", `GetConfigBool("F_Triage_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Triage_Radius"));
    RadiusMultiTarget.bIgnoreBlockingCover = true;
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    PassiveRadius = new class'X2AbilityPassiveAOE_AbilityRadius';
    PassiveRadius.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Triage_Radius"));
    Template.AbilityPassiveAOEStyle = PassiveRadius;

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeDead = false; // Hack: See following comment.
    UnitPropertyCondition.ExcludeHostileToSource = `GetConfigBool("F_Triage_bExcludeHostile");
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.ExcludeFullHealth = true;
    UnitPropertyCondition.ExcludeRobotic = `GetConfigBool("F_Triage_bExcludeRobotic");
    UnitPropertyCondition.ExcludeTurret = `GetConfigBool("F_Triage_bExcludeRobotic");
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    // Hack: Do this instead of ExcludeDead, to only exclude properly-dead units.
    UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
    UnitStatCheckCondition.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);
    Template.AbilityMultiTargetConditions.AddItem(UnitStatCheckCondition);

    if (`GetConfigBool("F_Triage_bAllowWhileBurning"))
        SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
    Template.AddShooterEffectExclusions(SkipExclusions);

    AddCooldown(Template, `GetConfigInt("F_Triage_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Triage_Charges"));
    AddActionPointCost(Template, eCost_SingleConsumeAll);

    if (`GetConfigBool("F_Triage_bStabilize"))
    {
        // UnitEffectsCondition = new class'X2Condition_UnitEffects';
        // UnitEffectsCondition.AddRequireEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_MissingRequiredEffect');
        
        BleedingOutCondition = new class'X2Condition_UnitProperty';
        BleedingOutCondition.ExcludeDead = false;
        BleedingOutCondition.ExcludeHostileToSource = `GetConfigBool("F_Triage_bExcludeHostile");
        BleedingOutCondition.ExcludeFriendlyToSource = false;
        BleedingOutCondition.IsBleedingOut = true;

        RemoveBleedOut = new class'X2Effect_RemoveEffects';
        RemoveBleedOut.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.BleedingOutName);
        RemoveBleedOut.TargetConditions.AddItem(BleedingOutCondition);
        Template.AddTargetEffect(RemoveBleedOut);

        UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect(, true);
        UnconsciousEffect.TargetConditions.AddItem(BleedingOutCondition);
        Template.AddTargetEffect(UnconsciousEffect);
    }
    else
    {
        UnitEffectsCondition = new class'X2Condition_UnitEffects';
        UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsBleedingOut');
        Template.AbilityMultiTargetConditions.AddItem(UnitEffectsCondition);
    }

    HealEffect = new class'X2Effect_ApplyMedikitHeal';
    HealEffect.PerUseHP = `GetConfigInt("F_Triage_HealAmount");
    Template.AddMultiTargetEffect(HealEffect);
    Template.AddMultiTargetEffect(class'X2Ability_SpecialistAbilitySet'.static.RemoveAllEffectsByDamageType());

    if (`GetConfigBool("F_Triage_bApplyToSelf"))
    {
        HealEffect = new class'X2Effect_ApplyMedikitHeal';
        HealEffect.PerUseHP = `GetConfigInt("F_Triage_HealAmount");
        HealEffect.TargetConditions.AddItem(UnitPropertyCondition);
        Template.AddTargetEffect(HealEffect);

        RemoveEffects = class'X2Ability_SpecialistAbilitySet'.static.RemoveAllEffectsByDamageType();
        RemoveEffects.TargetConditions.AddItem(UnitPropertyCondition);
        Template.AddTargetEffect(RemoveEffects);
    }

    return Template;
}

// Steadfast
// (AbilityName="F_Steadfast")
// Grants immunity to negative mental conditions including panic, mind control, stuns, and disorientation.
static function X2AbilityTemplate Steadfast()
{
    local X2AbilityTemplate         Template;
    local X2Effect_DamageImmunity   Effect;
    
    Template = Passive('F_Steadfast', "img:///UILibrary_FavidsPerkPack.Perk_Ph_Steadfast", `GetConfigBool("F_Steadfast_bAWC"), true, true);

    Effect = new class'X2Effect_DamageImmunity';
    Effect.EffectName = 'F_Steadfast';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.ImmuneTypes.AddItem('Mental');
    Effect.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.DisorientDamageType);
    Effect.ImmuneTypes.AddItem('Stun');
    Effect.ImmuneTypes.AddItem('Unconscious');
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Corpsman
// (AbilityName="F_Corpsman")
// Grants a free medikit.
static function X2AbilityTemplate Corpsman()
{
    local X2AbilityTemplate             Template;
    local XMBEffect_AddUtilityItem      Effect;
    // local X2Condition_SoldierAbilities  AbilityCondition;
    // local X2Condition_SoldierAbilities  NoAbilityCondition;

    Template = Passive('F_Corpsman', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_box", `GetConfigBool("F_Corpsman_bAWC"), false);

    // NoAbilityCondition = new class'X2Condition_SoldierAbilities';
    // NoAbilityCondition.ExcludedAbilities.AddItem('F_FieldMedic');

    Effect = new class'XMBEffect_AddUtilityItem';
    Effect.EffectName = 'F_Corpsman';
    Effect.DataName = 'Medikit';
    Effect.SkipAbilities.AddItem('SmallItemWeight');
    // Effect.TargetConditions.AddItem(NoAbilityCondition);
    Effect.BuildPersistentEffect(1, true, false);
    Template.AddTargetEffect(Effect);

    // AbilityCondition = new class'X2Condition_SoldierAbilities';
    // AbilityCondition.RequiredAbilities.AddItem('F_FieldMedic');

    // Effect = new class'XMBEffect_AddUtilityItem';
    // Effect.EffectName = 'F_Corpsman';
    // Effect.DataName = 'Medikit';
    // Effect.BaseCharges = 1 + `GetConfigInt("F_FieldMedic_BonusChargesPerItem");
    // Effect.SkipAbilities.AddItem('SmallItemWeight');
    // Effect.TargetConditions.AddItem(AbilityCondition);
    // Effect.BuildPersistentEffect(1, true, false);
    // Template.AddTargetEffect(Effect);

    return Template;
}

// Field Medic
// (AbilityName="F_FieldMedic")
// Grants additional medikit charges.
static function X2AbilityTemplate FieldMedic()
{
    local X2AbilityTemplate         Template;
    local XMBEffect_AddItemCharges  BonusItemEffect;

    Template = Passive('F_FieldMedic', "img:///UILibrary_PerkIcons.UIPerk_fieldmedic", `GetConfigBool("F_FieldMedic_bAWC"), false);

    BonusItemEffect = new class'XMBEffect_AddItemCharges';
    BonusItemEffect.PerItemBonus = `GetConfigInt("F_FieldMedic_BonusChargesPerItem");
    BonusItemEffect.ApplyToNames = default.FieldMedic_AllowedItems;
    Template.AddTargetEffect(BonusItemEffect);

    return Template;
}

// Stimulate
// (AbilityName="F_Stimulate")
// Once per turn, you may remove mental impairments from a nearby ally.
static function X2AbilityTemplate Stimulate()
{
    local X2AbilityTemplate             Template;
    local X2Condition_UnitProperty      TargetCondition;
    local X2Condition_UnitStatCheck     UnitStatCheckCondition;
    local X2Effect_RestoreActionPoints  RestoreActionPoints;

    Template = SelfTargetActivated('F_Stimulate', "img:///UILibrary_FavidsPerkPack.Perk_Ph_Stimulate", `GetConfigBool("F_Stimulate_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY + 1;

    Template.AbilityTargetStyle = default.SimpleSingleTarget;

    // Target must be within range and friendly
    TargetCondition = new class'X2Condition_UnitProperty';
    TargetCondition.ExcludeHostileToSource = true;
    TargetCondition.ExcludeFriendlyToSource = false;
    TargetCondition.RequireSquadmates = true;
    TargetCondition.ExcludeDead = false;
    TargetCondition.RequireWithinRange = true;
    TargetCondition.WithinRange = 180;
    Template.AbilityTargetConditions.AddItem(TargetCondition);

    UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
    UnitStatCheckCondition.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);
    Template.AbilityTargetConditions.AddItem(UnitStatCheckCondition);

    Template.AbilityTargetConditions.AddItem(new class'X2Condition_RevivalProtocol');
    Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

    AddCooldown(Template, `GetConfigInt("F_Stimulate_Cooldown"));
    AddActionPointCost(Template, eCost_Single);

    // Start Issue #1435
    /// HL-Docs: ref:Bugfixes; issue:1435
    /// Fix bug that allows Revival Protocol to remove effects that are normally removed by a Medikit heal,
    /// despite this functionality not being mentioned in the in-game localization, 
    /// and units with these effects not being valid targets for this ability, unless they are also mentally impaired.
    /// The bug was caused by Firaxis reusing the `RemoveAdditionalEffectsForRevivalProtocolAndRestorativeMist()` function, 
    /// which makes sense for Restoration, as that ability also applies Medikit heal, 
    /// but not for Revival Protocol, which is only supposed to remove mental impairments.
    Template.AddTargetEffect(class'X2Ability_SpecialistAbilitySet'.static.RemoveImpairingEffectsByDamageTypeForRevivalProtocol_CH());
    // End Issue #1435

    // Start Issue #1414
    /// HL-Docs: ref:Bugfixes; issue:1414
    /// Fixes the specialist's Revival Protocol and Restoration abilities to make them function as intended.
    /// 1. Revival Protocol now can target any allied unit, not just units under player's control.
    /// 2. Revival Protocol and Restoration now properly remove Stun, and no longer recover action points for Disoriented units.
    /// 3. Revival Protocol now properly gets more Charges with higher GREMLIN tiers.
    
    // Add a new condition to this effect, so it does not restore action points if the unit is only stunned or disoriented.
    RestoreActionPoints = new class'X2Effect_RestoreActionPoints';
    RestoreActionPoints.TargetConditions.AddItem(new class'X2Condition_RevivalProtocolRestoreAP');
    Template.AddTargetEffect(RestoreActionPoints);

    // Use a separate effect to restore action points for a stunned unit.
    Template.AddTargetEffect(class'X2StatusEffects'.static.CreateStunRecoverEffect());
    // End Issue #1414

    Template.bLimitTargetIcons = true;
    Template.ActivationSpeech = 'StabilizingAlly';
    
    SetFireAnim(Template, 'HL_Revive');

    Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

    return Template;
}

// Bloodlet
// (AbilityName="F_Bloodlet")
// Standard shots from your primary weapon or a pistol now cause bleeding.
static function X2AbilityTemplate Bloodlet()
{
    return Passive('F_Bloodlet', "img:///UILibrary_FavidsPerkPack.Perk_Ph_Bloodlet", `GetConfigBool("F_Bloodlet_bAWC"), true, true);
}

// Added in OnPostTemplatesCreated()
static function X2Effect_Persistent BloodletEffect()
{
    local X2Effect_Persistent           Effect;
    local X2Condition_SoldierAbilities  Condition;

    // Create the bleed status effect
    Effect = class'X2StatusEffects'.static.CreateBleedingStatusEffect(`GetConfigInt("F_Bloodlet_Duration"), `GetConfigInt("F_Bloodlet_DamagePerTurn"));
    Effect.FriendlyDescription = default.BleedingFriendlyDesc;
    Effect.ApplyChance = `GetConfigInt("F_Bloodlet_ApplyChance");

    // Only apply if shooter has Bloodlet passive
    Condition = new class'X2Condition_SoldierAbilities';
    Condition.RequiredAbilities.AddItem('F_Bloodlet');
    Effect.TargetConditions.AddItem(Condition);

    return Effect;
}

// Blinding Fire
// (AbilityName="F_BlindingFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire at enemies in a cone. This attack is inaccurate, but reduces the aim of all targets.
static function X2AbilityTemplate BlindingFire()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityMultiTarget_Cone         ConeMultiTarget;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2Effect_PersistentStatChange     AimPenaltyEffect;

    Template = Attack('F_BlindingFire', "img:///UILibrary_XPerkIconPack.UIPerk_shot_rifle", `GetConfigBool("F_BlindingFire_bAWC"), false);

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.BuiltInHitMod = -1 * `GetConfigInt("F_BlindingFire_ToHitPenalty");
    ToHitCalc.bAllowCrit = `GetConfigBool("F_BlindingFire_bAllowCrit");
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;
    Template.bOverrideAim = false;

    Template.AbilityTargetStyle = new class'X2AbilityTarget_Cursor';

    ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
    ConeMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
    ConeMultiTarget.ConeEndDiameter = `TILESTOUNITS(`GetConfigInt("F_BlindingFire_ConeWidth"));
    ConeMultiTarget.bUseWeaponRangeForLength = false;
    ConeMultiTarget.ConeLength = `TILESTOUNITS(`GetConfigInt("F_BlindingFire_ConeLength"));
    ConeMultiTarget.fTargetRadius = 99;
    ConeMultiTarget.bIgnoreBlockingCover = false;
    Template.AbilityMultiTargetStyle = ConeMultiTarget;

    Template.TargetingMethod = class'X2TargetingMethod_Cone';

    Template.AbilityTargetConditions.Length = 0;
    Template.AbilityMultiTargetConditions.AddItem(default.LivingTargetOnlyProperty);

    AddCooldown(Template, `GetConfigInt("F_BlindingFire_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_BlindingFire_AmmoCost"));

    Template.AddMultiTargetEffect(new class'X2Effect_Shredder');
    Template.AddMultiTargetEffect(default.WeaponUpgradeMissDamage);

    // Reduces the targets' aim
    AimPenaltyEffect = new class'X2Effect_PersistentStatChange';
    AimPenaltyEffect.EffectName = 'F_BlindingFire_AimPenalty';
    AimPenaltyEffect.DuplicateResponse = eDupe_Refresh;
    AimPenaltyEffect.AddPersistentStatChange(eStat_Offense, -1 * `GetConfigInt("F_BlindingFire_AimPenalty"));
    AimPenaltyEffect.BuildPersistentEffect(`GetConfigInt("F_BlindingFire_Duration"), false, false, false, eGameRule_PlayerTurnBegin);
    AimPenaltyEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.BlindingFire_DebuffText, Template.IconImage, true, , Template.AbilitySourceName);
    AimPenaltyEffect.bUseSourcePlayerState = true;
    AimPenaltyEffect.SetupEffectOnShotContextResult(true, true);
    AimPenaltyEffect.VisualizationFn = EffectFlyoverVisualization;
    Template.AddMultiTargetEffect(AimPenaltyEffect);

    Template.bFragileDamageOnly = true;
    Template.bCheckCollision = true;

    // Template.ActionFireClass = class'X2Action_Fire_SaturationFire';
    Template.CinescriptCameraType = "Grenadier_SaturationFire";

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Quick Feet
// (AbilityName="F_QuickFeet")
// Refunds one action point when you are revealed from concealment via your own action.
static function X2AbilityTemplate QuickFeet()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_GrantActionPoints        ActionPointEffect;

    Template = SelfTargetTrigger('F_QuickFeet', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_move");

    Template.bCrossClassEligible = `GetConfigBool("F_QuickFeet_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_QuickFeet;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    ActionPointEffect = new class'X2Effect_GrantActionPoints';
    ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
    ActionPointEffect.NumActionPoints = 1;
    Template.AddTargetEffect(ActionPointEffect);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_QuickFeet_Passive');

    return Template;
}

static function X2AbilityTemplate QuickFeetPassive()
{
    return Passive('F_QuickFeet_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_move", false, true, true);
}

static function EventListenerReturn AbilityTriggerEventListener_QuickFeet(Object EventData, Object EventSource, XComGameState GameState, name EventID, Object CallbackData)
{
    local XComGameStateHistory          History;
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Unit            SourceUnit, OldSourceUnit;
    local XComGameState_Ability         CallbackAbilityState, ActivatedAbilityState, OldActivatedAbilityState;
    local X2AbilityTemplate             AbilityTemplate;
    local X2AbilityCost                 Cost;
    local X2AbilityCost_ActionPoints    ActionPointCost;

    History = `XCOMHISTORY;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        SourceUnit = XComGameState_Unit(EventSource);

        if (class'X2AbilityHelpers'.static.IsUnitInterruptingEnemyTurn(SourceUnit))
        {
            return ELR_NoInterrupt;
        }

        if (SourceUnit.WasConcealed(History.GetEventChainStartIndex()) && !SourceUnit.IsConcealed())
        {
            OldSourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(SourceUnit.ObjectID,, GameState.HistoryIndex - 1));
            ActivatedAbilityState = XComGameState_Ability(EventData);
            OldActivatedAbilityState = XComGameState_Ability(History.GetGameStateForObjectID(ActivatedAbilityState.ObjectID,, GameState.HistoryIndex - 1));

            AbilityTemplate = OldActivatedAbilityState.GetMyTemplate();

            foreach AbilityTemplate.AbilityCosts(Cost)
            {
                ActionPointCost = X2AbilityCost_ActionPoints(Cost);
                if (ActionPointCost != none)
                {
                    if (!ActionPointCost.bFreeCost && ActionPointCost.GetPointCost(OldActivatedAbilityState, OldSourceUnit) > 0)
                    {
                        CallbackAbilityState = XComGameState_Ability(CallbackData);
                        return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
                    }
                }
            }
        }
    }

    return ELR_NoInterrupt;
}

// Combat Druges
// (AbilityName="F_CombatDrugs")
// Your smoke grenades confer bonuses to aim and critical chance.
static function X2AbilityTemplate CombatDrugs()
{
    return Passive('F_CombatDrugs', "img:///UILibrary_XPerkIconPack.UIPerk_smoke_shot_2", `GetConfigBool("F_CombatDrugs_bAWC"), true, true);
}

// Salt in the Wound
// (AbilityName="F_SaltInTheWound")
// All attacks and effects deal increased damage to targets suffering from burning, poison, acid, or bleeding. Passive.
static function X2AbilityTemplate SaltInTheWound()
{
    local X2AbilityTemplate         Template;
    local X2Effect_SaltInTheWound   Effect;

    Template = Passive('F_SaltInTheWound', "img:///UILibrary_FavidsPerkPack.UIPerk_SaltInTheWound", `GetConfigBool("F_SaltInTheWound_bAWC"), true, true);

    Effect = new class'X2Effect_SaltInTheWound';
    Effect.EffectName = 'F_SaltInTheWound';
    Effect.DamageBonus = `GetConfigInt("F_SaltInTheWound_DamageBonus");
    Effect.AllowedEffects = default.SaltInTheWound_AllowedEffects;
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Unload
// (AbilityName="F_Unload", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire with the unit's primary weapon until out of ammo or the target is dead. Shots cannot crit. Cooldown-based.
static function X2AbilityTemplate Unload()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2Effect_SetUnitValue             SetValueEffect;

    Template = Attack('F_Unload', "img:///UILibrary_FavidsPerkPack.UIPerk_Unload", `GetConfigBool("F_Unload_bAWC"), true);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.BuiltInHitMod = `GetConfigInt("F_Unload_ToHitMod");
    ToHitCalc.bAllowCrit = `GetConfigBool("F_Unload_bAllowCrit");
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    Template.AbilityShooterConditions.AddItem(new class'X2Condition_Unload');

    AddCooldown(Template, `GetConfigInt("F_Unload_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Unload_Charges"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, 2, true);
    AddAmmoCost(Template, 1);

    SetValueEffect = new class'X2Effect_SetUnitValue';
    SetValueEffect.UnitName = 'F_Unload_Counter';
    SetValueEffect.NewValueToSet = 1;
    SetValueEffect.CleanupType = eCleanup_BeginTurn;
    SetValueEffect.SetupEffectOnShotContextResult(true, true);
    Template.AddShooterEffect(SetValueEffect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.PostActivationEvents.AddItem('F_Unload2');

    Template.AdditionalAbilities.AddItem('F_Unload2');
    Template.AdditionalAbilities.AddItem('F_Unload_Damage');

    return Template;
}

static function X2AbilityTemplate Unload2()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2AbilityTrigger_EventListener    Trigger;

    Template = Attack('F_Unload2', "img:///UILibrary_FavidsPerkPack.UIPerk_Unload", false, true);
    
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    
    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.BuiltInHitMod = -1 * `GetConfigInt("F_Unload_ToHitPenalty");
    ToHitCalc.bAllowCrit = `GetConfigBool("F_Unload_bAllowCrit");
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    Template.AbilityTriggers.Length = 0;

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'F_Unload2';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.Priority = 80;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
    Template.AbilityTriggers.AddItem(Trigger);

    AddUnitValueCondition(Template, 'F_Unload2_Counter', `GetConfigInt("F_Unload_MaxShots"));

    AddAmmoCost(Template, 1);

    Template.bShowActivation = false;
    Template.MergeVisualizationFn = SequentialShot_MergeVisualization;
    Template.BuildInterruptGameStateFn = none;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.PostActivationEvents.AddItem('F_Unload2');

    return Template;
}

static function X2AbilityTemplate UnloadDamage()
{
    local X2AbilityTemplate         Template;
    local X2Effect_UnloadDamage     Effect;

    Template = Passive('F_Unload_Damage', "img:///UILibrary_FavidsPerkPack.UIPerk_Unload", false, false, true);

    Effect = new class'X2Effect_UnloadDamage';
    Effect.DamagePenalty = `GetConfigInt('F_Unload_DamagePenalty');
    Effect.AffectedAbilities.AddItem('F_Unload');
    Effect.AffectedAbilities.AddItem('F_Unload2');
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Ambush
// (AbilityName="F_Ambush", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Take a reaction shot against any enemy that moves or attacks within a cone of fire. Can only be used while concealed.
static function X2AbilityTemplate Ambush()
{
    local X2AbilityTemplate                 Template;
    local X2Effect                          Effect;
    local X2Effect_MarkValidActivationTiles MarkTilesEffect;
    local X2AbilityMultiTarget_Cone         ConeMultiTarget;

    // Start with a copy of KillZone
    Template = class'X2Ability_SharpshooterAbilitySet'.static.KillZone('F_Ambush', false);
    
    Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_stealth_overwatch";

    Template.bCrossClassEligible = `GetConfigBool("F_Ambush_bAWC");

    ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
    ConeMultiTarget.bUseWeaponRadius = true;
    ConeMultiTarget.ConeEndDiameter = `TILESTOUNITS(`GetConfigInt("F_Ambush_ConeEndDiameter"));
    ConeMultiTarget.ConeLength = `TILESTOUNITS(`GetConfigInt("F_Ambush_ConeLength"));
    Template.AbilityMultiTargetStyle = ConeMultiTarget;

    // Only usable while concealed
    Template.AbilityShooterConditions.AddItem(new class'X2Condition_Concealed');

    // Modify it to use our AmbushShot ability instead of KillZoneShot
    foreach Template.AbilityShooterEffects(Effect)
    {
        MarkTilesEffect = X2Effect_MarkValidActivationTiles(Effect);
        if(MarkTilesEffect != none)
        {
            MarkTilesEffect.AbilityToMark = 'F_Ambush_Attack';
            break;
        }
    }

    AddCooldown(Template, `GetConfigInt("F_Ambush_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Ambush_Charges"));

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.Length = 0;
    Template.AdditionalAbilities.AddItem('F_Ambush_Attack');

    return Template;
}

static function X2AbilityTemplate AmbushShot()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2AbilityTarget_Single            SingleTarget;
    local X2Condition_Visibility            VisibilityCondition;
    local X2Condition_AbilityProperty       AbilityCondition;
    local X2AbilityCost_ReserveActionPoints ReserveActionPointCost;

    Template = Attack('F_Ambush_Attack', "img:///UILibrary_XPerkIconPack.UIPerk_stealth_overwatch", false, true);
    
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTriggers.Length = 0;
    AddOverwatchTriggers(Template);

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bReactionFire = true;
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    SingleTarget = new class'X2AbilityTarget_Single';
    SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
    Template.AbilityTargetStyle = SingleTarget;

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bDisablePeeksOnMovement = true;
    VisibilityCondition.bAllowSquadsight = true;
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);

    AbilityCondition = new class'X2Condition_AbilityProperty';
    AbilityCondition.TargetMustBeInValidTiles = true;
    Template.AbilityTargetConditions.AddItem(AbilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
    Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());

    Template.AddShooterEffectExclusions();

    AddBladestormMark(Template, 'F_Ambush_Attack_MarkTarget');
    AddSuppressedCondition(Template);

    ReserveActionPointCost = new class'X2AbilityCost_ReserveActionPoints';
    ReserveActionPointCost.iNumPoints = 1;
    ReserveActionPointCost.bFreeCost = true;
    ReserveActionPointCost.AllowedTypes.AddItem(class'X2Ability_SharpshooterAbilitySet'.default.KillZoneReserveType);
    Template.AbilityCosts.AddItem(ReserveActionPointCost);

    AddAmmoCost(Template, 1);

    Template.bShowActivation = false;
    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Renewal
// (AbilityName="F_Renewal")
// At the start of each turn, heals yourself and all allies in a radius on you.
static function X2AbilityTemplate Renewal()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitStatCheck         UnitStatCheckCondition;
    local X2Condition_UnitEffects           UnitEffectsCondition;
    local X2Effect_ApplyHeal                Effect;

    Template = SelfTargetTrigger('F_Renewal', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_blossom");

    Template.bCrossClassEligible = `GetConfigBool("F_Renewal_bAWC");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'PlayerTurnBegun';
    Trigger.ListenerData.Filter = eFilter_Player;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 40;
    Template.AbilityTriggers.AddItem(Trigger);

    RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Renewal_Radius"));
    RadiusMultiTarget.bIgnoreBlockingCover = true;
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeDead = false;
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.ExcludeFullHealth = true;
    UnitPropertyCondition.ExcludeRobotic = `GetConfigBool("F_Renewal_bExcludeRobotic");
    UnitPropertyCondition.ExcludeTurret = `GetConfigBool("F_Renewal_bExcludeRobotic");
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
    UnitStatCheckCondition.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);
    Template.AbilityMultiTargetConditions.AddItem(UnitStatCheckCondition);

    UnitEffectsCondition = new class'X2Condition_UnitEffects';
    UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsBleedingOut');
    Template.AbilityMultiTargetConditions.AddItem(UnitEffectsCondition);

    Effect = new class'X2Effect_ApplyHeal';
    Effect.HealthRegeneratedName = 'F_Renewal_Heal';
    Effect.HealAmount = `GetConfigInt("F_Renewal_HealAmount");
    Effect.MaxHealAmount = `GetConfigInt("F_Renewal_MaxHealAmount");
    Effect.TargetConditions.AddItem(UnitPropertyCondition);
    Template.AddTargetEffect(Effect);
    Template.AddMultiTargetEffect(Effect);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_Renewal_Passive');

    return Template;
}

static function X2AbilityTemplate RenewalPassive()
{
    return Passive('F_Renewal_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_medkit_blossom", false, true, true);
}

// Warning Shot
// (AbilityName="F_WarningShot", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire your primary weapon just over the target's head, causing them to panic. This attack deals no damage.
static function X2AbilityTemplate WarningShot()
{
    local X2AbilityTemplate Template;

    Template = Attack('F_WarningShot', "img:///UILibrary_FavidsPerkPack.Perk_Ph_WarningShot", `GetConfigBool("F_WarningShot_bAWC"), false);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    Template.AbilityToHitCalc = default.DeadEye;

    AddCooldown(Template, `GetConfigInt("F_WarningShot_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_WarningShot_Charges"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_WarningShot_AmmoCost"));

    Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
    Template.AddTargetEffect(class'X2StatusEffects'.static.CreatePanickedStatusEffect());

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Open Fire
// (AbilityName="F_OpenFire")
// Gain bonus Aim and Critical Chance against targets that are at full health.
static function X2AbilityTemplate OpenFire()
{
    local X2AbilityTemplate     Template;
    local X2Effect_OpenFire     Effect;
    
    Template = Passive('F_OpenFire', "img:///UILibrary_XPerkIconPack.UIPerk_stabilize_shot_2", `GetConfigBool("F_OpenFire_bAWC"), true, true);

    Effect = new class'X2Effect_OpenFire';
    Effect.EffectName = 'F_OpenFire';
    Effect.AimBonus = `GetConfigInt("F_OpenFire_AimBonus");
    Effect.CritBonus = `GetConfigInt("F_OpenFire_CritBonus");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Havoc
// (AbilityName="F_Havoc", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Your Suppression and Area Suppression abilities now deal a small amount of damage to the primary target.
static function X2AbilityTemplate Havoc()
{
    return Passive('F_Havoc', "img:///UILibrary_FavidsPerkPack.UIPerk_Mayhem", `GetConfigBool("F_Havoc_bAWC"), true, true);
}

// Added in OnPostTemplatesCreated()
static function X2Effect_SuppressionDamage HavocEffect()
{
    local X2Effect_SuppressionDamage    Effect;
    local X2Condition_AbilityProperty   Condition;

    // Create the bleed status effect
    Effect = new class'X2Effect_SuppressionDamage';
    Effect.Damage = `GetConfigArrayInt("F_Havoc_Damage");

    // Only apply if shooter has Havoc passive
    Condition = new class'X2Condition_AbilityProperty';
    Condition.OwnerHasSoldierAbilities.AddItem('F_Havoc');
    Effect.TargetConditions.AddItem(Condition);

    return Effect;
}

// Finesse
// (AbilityName="F_Finesse")
// Your first melee attack each turn will have its actions refunded. Passive.
static function X2AbilityTemplate Finesse()
{
    local X2AbilityTemplate     Template;
    local X2Effect_Finesse      Effect;

    Template = Passive('F_Finesse', "img:///UILibrary_XPerkIconPack.UIPerk_knife_chevron", `GetConfigBool("F_Finesse_bAWC"), true, true);

    Effect = new class'X2Effect_Finesse';
    Effect.EffectName = 'F_Finesse';
    Effect.IncludeAbilities = default.Finesse_IncludeAbilities;
    Effect.ActivationsPerTurn = `GetConfigInt("F_Finesse_ActivationsPerTurn");
    Effect.bMatchSourceWeapon = `GetConfigBool("F_Finesse_bMatchSourceWeapon");
    Effect.bShowFlyover = `GetConfigBool("F_Finesse_bShowFlyover");
    Effect.bAllowCBACOverride = `GetConfigBool("F_Finesse_bAllowCBACOverride");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Shoulder to Lean On
// (AbilityName="F_ShoulderToLeanOn")
// Allies in a small radius around you gain bonus Aim. This bonus is increased when Shield Wall is used.
static function X2AbilityTemplate ShoulderToLeanOn()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitEffectsWithAbilitySource EffectCondition;
    local X2Effect_ShoulderToLeanOn         Effect;

    Template = SelfTargetTrigger('F_ShoulderToLeanOn', "img:///UILibrary_XPerkIconPack.UIPerk_shield_shot");

    Template.BuildVisualizationFn = none;
    Template.AbilityTargetStyle = default.SingleTargetWithSelf;

    Template.bCrossClassEligible = `GetConfigBool("F_ShoulderToLeanOn_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'M31_BuffMe';
    Trigger.ListenerData.Filter = eFilter_None;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_BuffMe;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = false;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.ExcludeInStasis = false;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

    EffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
    EffectCondition.AddExcludeEffect('F_ShoulderToLeanOn', 'AA_DuplicateEffectIgnored');
    Template.AbilityTargetConditions.AddItem(EffectCondition);

    Effect = new class'X2Effect_ShoulderToLeanOn';
    Effect.EffectName = 'F_ShoulderToLeanOn';
    Effect.AimBonus = `GetConfigInt("F_ShoulderToLeanOn_AimBonus");
    Effect.ShieldAimBonus = `GetConfigInt("F_ShoulderToLeanOn_ShieldAimBonus");
    Effect.EffectsForShieldBonus = default.ShoulderToLeanOn_EffectsForShieldBonus;
    Effect.Radius = `GetConfigFloat("F_ShoulderToLeanOn_Radius");
    Effect.bIncludeOwner = `GetConfigBool("F_ShoulderToLeanOn_bIncludeOwner");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.ShoulderToLeanOn_BuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    Template.AdditionalAbilities.AddItem('F_ShoulderToLeanOn_Passive');

    return Template;
}

static function X2AbilityTemplate ShoulderToLeanOnPassive()
{
    return Passive('F_ShoulderToLeanOn_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_shield_shot", false, true, true);
}

// Protect and Serve
// (AbilityName="F_ProtectAndServe")
// Gain a non-movement action point after using Shield Wall
static function X2AbilityTemplate ProtectAndServe()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_GrantActionPoints        ActionPointEffect;

    Template = SelfTargetTrigger('F_ProtectAndServe', "img:///UILibrary_XPerkIconPack.UIPerk_defense_chevron");

    Template.bCrossClassEligible = `GetConfigBool("F_ProtectAndServe_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_ProtectAndServe;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    ActionPointEffect = new class'X2Effect_GrantActionPoints';
    ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.RunAndGunActionPoint;
    ActionPointEffect.NumActionPoints = 1;
    Template.AddTargetEffect(ActionPointEffect);

    AddUnitValueCondition(Template, 'F_ProtectAndServe_Activations', 1);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_ProtectAndServe_Passive');

    return Template;
}

static function X2AbilityTemplate ProtectAndServePassive()
{
    return Passive('F_ProtectAndServe_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_defense_chevron", false, true, true);
}

static function EventListenerReturn AbilityTriggerEventListener_ProtectAndServe(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability      AbilityContext;
    local XComGameState_Ability             ActivatedAbilityState;
    local XComGameState_Ability             CallbackAbilityState;
    local XComGameState_Unit                SourceUnit;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        ActivatedAbilityState = XComGameState_Ability(EventData);
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        SourceUnit = XComGameState_Unit(EventSource);

        if (class'X2AbilityHelpers'.static.IsUnitInterruptingEnemyTurn(SourceUnit))
        {
            return ELR_NoInterrupt;
        }

        if (CallbackAbilityState.SourceWeapon.ObjectID > 0 && CallbackAbilityState.SourceWeapon.ObjectID == AbilityContext.InputContext.ItemObject.ObjectID)
        {
            if (default.ProtectAndServe_AllowedAbilities.Find(ActivatedAbilityState.GetMyTemplateName()) != INDEX_NONE)
            {
                return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
            }
        }
    }

    return ELR_NoInterrupt;
}

// Bolstered Wall
// (AbilityName="F_BolsteredWall")
// While Shield Wall is active, gain a bonus to Dodge.
static function X2AbilityTemplate BolsteredWall()
{
    local X2AbilityTemplate         Template;
    local X2Effect_BolsteredWall    Effect;

    Template = Passive('F_BolsteredWall', "img:///UILibrary_XPerkIconPack.UIPerk_defense_move2", `GetConfigBool("F_BolsteredWall_bAWC"), true, true);

    Effect = new class'X2Effect_BolsteredWall';
    Effect.EffectName = 'F_FaultlessDefense';
    Effect.DodgeBonus = `GetConfigInt("F_BolsteredWall_DodgeBonus");
    Effect.AllowedEffects = default.BolsteredWall_AllowedEffects;
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Faultless Defense
// (AbilityName="F_FaultlessDefense")
// While Shield Wall is active, you cannot be critically hit
static function X2AbilityTemplate FaultlessDefense()
{
    local X2AbilityTemplate         Template;
    local X2Effect_FaultlessDefense Effect;

    Template = Passive('F_FaultlessDefense', "img:///UILibrary_XPerkIconPack.UIPerk_defense_crit2", `GetConfigBool("F_FaultlessDefense_bAWC"), true, true);

    Effect = new class'X2Effect_FaultlessDefense';
    Effect.EffectName = 'F_FaultlessDefense';
    Effect.AllowedEffects = default.FaultlessDefense_AllowedEffects;
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Adrenaline
// (AbilityName="F_Adrenaline")
// Kills grant Shield. Passive.
static function X2AbilityTemplate Adrenaline()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitValue             ValueCondition;
    local X2Effect_IncrementUnitValue       UnitValueEffect;
    local X2Effect_PersistentStatChange     Effect;

    Template = SelfTargetTrigger('F_Adrenaline', "img:///UILibrary_XPerkIconPack.UIPerk_shield_plus");

    Template.bCrossClassEligible = `GetConfigBool("F_Adrenaline_bAWC");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'KillMail';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_Adrenaline;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    if (`GetConfigInt("F_Adrenaline_ActivationsPerMission") > 0)
    {
        ValueCondition = new class'X2Condition_UnitValue';
        ValueCondition.AddCheckValue('F_Adrenaline_Activations', `GetConfigInt("F_Adrenaline_ActivationsPerMission"), eCheck_LessThan);
        Template.AbilityShooterConditions.AddItem(ValueCondition);
    }

    UnitValueEffect = new class'X2Effect_IncrementUnitValue';
    UnitValueEffect.UnitName = 'F_Adrenaline_Activations';
    UnitValueEffect.NewValueToSet = 1;
    UnitValueEffect.CleanupType = eCleanup_BeginTactical;
    UnitValueEffect.SetupEffectOnShotContextResult(true, true);
    Template.AddShooterEffect(UnitValueEffect);

    Effect = new class'X2Effect_PersistentStatChange';
    Effect.EffectName = 'F_Adrenaline';
    Effect.DuplicateResponse = eDupe_Allow;
    Effect.AddPersistentStatChange(eStat_ShieldHP, `GetConfigInt("F_Adrenaline_ShieldAmount"));
    Effect.BuildPersistentEffect(1, true, true);
    Template.AddTargetEffect(Effect);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_Adrenaline_Passive');

    return Template;
}

static function X2AbilityTemplate AdrenalinePassive()
{
    return Passive('F_Adrenaline_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_shield_plus", false, true, true);
}

static function EventListenerReturn AbilityTriggerEventListener_Adrenaline(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Ability         CallbackAbilityState;
    local XComGameState_Unit            TargetUnit;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        if (CallbackAbilityState.SourceWeapon.ObjectID == AbilityContext.InputContext.ItemObject.ObjectID)
        {
            TargetUnit = XComGameState_Unit(EventData);
            if (TargetUnit != none)
            {
                if (default.Adrenaline_ExcludeCharacterGroups.Find(TargetUnit.GetMyTemplateGroupName()) == INDEX_NONE)
                {
                    return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
                }
            }
        }
    }

    return ELR_NoInterrupt;
}

// Watch Them Run
// (AbilityName="F_WatchThemRun", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Immediately enter overwatch after throwing or launching a grenade.
static function X2AbilityTemplate WatchThemRun()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_MeristReserveOverwatchPoints ReserveOverwatchPointsEffect;

    Template = SelfTargetTrigger('F_WatchThemRun', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_grenade");

    Template.bCrossClassEligible = `GetConfigBool("F_WatchThemRun_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_WatchThemRun;
    Trigger.ListenerData.Priority = 20;
    Template.AbilityTriggers.AddItem(Trigger);

    AddSuppressedCondition(Template);
    Template.AddShooterEffectExclusions();
    if (`GetConfigBool("F_WatchThemRun_bMatchSourceWeapon"))
    {
        AddAmmoCost(Template, 1, true);
    }

    ReserveOverwatchPointsEffect = new class'X2Effect_MeristReserveOverwatchPoints';
    ReserveOverwatchPointsEffect.bMatchSourceWeapon = `GetConfigBool("F_WatchThemRun_bMatchSourceWeapon");
    Template.AddTargetEffect(ReserveOverwatchPointsEffect);
    Template.AddTargetEffect(class'X2Effect_MeristCoveringFire'.static.CreateCoveringFireEffect(`GetConfigBool("F_WatchThemRun_bMatchSourceWeapon")));

    AddUnitValueCondition(Template, 'F_WatchThemRun_Activations', `GetConfigInt("F_WatchThemRun_ActivationsPerTurn"));

    Template.bFrameEvenWhenUnitIsHidden = true;
    Template.BuildVisualizationFn = ReadyForAnything_BuildVisualization;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_WatchThemRun_Passive');

    return Template;
}

static function X2AbilityTemplate WatchThemRunPassive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_WatchThemRun_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_grenade", false, true, true);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
    
    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_WatchThemRun(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameStateContext_Ability      AbilityContext;
    local XComGameState_Ability             ActivatedAbilityState;
    local XComGameState_Ability             CallbackAbilityState;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        ActivatedAbilityState = XComGameState_Ability(EventData);
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        if (default.WatchThemRun_AllowedAbilities.Find(ActivatedAbilityState.GetMyTemplateName()) != INDEX_NONE)
        {
            return CallbackAbilityState.AbilityTriggerEventListener_Self(EventData, EventSource, GameState, EventID, CallbackData);
        }
    }

    return ELR_NoInterrupt;
}

// Alternative version: behaves like the original comment suggested
// Watch Them Run
// (AbilityName="F_WatchThemRun2", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// If you have thrown or launched a grenade this turn, automatically enter overwatch at the end of the turn.
static function X2AbilityTemplate WatchThemRun2()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_IncrementUnitValue       ValueEffect;

    Template = SelfTargetTrigger('F_WatchThemRun2', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_grenade");

    Template.bCrossClassEligible = `GetConfigBool("F_WatchThemRun2_bAWC");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'AbilityActivated';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_WatchThemRun;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    ValueEffect = new class'X2Effect_IncrementUnitValue';
    ValueEffect.UnitName = 'F_WatchThemRun2_GrenadesThisTurn';
    ValueEffect.NewValueToSet = 1;
    ValueEffect.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(ValueEffect);

    Template.bShowActivation = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_WatchThemRun2_Activation');
    Template.AdditionalAbilities.AddItem('F_WatchThemRun2_Passive');

    return Template;
}

static function X2AbilityTemplate WatchThemRun2Activation()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitValue             ValueCondition;
    local X2Effect_MeristReserveOverwatchPoints ReserveOverwatchPointsEffect;

    Template = SelfTargetTrigger('F_WatchThemRun2_Activation', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_grenade");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'PlayerTurnEnded';
    Trigger.ListenerData.Filter = eFilter_Player;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 20;
    Template.AbilityTriggers.AddItem(Trigger);

    ValueCondition = new class'X2Condition_UnitValue';
    ValueCondition.AddCheckValue('F_WatchThemRun2_GrenadesThisTurn', 0, eCheck_GreaterThan);
    Template.AbilityTargetConditions.AddItem(ValueCondition);

    AddSuppressedCondition(Template);
    Template.AddShooterEffectExclusions();
    if (`GetConfigBool("F_WatchThemRun_bMatchSourceWeapon"))
    {
        AddAmmoCost(Template, 1, true);
    }

    ReserveOverwatchPointsEffect = new class'X2Effect_MeristReserveOverwatchPoints';
    ReserveOverwatchPointsEffect.bMatchSourceWeapon = `GetConfigBool("F_WatchThemRun_bMatchSourceWeapon");
    Template.AddTargetEffect(ReserveOverwatchPointsEffect);
    Template.AddTargetEffect(class'X2Effect_MeristCoveringFire'.static.CreateCoveringFireEffect(`GetConfigBool("F_WatchThemRun_bMatchSourceWeapon")));

    Template.bShowActivation = true;

    Template.bFrameEvenWhenUnitIsHidden = true;
    Template.BuildVisualizationFn = ReadyForAnything_BuildVisualization;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

static function X2AbilityTemplate WatchThemRun2Passive()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_WatchThemRun2_Passive', "img:///UILibrary_FavidsPerkPack.UIPerk_TrenchWarfare", false, true, true);
    
    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Cover Area
// (AbilityName="F_CoverArea")
// Allies within 2 tiles receive half damage from explosives. Passive.
static function X2AbilityTemplate CoverArea()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitEffectsWithAbilitySource EffectCondition;
    local X2Effect_CoverArea                Effect;

    Template = SelfTargetTrigger('F_CoverArea', "img:///UILibrary_XPerkIconPack.UIPerk_grenade_defense2");

    Template.BuildVisualizationFn = none;
    Template.AbilityTargetStyle = default.SingleTargetWithSelf;

    Template.bCrossClassEligible = `GetConfigBool("F_CoverArea_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'M31_BuffMe';
    Trigger.ListenerData.Filter = eFilter_None;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_BuffMe;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = false;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.ExcludeInStasis = false;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

    EffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
    EffectCondition.AddExcludeEffect('F_CoverArea', 'AA_DuplicateEffectIgnored');
    Template.AbilityTargetConditions.AddItem(EffectCondition);

    Effect = new class'X2Effect_CoverArea';
    Effect.EffectName = 'F_CoverArea';
    Effect.DamageReduction = `GetConfigInt("F_CoverArea_DamageReduction");
    Effect.bIncludeExplosiveDamage = `GetConfigBool("F_CoverArea_bIncludeExplosiveDamage");
    Effect.Radius = `GetConfigFloat("F_CoverArea_Radius");
    Effect.bIncludeOwner = `GetConfigBool("F_CoverArea_bIncludeOwner");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.CoverArea_BuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    Template.AdditionalAbilities.AddItem('F_CoverArea_Passive');

    return Template;
}

static function X2AbilityTemplate CoverAreaPassive()
{
    return Passive('F_CoverArea_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_grenade_defense2", false, true, true);
}

// Rally
// (AbilityName="F_Rally")
// Grants Shield to yourself and all allies around you.
static function X2AbilityTemplate Rally()
{
    local X2AbilityTemplate             Template;
    local X2AbilityMultiTarget_Radius   RadiusMultiTarget;
    local X2AbilityPassiveAOE_AbilityRadius PassiveRadius;
    local X2Condition_UnitProperty      UnitPropertyCondition;
    local X2Effect_GrantShields         ShieldEffect;
    local X2Effect_RemoveEffects        RemoveEffect;

    Template = SelfTargetActivated('F_Rally', "img:///UILibrary_PerkIcons.UIPerk_adventshieldbearer_energyshield", `GetConfigBool("F_Rally_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    Template.Hostility = eHostility_Defensive;

    RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Rally_Radius"));
    RadiusMultiTarget.bIgnoreBlockingCover = true;
    RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    PassiveRadius = new class'X2AbilityPassiveAOE_AbilityRadius';
    PassiveRadius.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Rally_Radius"));
    Template.AbilityPassiveAOEStyle = PassiveRadius;

    AddCooldown(Template, `GetConfigInt("F_Rally_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Rally_Charges"));
    AddActionPointCost(Template, eCost_SingleConsumeAll);

    Template.AddShooterEffectExclusions();

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.RequireSquadmates = true;
    UnitPropertyCondition.FailOnNonUnits = true;
    UnitPropertyCondition.ExcludeCivilian = true;
    UnitPropertyCondition.TreatMindControlledSquadmateAsHostile = true;
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    RemoveEffect = new class'X2Effect_RemoveEffects';
    RemoveEffect.EffectNamesToRemove.AddItem('F_Rally');
    RemoveEffect.bDoNotVisualize = true;
    Template.AddTargetEffect(RemoveEffect);
    Template.AddMultiTargetEffect(RemoveEffect);

    ShieldEffect = new class'X2Effect_GrantShields';
    ShieldEffect.EffectName = 'F_Rally';
    ShieldEffect.ShieldAmount = `GetConfigArrayInt("F_Rally_ShieldAmount");
    ShieldEffect.BuildPersistentEffect(`GetConfigInt("F_Rally_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    ShieldEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, "", Template.IconImage,,, Template.AbilitySourceName);
    ShieldEffect.VisualizationFn = EffectFlyoverVisualization;
    ShieldEffect.EffectRemovedVisualizationFn = class'X2Ability_AdventShieldBearer'.static.OnShieldRemoved_BuildVisualization;
    if (`GetConfigBool("F_Rally_bApplyToSelf"))
    {
        Template.AddTargetEffect(ShieldEffect);
    }
    Template.AddMultiTargetEffect(ShieldEffect);
    
    Template.bSkipFireAction = false;
    
    Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
    Template.BuildVisualizationFn = Rally_BuildVisualization;

    // Template.CinescriptCameraType = "AdvShieldBearer_EnergyShieldArmor";

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

static simulated function Rally_BuildVisualization(XComGameState VisualizeGameState)
{
    local XComGameStateHistory History;
    local XComGameStateContext_Ability  Context;
    local StateObjectReference InteractingUnitRef;
    local VisualizationActionMetadata EmptyTrack;
    local VisualizationActionMetadata ActionMetadata;
    local X2Action_PlayAnimation PlayAnimationAction;

    History = `XCOMHISTORY;

    Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
    InteractingUnitRef = Context.InputContext.SourceObject;

    // Configure the visualization track for the shooter
    // ****************************************************************************************
    ActionMetadata = EmptyTrack;
    ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
    ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

    PlayAnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
    PlayAnimationAction.Params.AnimName = 'HL_SignalPoint';
}

// Shield Trauma
// (AbilityName="F_ShieldTrauma")
// Upgrade to Shield Bash that stuns the target for one action.
static function X2AbilityTemplate ShieldTrauma()
{
    return Passive('F_ShieldTrauma', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_momentum", `GetConfigBool("F_ShieldTrauma_bAWC"), true, true);
}

static function X2Effect ShieldTraumaEffect()
{
    local X2Effect_Stunned              StunnedEffect;
    local X2Condition_SoldierAbilities  AbilityCondition;

    AbilityCondition = new class'X2Condition_SoldierAbilities';
    AbilityCondition.RequiredAbilities.AddItem('F_ShieldTrauma');

    StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(
        `GetConfigInt("F_ShieldTrauma_StunDuration"),
        `GetConfigInt("F_ShieldTrauma_StunChance"),
        false);
    StunnedEffect.bRemoveWhenSourceDies = false;
    StunnedEffect.TargetConditions.AddItem(AbilityCondition);

    return StunnedEffect;
}


// Avenger
// (AbilityName="F_Avenger", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// When an ally is shot at, automatically take a shot back at the shooter.
static function X2AbilityTemplate Avenger()
{
    local X2AbilityTemplate             Template;
    local X2Effect_MeristCoveringFire   CoveringFireEffect;

    Template = Passive('F_Avenger', "img:///UILibrary_XPerkIconPack.UIPerk_pistol_circle", `GetConfigBool("F_Avenger_bAWC"), true, true);

    CoveringFireEffect = new class'X2Effect_MeristCoveringFire';
    CoveringFireEffect.EffectName = 'F_Avenger';
    CoveringFireEffect.bMatchSourceWeapon = true;
    CoveringFireEffect.AddAbilityToActivate('F_Avenger_Attack');
    CoveringFireEffect.bDirectAttackOnly = true;
    CoveringFireEffect.bDirectAttackOnly_AllowAllies = true;
    CoveringFireEFfect.bDirectAttackOnly_AllowAllies_ExcludeSelf = true;
    CoveringFireEffect.bDirectAttackOnly_AllowMultiTarget = true;
    CoveringFireEffect.bPreEmptiveFire = false;
    CoveringFireEffect.bAnyHostileAction = true;
    CoveringFireEffect.bOnlyDuringEnemyTurn = true;
    CoveringFireEffect.BuildPersistentEffect(1, true, false);
    CoveringFireEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(CoveringFireEffect);

    Template.AdditionalAbilities.AddItem('F_Avenger_Attack');

    return Template;
}

static function X2AbilityTemplate AvengerShot()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2AbilityTarget_Single            SingleTarget;
    local X2Condition_Visibility            VisibilityCondition;
    local X2Condition_UnitProperty          UnitPropertyCondition;

    Template = Attack('F_Avenger_Attack', "img:///UILibrary_XPerkIconPack.UIPerk_pistol_circle", false, true);
    
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTriggers.Length = 0;
    Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bReactionFire = true;
    ToHitCalc.bIgnoreCoverBonus = `GetConfigBool("F_Avenger_bIgnoreCoverBonus");
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    SingleTarget = new class'X2AbilityTarget_Single';
    SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
    Template.AbilityTargetStyle = SingleTarget;

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = true;
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
    Template.AddShooterEffectExclusions();

    AddBladestormMark(Template, 'F_Avenger_Attack_MarkTarget');
    AddSuppressedCondition(Template);
    AddUnitValueCondition(Template, 'F_Avenger_Activations', `GetConfigInt("F_Avenger_ActivationsPerTurn"));

    AddAmmoCost(Template, 1);

    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Fire First
// (AbilityName="F_FireFirst", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// When an enemy attempts to shoot at you, you will pre-emptively take a shot at them.
static function X2AbilityTemplate FireFirst()
{
    local X2AbilityTemplate             Template;
    local X2Effect_MeristCoveringFire   CoveringFireEffect;

    Template = Passive('F_FireFirst', "img:///UILibrary_XPerkIconPack.UIPerk_pistol_circle", `GetConfigBool("F_FireFirst_bAWC"), true, true);

    CoveringFireEffect = new class'X2Effect_MeristCoveringFire';
    CoveringFireEffect.EffectName = 'F_FireFirst';
    CoveringFireEffect.bMatchSourceWeapon = true;
    CoveringFireEffect.AddAbilityToActivate('F_FireFirst_Attack');
    CoveringFireEffect.bDirectAttackOnly = true;
    CoveringFireEffect.bDirectAttackOnly_AllowMultiTarget = false;
    CoveringFireEffect.bPreEmptiveFire = true;
    CoveringFireEffect.bAnyHostileAction = true;
    CoveringFireEffect.bOnlyDuringEnemyTurn = true;
    CoveringFireEffect.BuildPersistentEffect(1, true, false);
    CoveringFireEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(CoveringFireEffect);

    Template.AdditionalAbilities.AddItem('F_FireFirst_Attack');

    return Template;
}

static function X2AbilityTemplate FireFirstShot()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2AbilityTarget_Single            SingleTarget;
    local X2Condition_Visibility            VisibilityCondition;
    local X2Condition_UnitProperty          UnitPropertyCondition;

    Template = Attack('F_FireFirst_Attack', "img:///UILibrary_XPerkIconPack.UIPerk_pistol_circle", false, true);
    
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTriggers.Length = 0;
    Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bReactionFire = true;
    ToHitCalc.bIgnoreCoverBonus = `GetConfigBool("F_FireFirst_bIgnoreCoverBonus");
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    SingleTarget = new class'X2AbilityTarget_Single';
    SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
    Template.AbilityTargetStyle = SingleTarget;

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = true;
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
    Template.AddShooterEffectExclusions();

    AddBladestormMark(Template, 'F_FireFirst_Attack_MarkTarget');
    AddSuppressedCondition(Template);
    AddUnitValueCondition(Template, 'F_FireFirst_Activations', `GetConfigInt("F_FireFirst_ActivationsPerTurn"));

    AddAmmoCost(Template, 1);

    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Flatline
// (AbilityName="F_Flatline", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a shot with your primary weapon that deals additional damage and applies Rupture.
static function X2AbilityTemplate Flatline()
{
    local X2AbilityTemplate Template;
    local X2Effect_Shredder DamageEffect;

    Template = Attack('F_Flatline', "img:///UILibrary_FavidsPerkPack.Perk_Ph_Flatline", `GetConfigBool("F_Flatline_bAWC"), false);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Flatline_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_Flatline_AmmoCost"));

    Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());

    DamageEffect = new class'X2Effect_Shredder';
    DamageEffect.EffectDamageValue.Damage = `GetConfigInt("F_Flatline_DamageBonus");
    DamageEffect.EffectDamageValue.Rupture = `GetConfigInt("F_Flatline_Rupture");
    Template.AddTargetEffect(DamageEffect);

    Template.AddTargetEffect(default.WeaponUpgradeMissDamage);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Cold Blooded
// (AbilityName="F_ColdBlooded")
// The first standard shot you take against an enemy suffering from bleeding, poison, burning, or acid burning does not cost an action.
static function X2AbilityTemplate ColdBlooded()
{
    local X2AbilityTemplate     Template;
    local X2Effect_ColdBlooded  Effect;

    Template = Passive('F_ColdBlooded', "img:///UILibrary_FavidsPerkPack.Perk_Ph_ColdBlooded", `GetConfigBool("F_ColdBlooded_bAWC"), true, true);

    Effect = new class'X2Effect_ColdBlooded';
    Effect.EffectName = 'F_ColdBlooded';
    Effect.AllowedAbilities = default.ColdBlooded_AllowedAbilities;
    Effect.AllowedEffects = default.ColdBlooded_AllowedEffects;
    Effect.ActivationsPerTurn = `GetConfigInt("F_ColdBlooded_ActivationsPerTurn");
    Effect.bMatchSourceWeapon = `GetConfigBool("F_ColdBlooded_bMatchSourceWeapon");
    Effect.bShowFlyover = `GetConfigBool("F_ColdBlooded_bShowFlyover");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Predator
// (AbilityName="F_Predator")
// Grants an aim bonus on enemies that are flanked or out of cover. Passive.
static function X2AbilityTemplate Predator()
{
    local X2AbilityTemplate     Template;
    local X2Effect_Predator     Effect;
    
    Template = Passive('F_Predator', "img:///UILibrary_FavidsPerkPack.Perk_Ph_Predator", `GetConfigBool("F_Predator_bAWC"), true, true);

    Effect = new class'X2Effect_Predator';
    Effect.EffectName = 'F_Predator';
    Effect.AimBonus = `GetConfigInt("F_Predator_AimBonus");
    Effect.CritBonus = `GetConfigInt("F_Predator_CritBonus");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Survivor
// (AbilityName="F_Survivor")
// Ensures the first killing blow in a mission will not lead to instant death. Also reduces this soldier's wound recovery time.
static function X2AbilityTemplate Survivor()
{
    local X2AbilityTemplate             Template;
    local X2Effect_GuaranteeBleedout    GuaranteeBleedoutEffect;
    local X2Effect_HealOnMissionEnd     HealEffect;

    Template = Passive('F_Survivor', "img:///UILibrary_FavidsPerkPack.Perk_Ph_WellProtected", `GetConfigBool("F_Survivor_bAWC"), false, true);

    GuaranteeBleedoutEffect = new class'X2Effect_GuaranteeBleedout';
    GuaranteeBleedoutEffect.EffectName = 'F_Survivor_Bleedout';
    GuaranteeBleedoutEffect.CountValueName = 'F_Survivor_Activations';
    GuaranteeBleedoutEffect.BonusBleedOutTurns = `GetConfigInt("F_Survivor_BonusBleedOutTurns");
    GuaranteeBleedoutEffect.BuildPersistentEffect(1, true, false);
    Template.AddTargetEffect(GuaranteeBleedoutEffect);

    HealEffect = new class'X2Effect_HealOnMissionEnd';
    HealEffect.EffectName = 'F_Survivor_Heal';
    HealEffect.HealAmount = `GetConfigInt("F_Survivor_WoundReduction");
    HealEffect.bApplyToSelf = true;
    HealEffect.BuildPersistentEffect(1, true, true);
    Template.AddTargetEffect(HealEffect);

    return Template;
}

// Regenerative Mist
// (AbilityName="F_RegenerativeMist")
// Your smoke grenades grant a health restoration effect to all targets in the smoke cloud. Passive.
static function X2AbilityTemplate RegenerativeMist()
{
    return Passive('F_RegenerativeMist', "img:///UILibrary_XPerkIconPack.UIPerk_smoke_medkit", `GetConfigBool("F_RegenerativeMist_bAWC"), true, true);
}

// Controlled Fire
// (AbilityName="F_ControlledFire")
// Additional shots fired from Area Suppression no longer cost ammo.
static function X2AbilityTemplate ControlledFire()
{
    return Passive('F_ControlledFire', "img:///UILibrary_XPerkIconPack.UIPerk_suppression_bullet", `GetConfigBool("F_ControlledFire_bAWC"), true, true);
}

// Added in OnPostTemplatesCreated()
static function X2AbilityCost_Ammo ControlledFireAmmoCost(X2AbilityCost_Ammo OriginalAmmoCost)
{
    local X2AbilityCost_Ammo NewAmmoCost;

    NewAmmoCost = new class'X2AbilityCost_Ammo_ControlledFire';
    NewAmmoCost.iAmmo = OriginalAmmoCost.iAmmo;
    NewAmmoCost.UseLoadedAmmo = OriginalAmmoCost.UseLoadedAmmo;
    NewAmmoCost.bReturnChargesError = OriginalAmmoCost.bReturnChargesError;
    NewAmmoCost.bConsumeAllAmmo = OriginalAmmoCost.bConsumeAllAmmo;
    NewAmmoCost.bFreeCost = OriginalAmmoCost.bFreeCost;

    return NewAmmoCost;
}

// Stiletto
// (AbilityName="F_Stiletto", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Shots with your primary weapon will now pierce armor.
static function X2AbilityTemplate Stiletto()
{
    local X2AbilityTemplate     Template;
    local X2Effect_Stiletto     Effect;
    
    Template = Passive('F_Stiletto', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Needle", `GetConfigBool("F_Stiletto_bAWC"), true, true);

    Effect = new class'X2Effect_Stiletto';
    Effect.EffectName = 'F_Stiletto';
    Effect.PierceBonus = `GetConfigInt("F_Stiletto_PierceBonus");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Stay Covered
// (AbilityName="F_StayCovered")
// Shield Wall no longer lowers your defense.
static function X2AbilityTemplate StayCovered()
{
    return Passive('F_StayCovered', "img:///UILibrary_XPerkIconPack.UIPerk_defense_plus", `GetConfigBool("F_StayCovered_bAWC"), true, true);
}

// Indomitable
// (AbilityName="F_Indomitable")
// Become immune to all damage types for one turn.
static function X2AbilityTemplate Indomitable()
{
    local X2AbilityTemplate     Template;
    local X2Effect_DamageImmune Effect;
    
    Template = SelfTargetActivated('F_Indomitable', "img:///UILibrary_XPerkIconPack.UIPerk_star_defense2", `GetConfigBool("F_Indomitable_bAWC"));
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Indomitable_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_Indomitable_Charges"));
    AddActionPointCost(Template, eCost_Single);

    Template.AddShooterEffectExclusions();

    Effect = new class'X2Effect_DamageImmune';
    Effect.EffectName = 'F_Indomitable';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.BuildPersistentEffect(`GetConfigInt("F_Indomitable_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Perfect Guard
// (AbilityName="F_PerfectGuard")
// Gain additional armor while Shield Wall is active.
static function X2AbilityTemplate PerfectGuard()
{
    local X2AbilityTemplate     Template;
    local X2Effect_PerfectGuard Effect;

    Template = Passive('F_PerfectGuard', "img:///UILibrary_XPerkIconPack.UIPerk_defense_blaze", `GetConfigBool("F_PerfectGuard_bAWC"), true, true);

    Effect = new class'X2Effect_PerfectGuard';
    Effect.EffectName = 'F_PerfectGuard';
    Effect.ArmorBonus = `GetConfigInt("F_PerfectGuard_ArmorBonus");
    Effect.AllowedEffects = default.PerfectGuard_AllowedEffects;
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Shield Regeneration
// (AbilityName="F_ShieldRegeneration")
// Gain Shield at the beginning of each turn if your current Shield is below the specified value
static function X2AbilityTemplate ShieldRegeneration()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitStatCheck         UnitStatCheckCondition;
    local X2Condition_UnitValue             ValueCondition;
    local X2Effect_PersistentStatChange     Effect;

    Template = SelfTargetTrigger('F_ShieldRegeneration', "img:///UILibrary_XPerkIconPack.UIPerk_shield_cycle");

    Template.bCrossClassEligible = `GetConfigBool("F_ShieldRegeneration_bAWC");
    
    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'PlayerTurnBegun';
    Trigger.ListenerData.Filter = eFilter_Player;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
    UnitStatCheckCondition.AddCheckStat(eStat_ShieldHP, `GetConfigInt("F_ShieldRegeneration_MaxShield"), eCheck_LessThan);
    Template.AbilityTargetConditions.AddItem(UnitStatCheckCondition);

    if (`GetConfigInt("F_ShieldRegeneration_ActivationsPerMission") > 0)
    {
        ValueCondition = new class'X2Condition_UnitValue';
        ValueCondition.AddCheckValue('F_ShieldRegeneration_Activations', `GetConfigInt("F_ShieldRegeneration_ActivationsPerMission"), eCheck_LessThan);
        Template.AbilityShooterConditions.AddItem(ValueCondition);
    }

    Effect = new class'X2Effect_PersistentStatChange';
    Effect.EffectName = 'F_ShieldRegeneration';
    Effect.DuplicateResponse = eDupe_Allow;
    Effect.AddPersistentStatChange(eStat_ShieldHP, `GetConfigInt("F_ShieldRegeneration_ShieldAmount"));
    Effect.BuildPersistentEffect(1, true, true);
    Template.AddTargetEffect(Effect);

    Template.bShowActivation = true;

    Template.AdditionalAbilities.AddItem('F_ShieldRegeneration_Passive');

    return Template;
}

static function X2AbilityTemplate ShieldRegenerationPassive()
{
    return Passive('F_ShieldRegeneration_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_shield_cycle", false, true, true);
}

// Calm Mind
// (AbilityName="F_CalmMind")
// Permanently increases your Psi Offense and Will
static function X2AbilityTemplate CalmMind()
{
    local X2AbilityTemplate             Template;
    local X2Effect_PersistentStatChange Effect;

    Template = Passive('F_CalmMind', "img:///UILibrary_XPerkIconPack.UIPerk_mind_plus", `GetConfigBool("F_CalmMind_bAWC"), true, true);

    Effect = new class'X2Effect_PersistentStatChange';
    Effect.EffectName = 'F_CalmMind';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.AddPersistentStatChange(eStat_PsiOffense, `GetConfigInt("F_CalmMind_PsiBonus"));
    Effect.AddPersistentStatChange(eStat_Will, `GetConfigInt("F_CalmMind_WillBonus"));
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseLabel, eStat_PsiOffense, `GetConfigInt("F_CalmMind_PsiBonus"));
    Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, `GetConfigInt("F_CalmMind_WillBonus"));

    return Template;
}

// Suppressing Fire
// (AbilityName="F_SuppressingFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire a standard shot. If the shot does not kill the target, then suppress them.
static function X2AbilityTemplate SuppressingFire()
{
    local X2AbilityTemplate Template;

    Template = Attack('F_SuppressingFire', "img:///UILibrary_XPerkIconPack.UIPerk_suppression_shot_2", `GetConfigBool('F_SuppressingFire_bAWC'), true);

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_SuppressingFire_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, 3, true);
    AddAmmoCost(Template, 1);

    Template.AbilityTargetConditions.AddItem(new class'X2Condition_SuppressingFire');

    Template.PostActivationEvents.AddItem('F_SuppressingFire_Suppress');

    Template.AdditionalAbilities.AddItem('F_SuppressingFire_AddActions');
    Template.AdditionalAbilities.AddItem('F_SuppressingFire_RemoveActions');

    Template.bShowActivation = true;

    return Template;
}

static function X2AbilityTemplate SuppressingFireAddActions()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_GrantActionPoints        Effect;

    Template = SelfTargetTrigger('F_SuppressingFire_AddActions', "img:///UILibrary_XPerkIconPack.UIPerk_suppression_shot_2");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'F_SuppressingFire_Suppress';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 85;
    Template.AbilityTriggers.AddItem(Trigger);

    Effect = new class'X2Effect_GrantActionPoints';
    Effect.NumActionPoints = 1;
    Effect.PointType = default.SuppressingFireActionPoint;
    Template.AddTargetEffect(Effect);

    return Template;
}

static function X2AbilityTemplate SuppressingFireRemoveActions()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2AbilityCost_ActionPoints        ActionPointCost;

    Template = SelfTargetTrigger('F_SuppressingFire_RemoveActions', "img:///UILibrary_XPerkIconPack.UIPerk_suppression_shot_2");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'F_SuppressingFire_Suppress';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 75;
    Template.AbilityTriggers.AddItem(Trigger);

    ActionPointCost = new class'X2AbilityCost_ActionPoints';
    ActionPointCost.iNumPoints = 1;
    ActionPointCost.AllowedTypes.Length = 0;
    ActionPointCost.AllowedTypes.AddItem(default.SuppressingFireActionPoint);
    Template.AbilityCosts.AddItem(ActionPointCost);

    return Template;
}

// Added in OnPostTemplatesCreated()
static function X2AbilityTrigger_EventListener SuppressingFireTrigger()
{
    local X2AbilityTrigger_EventListener Trigger;

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'F_SuppressingFire_Suppress';
    Trigger.ListenerData.Filter = eFilter_Unit;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
    Trigger.ListenerData.Priority = 80;

    return Trigger;
}

// Put 'Em Down
// (AbilityName="F_PutEmDown")
// Grants an aim bonus against targets that are stunned, disoriented, or panicked. Passive.
static function X2AbilityTemplate PutEmDown()
{
    local X2AbilityTemplate     Template;
    local X2Effect_PutEmDown    Effect;

    Template = Passive('F_PutEmDown', "img:///UILibrary_XPerkIconPack.UIPerk_mind_shot", `GetConfigBool("F_PutEmDown_bAWC"), true, true);

    Effect = new class'X2Effect_PutEmDown';
    Effect.EffectName = 'F_PutEmDown';
    Effect.AimBonus = `GetConfigInt("F_PutEmDown_AimBonus");
    Effect.CritBonus = `GetConfigInt("F_PutEmDown_CritBonus");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Will to Survive
// (AbilityName="F_WilltoSurvive")
// Grants a bonus to Armor and Dodge. Passive.
static function X2AbilityTemplate WillToSurvive()
{
    local X2AbilityTemplate             Template;
    local X2Effect_PersistentStatChange Effect;

    Template = Passive('F_WilltoSurvive', "img:///UILibrary_LW_PerkPack.LW_AbilityWilltoSurvive", `GetConfigBool("F_WilltoSurvive_bAWC"), true, true);

    Effect = new class'X2Effect_PersistentStatChange';
    Effect.EffectName = 'F_WilltoSurvive';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.AddPersistentStatChange(eStat_ArmorMitigation, `GetConfigInt("F_WilltoSurvive_ArmorBonus"));
    Effect.AddPersistentStatChange(eStat_Dodge, `GetConfigInt("F_WilltoSurvive_DodgeBonus"));
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, `GetConfigInt("F_WilltoSurvive_ArmorBonus"));
    Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, `GetConfigInt("F_WilltoSurvive_DodgeBonus"));

    return Template;
}

// Watchful Eye
// (AbilityName="F_WatchfulEye", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// You get a free overwatch shot when any target you have holotargeted moves or attacks.
static function X2AbilityTemplate WatchfulEye()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_WatchfulEye', "img:///UILibrary_SOHunter.UIPerk_watchfuleye", `GetConfigBool("F_WatchfulEye_bAWC"), true, true);

    Template.AdditionalAbilities.AddItem('F_WatchfulEye_Attack');

    return Template;
}

static function X2AbilityTemplate WatchfulEyeShot()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2AbilityTarget_Single            SingleTarget;
    local X2Condition_Visibility            VisibilityCondition;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitEffectsWithAbilitySource  TargetEffectCondition;

    Template = Attack('F_WatchfulEye_Attack', "img:///UILibrary_SOHunter.UIPerk_watchfuleye", false, true);
    
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTriggers.Length = 0;
    AddOverwatchTriggers(Template);

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bReactionFire = true;
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    SingleTarget = new class'X2AbilityTarget_Single';
    SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
    Template.AbilityTargetStyle = SingleTarget;

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = true;
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
    Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());

    TargetEffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
    TargetEffectCondition.AddRequireEffect('LWHoloTarget', 'AA_MissingRequiredEffect');
    Template.AbilityTargetConditions.AddItem(TargetEffectCondition);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
    Template.AddShooterEffectExclusions();

    AddBladestormMark(Template, 'F_WatchfulEye_Attack_MarkTarget');
    AddSuppressedCondition(Template);
    AddUnitValueCondition(Template, 'F_WatchfulEye_Activations', `GetConfigInt("F_WatchfulEye_ActivationsPerTurn"));

    AddAmmoCost(Template, 1);

    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Guard
// (AbilityName="F_Guard", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Block the first attack made against you until next turn.
static function X2AbilityTemplate Guard()
{
    local X2AbilityTemplate             Template;
    local X2Effect_IncrementUnitValue   ParryUnitValue;
    
    Template = SelfTargetActivated('F_Guard', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_parry", `GetConfigBool("F_Guard_bAWC"));
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_Guard_Cooldown"));
    AddActionPointCost(Template, eCost_Single);

    Template.AddShooterEffectExclusions();

    ParryUnitValue = new class'X2Effect_IncrementUnitValue';
    ParryUnitValue.NewValueToSet = 1;
    ParryUnitValue.UnitName = class'X2Effect_Guard'.default.CountValueName;
    ParryUnitValue.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(ParryUnitValue);

    Template.AdditionalAbilities.AddItem('F_Guard_Passive');

    return Template;
}

static function X2AbilityTemplate GuardPassive()
{
    local X2AbilityTemplate Template;
    local X2Effect_Guard    Effect;

    Template = Passive('F_Guard_Passive', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_parry", false, false, true);

    Effect = new class'X2Effect_Guard';
    Effect.EffectName = 'F_Guard';
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Safeguard
// (AbilityName="F_Safeguard")
// Allies in a small radius around you gain bonus Defense. This bonus is increased when Shield Wall is used.
static function X2AbilityTemplate Safeguard()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitEffectsWithAbilitySource EffectCondition;
    local X2Effect_Safeguard                Effect;

    Template = SelfTargetTrigger('F_Safeguard', "img:///UILibrary_XPerkIconPack.UIPerk_shield_defense");

    Template.BuildVisualizationFn = none;
    Template.AbilityTargetStyle = default.SingleTargetWithSelf;

    Template.bCrossClassEligible = `GetConfigBool("F_Safeguard_bAWC");

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'M31_BuffMe';
    Trigger.ListenerData.Filter = eFilter_None;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_BuffMe;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = false;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.ExcludeInStasis = false;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

    EffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
    EffectCondition.AddExcludeEffect('F_Safeguard', 'AA_DuplicateEffectIgnored');
    Template.AbilityTargetConditions.AddItem(EffectCondition);

    Effect = new class'X2Effect_Safeguard';
    Effect.EffectName = 'F_Safeguard';
    Effect.DefenseBonus = `GetConfigInt("F_Safeguard_DefenseBonus");
    Effect.ShieldDefenseBonus = `GetConfigInt("F_Safeguard_ShieldDefenseBonus");
    Effect.EffectsForShieldBonus = default.Safeguard_EffectsForShieldBonus;
    Effect.Radius = `GetConfigFloat("F_Safeguard_Radius");
    Effect.bIncludeOwner = `GetConfigBool("F_Safeguard_bIncludeOwner");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.Safeguard_BuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    Template.AdditionalAbilities.AddItem('F_Safeguard_Passive');

    return Template;
}

static function X2AbilityTemplate SafeguardPassive()
{
    return Passive('F_Safeguard_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_shield_defense", false, true, true);
}

// Trade Fire
// (AbilityName="F_TradeFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Until the start of next turn, fire at any enemy that takes a hostile action.
static function X2AbilityTemplate TradeFire()
{
    local X2AbilityTemplate             Template;
    local X2Effect_MeristCoveringFire   CoveringFireEffect;
    local X2Effect_ReserveActionPoints  ReservePointsEffect;
    local X2Effect_SetUnitValue         UnitValueEffect;
    
    Template = SelfTargetActivated('F_TradeFire', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_circle", `GetConfigBool("F_TradeFire_bAWC"));
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_TradeFire_Cooldown"));
    AddActionPointCost(Template, eCost_SingleConsumeAll);
    AddAmmoCost(Template, 1, true);

    Template.AddShooterEffectExclusions();

    CoveringFireEffect = new class'X2Effect_MeristCoveringFire';
    CoveringFireEffect.EffectName = 'F_TradeFire';
    CoveringFireEffect.bMatchSourceWeapon = true;
    CoveringFireEffect.AddAbilityToActivate('F_TradeFire_Attack');
    CoveringFireEffect.bDirectAttackOnly = false;
    CoveringFireEffect.bPreEmptiveFire = false;
    CoveringFireEffect.bAnyHostileAction = true;
    CoveringFireEffect.bOnlyDuringEnemyTurn = true;
    CoveringFireEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    CoveringFireEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(CoveringFireEffect);

    if (`GetConfigBool("F_TradeFire_bUseReserve"))
    {
        ReservePointsEffect = new class'X2Effect_ReserveActionPoints';
        ReservePointsEffect.ReserveType = class'X2Ability_SharpshooterAbilitySet'.default.KillZoneReserveType;
        Template.AddShooterEffect(ReservePointsEffect);
    }

    UnitValueEffect = new class'X2Effect_SetUnitValue';
    UnitValueEffect.UnitName = 'F_TradeFire_Counter';
    UnitValueEffect.NewValueToSet = 0;
    UnitValueEffect.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(UnitValueEffect);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.AdditionalAbilities.AddItem('F_TradeFire_Attack');

    return Template;
}

static function X2AbilityTemplate TradeFireShot()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityToHitCalc_StandardAim    ToHitCalc;
    local X2AbilityTarget_Single            SingleTarget;
    local X2Condition_Visibility            VisibilityCondition;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2AbilityCost_ReserveActionPoints ReserveActionPointCost;

    Template = Attack('F_TradeFire_Attack', "img:///UILibrary_XPerkIconPack.UIPerk_rifle_circle", false, true);
    
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTriggers.Length = 0;
    Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bReactionFire = false;
    ToHitCalc.bIgnoreCoverBonus = `GetConfigBool("F_TradeFire_bIgnoreCoverBonus");
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    SingleTarget = new class'X2AbilityTarget_Single';
    SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
    Template.AbilityTargetStyle = SingleTarget;

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = true;
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
    Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
    Template.AddShooterEffectExclusions();

    AddBladestormMark(Template, 'F_TradeFire_Attack_MarkTarget');
    AddSuppressedCondition(Template);
    AddUnitValueCondition(Template, 'F_TradeFire_Counter', `GetConfigInt("F_TradeFire_ActivationsPerUse"));

    if (`GetConfigBool("F_TradeFire_bUseReserve"))
    {
        ReserveActionPointCost = new class'X2AbilityCost_ReserveActionPoints';
        ReserveActionPointCost.iNumPoints = 1;
        ReserveActionPointCost.bFreeCost = true;
        ReserveActionPointCost.AllowedTypes.AddItem(class'X2Ability_SharpshooterAbilitySet'.default.KillZoneReserveType);
        Template.AbilityCosts.AddItem(ReserveActionPointCost);
    }

    AddAmmoCost(Template, 1);

    Template.bShowActivation = false;
    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

// Intimidate
// (AbilityName="F_Intimidate")
// When targeted by an attack, the enemy has a chance to panic.
static function X2AbilityTemplate Intimidate()
{
    local X2AbilityTemplate             Template;
    local X2Effect_MeristCoveringFire   CoveringFireEffect;

    Template = Passive('F_Intimidate', "img:///UILibrary_DLC3Images.UIPerk_spark_intimidate", `GetConfigBool("F_Intimidate_bAWC"), true, true);

    CoveringFireEffect = new class'X2Effect_MeristCoveringFire';
    CoveringFireEffect.EffectName = 'F_Intimidate';
    CoveringFireEffect.bMatchSourceWeapon = true;
    CoveringFireEffect.AddAbilityToActivate('F_Intimidate_Trigger');
    CoveringFireEffect.bDirectAttackOnly = true;
    CoveringFireEffect.bDirectAttackOnly_AllowMultiTarget = false;
    CoveringFireEffect.bPreEmptiveFire = false;
    CoveringFireEffect.bAnyHostileAction = true;
    CoveringFireEffect.bOnlyDuringEnemyTurn = true;
    CoveringFireEffect.BuildPersistentEffect(1, true, false);
    CoveringFireEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(CoveringFireEffect);

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    Template.AdditionalAbilities.AddItem('F_Intimidate_Trigger');

    return Template;
}

static function X2AbilityTemplate IntimidateTrigger()
{
    local X2AbilityTemplate         Template;
    local X2Condition_UnitProperty  UnitPropertyCondition;
    local X2Effect_Panicked         PanicEffect;

    Template = SelfTargetActivated('F_Intimidate_Trigger', "img:///UILibrary_DLC3Images.UIPerk_spark_intimidate", false);
    
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTargetStyle = default.SimpleSingleTarget;
    Template.AbilityTriggers.Length = 0;
    Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
    Template.AddShooterEffectExclusions();

    AddBladestormMark(Template, 'F_Intimidate_Trigger_MarkTarget');
    AddSuppressedCondition(Template);
    AddUnitValueCondition(Template, 'F_Intimidate_Activations', `GetConfigInt("F_Intimidate_ActivationsPerTurn"));

    PanicEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
    PanicEffect.ApplyChanceFn = ApplyChance_Intimidate;
    PanicEffect.VisualizationFn = class'X2Ability_SparkAbilitySet'.static.Intimidate_Visualization;
    Template.AddTargetEffect(PanicEffect);

    SetFireAnim(Template, 'NO_Intimidate');
    Template.CinescriptCameraType = "Spark_Intimidate";

    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

function name ApplyChance_Intimidate(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState)
{
    local XComGameStateHistory  History;
    local XComGameState_Unit    SourceUnit, TargetUnit;
    local XComGameState_Item    SourceWeapon;
    local name                  ImmuneName;
    local array<int>            ApplyChanceByTech;
    local int                   AttackVal, DefendVal, TargetRoll, RandRoll, Tech;

    History = `XCOMHISTORY;

    if (ApplyEffectParameters.ItemStateObjectRef.ObjectID > 0)
    {
        SourceWeapon = XComGameState_Item(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.ItemStateObjectRef.ObjectID));
        if (SourceWeapon == none)
        {
            SourceWeapon = XComGameState_Item(History.GetGameStateForObjectID(ApplyEffectParameters.ItemStateObjectRef.ObjectID));
        }
    }
    if (SourceWeapon == none)
    {
        SourceUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID));
        if (SourceUnit == none)
        {
            SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID));
        }
        SourceWeapon = SourceUnit.GetItemInSlot(eInvSlot_SecondaryWeapon);
    }
    if (SourceWeapon != none)
    {
        TargetUnit = XComGameState_Unit(kNewTargetState);
        if (TargetUnit != none)
        {
            foreach class'X2AbilityToHitCalc_PanicCheck'.default.PanicImmunityAbilities(ImmuneName)
            {
                if (TargetUnit.FindAbility(ImmuneName).ObjectID != 0)
                {
                    return 'AA_UnitIsImmune';
                }
            }

            ApplyChanceByTech = `GetConfigArrayInt("F_Intimidate_ApplyChance");
            Tech = `GetItemTech(SourceWeapon.GetMyTemplate());
            Tech = Clamp(Tech, 0, ApplyChanceByTech.Length - 1);
            AttackVal = ApplyChanceByTech[Tech];

            DefendVal = TargetUnit.GetCurrentStat(eStat_Will);
            TargetRoll = class'X2AbilityToHitCalc_PanicCheck'.default.BaseValue + AttackVal - DefendVal;
            RandRoll = `SYNC_RAND(100);
            if (RandRoll < TargetRoll)
            {
                return 'AA_Success';
            }
            else
            {
                return 'AA_EffectChanceFailed';
            }
        }
    }
    else
    {
        return 'AA_WeaponIncompatible';
    }
}

// Rampart
// (AbilityName="F_Rampart")
// Activated ability that grants damage reduction to the user and adjacent allies.
static function X2AbilityTemplate Rampart()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
    local X2AbilityPassiveAOE_AbilityRadius PassiveRadius;
    local X2Effect_Persistent               Effect;

    Template = SelfTargetActivated('F_Rampart', "img:///UILibrary_XPerkIconPack.UIPerk_shield_defense2", `GetConfigBool("F_Rampart_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Rampart_Radius"));
    RadiusMultiTarget.bIgnoreBlockingCover = true;
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    PassiveRadius = new class'X2AbilityPassiveAOE_AbilityRadius';
    PassiveRadius.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_Rampart_Radius"));
    Template.AbilityPassiveAOEStyle = PassiveRadius;

    Template.AddShooterEffectExclusions();

    AddCooldown(Template, `GetConfigInt("F_Rampart_Cooldown"));
    AddActionPointCost(Template, eCost_Free);

    Effect = new class'X2Effect_Persistent';
    Effect.EffectName = class'X2Effect_Rampart'.default.RequiredEffectName;
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.BuildPersistentEffect(`GetConfigInt("F_Rampart_Duration"), false, true, false, eGameRule_PlayerTurnBegin);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    Template.AdditionalAbilities.AddItem('F_Rampart_Trigger');
    Template.AdditionalAbilities.AddItem('F_Rampart_Passive');

    return Template;
}

static function X2AbilityTemplate RampartTrigger()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitProperty          UnitPropertyCondition;
    local X2Condition_UnitEffectsWithAbilitySource EffectCondition;
    local X2Effect_Rampart                  Effect;

    Template = SelfTargetTrigger('F_Rampart_Trigger', "img:///UILibrary_XPerkIconPack.UIPerk_shield_defense2");

    Template.BuildVisualizationFn = none;
    Template.AbilityTargetStyle = default.SingleTargetWithSelf;

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'M31_BuffMe';
    Trigger.ListenerData.Filter = eFilter_None;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_BuffMe;
    Trigger.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(Trigger);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = false;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.ExcludeInStasis = false;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

    EffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
    EffectCondition.AddExcludeEffect('F_Rampart', 'AA_DuplicateEffectIgnored');
    Template.AbilityTargetConditions.AddItem(EffectCondition);

    Effect = new class'X2Effect_Rampart';
    Effect.EffectName = 'F_Rampart';
    Effect.DamageReduction = `GetConfigInt("F_Rampart_DamageReduction");
    Effect.Radius = `GetConfigFloat("F_Rampart_Radius");
    Effect.bIncludeOwner = `GetConfigBool("F_Rampart_bIncludeOwner");
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, default.Rampart_BuffText, Template.IconImage,,, Template.AbilitySourceName);
    Template.AddTargetEffect(Effect);

    return Template;
}

static function X2AbilityTemplate RampartPassive()
{
    return Passive('F_Rampart_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_shield_defense2", false, true, true);
}

// Strong Back
// (AbilityName="F_StrongBack")
// Reduces the mobility penalty for each weighted utility item by one. Passive.
static function X2AbilityTemplate StrongBack()
{
    local X2AbilityTemplate Template;
    local X2Effect_ReverseUtilityMobilityPenalites Effect;

    Template = Passive('F_StrongBack', "img:///UILibrary_XPerkIconPack.UIPerk_star_box", `GetConfigBool("F_StrongBack_bAWC"), true, true);

    Effect = new class'X2Effect_ReverseUtilityMobilityPenalites';
    Effect.EffectName = 'F_StrongBack';
    Effect.DuplicateResponse = eDupe_Refresh;
    Effect.SlotsToCheck = default.StrongBack_ApplyToSlots;
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Coordinate Fire
// (AbilityName="F_CoordinateFire", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Fire at the target, then all adjacent allies will fire at that target.
static function X2AbilityTemplate CoordinateFire()
{
    local X2AbilityTemplate         Template;
    local X2AbilityPassiveAOE_AbilityRadius PassiveRadius;
    local X2Condition_Visibility    VisibilityCondition;

    Template = Attack('F_CoordinateFire', "img:///UILibrary_XPerkIconPack.UIPerk_shot_x2", `GetConfigBool("F_CoordinateFire_bAWC"), true);
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    PassiveRadius = new class'X2AbilityPassiveAOE_AbilityRadius';
    PassiveRadius.fTargetRadius = `TILESTOMETERS(`GetConfigFloat("F_CoordinateFire_Radius"));
    Template.AbilityPassiveAOEStyle = PassiveRadius;

    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = `GetConfigBool("F_CoordinateFire_bAllowSquadsight");
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

    AddCooldown(Template, `GetConfigInt("F_CoordinateFire_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, 1);

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    Template.PostActivationEvents.AddItem('F_CoordinateFire');

    return Template;
}

static function X2AbilityTemplate CoordinateFireShot()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2AbilityTarget_Single            SingleTarget;
    local X2Condition_Visibility            VisibilityCondition;
    local X2Condition_UnitProperty          UnitPropertyCondition;

    Template = Attack('F_CoordinateFire_Attack', "img:///UILibrary_XPerkIconPack.UIPerk_shot_x2", false, true);

    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.BuildInterruptGameStateFn = none;

    Template.AbilityTriggers.Length = 0;

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'F_CoordinateFire';
    Trigger.ListenerData.Filter = eFilter_None;
    Trigger.ListenerData.EventFn = AbilityTriggerEventListener_CoordinateFire;
    Trigger.ListenerData.Priority = 80;
    Template.AbilityTriggers.AddItem(Trigger);

    SingleTarget = new class'X2AbilityTarget_Single';
    SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
    Template.AbilityTargetStyle = SingleTarget;

    Template.AbilityShooterConditions.Length = 0;
    Template.AbilityTargetConditions.Length = 0;

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = `GetConfigBool("F_CoordinateFire_bAllowSquadsight");
    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);
    Template.AddShooterEffectExclusions();

    AddSuppressedCondition(Template);

    AddAmmoCost(Template, 1);

    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

static function EventListenerReturn AbilityTriggerEventListener_CoordinateFire(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit            EventSourceUnit;
    local XComGameState_Unit            AbilitySourceUnit;
    local XComGameState_Ability         CallbackAbilityState;
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Item            SourceWeapon;
    local float                         Radius;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());

    if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
    {
        EventSourceUnit = XComGameState_Unit(EventSource);
        CallbackAbilityState = XComGameState_Ability(CallbackData);
        AbilitySourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(CallbackAbilityState.OwnerStateObject.ObjectID));

        if (AbilitySourceUnit.ObjectID != EventSourceUnit.ObjectID && AbilitySourceUnit.IsFriendlyUnit(EventSourceUnit))
        {
            SourceWeapon = CallbackAbilityState.GetSourceWeapon();
            if (SourceWeapon != none && SourceWeapon.InventorySlot == eInvSlot_PrimaryWeapon)
            {
                Radius = `GetConfigFloat("F_CoordinateFire_Radius") + 0.01;
                if (class'Helpers'.static.IsTileInRange(EventSourceUnit.TileLocation, AbilitySourceUnit.TileLocation, Radius * Radius))
                {
                    return CallbackAbilityState.AbilityTriggerEventListener_OriginalTarget(EventData, EventSource, GameState, EventID, CallbackData);
                }
            }
        }
    }

    return ELR_NoInterrupt;
}

// Pack Tactics
// (AbilityName="F_PackTactics")
// If Shield Wall is active, then all adjacent allies will enter overwatch at the end of the turn.
static function X2AbilityTemplate PackTactics()
{
    local X2AbilityTemplate                         Template;
    local X2AbilityTrigger_EventListener            Trigger;
    local X2Condition_TargetHasOneOfTheEffects      EffectCondition;
    local X2Condition_UnitProperty                  UnitPropertyCondition;
    local X2Condition_TargetTileInRange             RangeCondition;
    local X2Effect_MeristReserveOverwatchPoints     ReserveEffect;
    local X2Effect_MeristCoveringFire               CoveringFireEffect;
    local X2Condition_TargetHasOneOfTheAbilities    CoveringFireCondition;

    Template = SelfTargetTrigger('F_PackTactics', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_defense2");

    Template.bCrossClassEligible = `GetConfigBool("F_PackTactics_bAWC");

    Template.AbilityMultiTargetStyle = new class'X2AbilityMultiTarget_AllAllies';

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'PlayerTurnEnded';
    Trigger.ListenerData.Filter = eFilter_Player;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Trigger.ListenerData.Priority = 20;
    Template.AbilityTriggers.AddItem(Trigger);

    EffectCondition = new class'X2Condition_TargetHasOneOfTheEffects';
    EffectCondition.EffectNames = default.PackTactics_AllowedEffects;
    Template.AbilityTargetConditions.AddItem(EffectCondition);

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeHostileToSource = true;
    UnitPropertyCondition.ExcludeFriendlyToSource = false;
    UnitPropertyCondition.RequireSquadmates = true;
    UnitPropertyCondition.FailOnNonUnits = true;
    UnitPropertyCondition.ExcludeUnableToAct = true;
    UnitPropertyCondition.TreatMindControlledSquadmateAsHostile = false;
    Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

    RangeCondition = new class'X2Condition_TargetTileInRange';
    RangeCondition.Range = `GetConfigFloat("F_PackTactics_Radius");
    Template.AbilityMultiTargetConditions.AddItem(RangeCondition);

    ReserveEffect = new class'X2Effect_MeristReserveOverwatchPoints';
    // Template.AddTargetEffect(ReserveEffect);
    Template.AddMultiTargetEffect(ReserveEffect);

    CoveringFireCondition = new class'X2Condition_TargetHasOneOfTheAbilities';
    CoveringFireCondition.AbilityNames.AddItem('CoveringFire');

    CoveringFireEffect = new class'X2Effect_MeristCoveringFire';
    CoveringFireEffect.AbilitiesToActivate = class'X2Effect_MeristReserveOverwatchPoints'.default.OverwatchAbilities;
    CoveringFireEffect.bMatchSourceWeapon = false;
    CoveringFireEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    CoveringFireEffect.TargetConditions.AddItem(CoveringFireCondition);
    // Template.AddTargetEffect(CoveringFireEffect);
    Template.AddMultiTargetEffect(CoveringFireEffect);
    
    Template.bSkipFireAction = true;

    Template.BuildVisualizationFn = PackTactics_BuildVisualization;

    return Template;
}

static function X2AbilityTemplate PackTacticsPassive()
{
    return Passive('F_PackTactics_Passive', "img:///UILibrary_XPerkIconPack.UIPerk_overwatch_defense2", false, true, true);
}

simulated function PackTactics_BuildVisualization(XComGameState VisualizeGameState)
{
    local XComGameStateHistory          History;
    local XComGameStateContext_Ability  Context;

    local StateObjectReference          SourceUnitRef;
    local StateObjectReference          TargetUnitRef;
    local X2AbilityTemplate             AbilityTemplate;

    local VisualizationActionMetadata   EmptyTrack;
    local VisualizationActionMetadata   SourceTrack;
    local VisualizationActionMetadata   TargetTrack;
    local X2Action_PlaySoundAndFlyOver  SoundAndFlyOver;
    local X2Action_PlaySoundAndFlyOver  SoundAndFlyoverTarget;

    local int                           Index;

    History = `XCOMHISTORY;
    Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

    AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);

    SourceUnitRef = Context.InputContext.SourceObject;

    SourceTrack = EmptyTrack;
    SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(SourceUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(SourceUnitRef.ObjectID);
    SourceTrack.VisualizeActor = History.GetVisualizer(SourceUnitRef.ObjectID);

    SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
    SoundAndFlyOver.SetSoundAndFlyOverParameters(none, AbilityTemplate.LocFlyOverText, '', eColor_Good, AbilityTemplate.IconImage);

    for (Index = 0; Index < Context.InputContext.MultiTargets.Length; Index++)
    {
        TargetUnitRef = Context.InputContext.MultiTargets[Index];
        if (TargetUnitRef.ObjectID != 0 && TargetUnitRef.ObjectID != SourceUnitRef.ObjectID)
        {
            TargetTrack = EmptyTrack;
            TargetTrack.StateObject_OldState = History.GetGameStateForObjectID(TargetUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
            TargetTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(TargetUnitRef.ObjectID);
            TargetTrack.VisualizeActor = History.GetVisualizer(TargetUnitRef.ObjectID);

            SoundAndFlyoverTarget = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(TargetTrack, context, false, TargetTrack.LastActionAdded));
            SoundAndFlyoverTarget.SetSoundAndFlyOverParameters(none, AbilityTemplate.LocFlyOverText, 'None', eColor_Good, AbilityTemplate.IconImage);
        }
    }
}

// Parry
// (AbilityName="F_Parry", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// You may parry melee attacks and counterattack with a Shield Bash.
static function X2AbilityTemplate Parry()
{
    local X2AbilityTemplate                 Template;

    Template = Passive('F_Parry', "img:///UILibrary_LW_Overhaul.LW_AbilityCombatives", `GetConfigBool("F_Parry_bAWC"), true, true);

    Template.AdditionalAbilities.AddItem('F_Parry_Attack');
    Template.AdditionalAbilities.AddiTEm('F_Parry_Preparation');
    Template.AdditionalAbilities.AddItem('F_Parry_Counterattack');

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// The attack used for the counter
static function X2AbilityTemplate ParryAttack()
{
    local X2AbilityTemplate             Template;
    local array<name>                   SkipExclusions;
    local X2AbilityToHitCalc_StandardMelee ToHitCalc;
    local X2AbilityCost_ActionPoints    ActionPointCost;
    local X2Effect_SetUnitValue         SetValueEffect;
    local X2Effect_RemoveEffects        RemoveEffects;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'F_Parry_Attack');

    Template.IconImage = "img:///UILibrary_LW_Overhaul.LW_AbilityCombatives";
    Template.AbilitySourceName = 'eAbilitySource_Perk'; 
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
    Template.Hostility = eHostility_Offensive;
    Template.DisplayTargetHitChance = true;

    Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');

    Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

    Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

    SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
    Template.AddShooterEffectExclusions(SkipExclusions);

    Template.AbilityTargetStyle = default.SimpleSingleTarget;

    ToHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
    Template.AbilityToHitCalc = ToHitCalc;
    Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

    ActionPointCost = new class'X2AbilityCost_ActionPoints';
    ActionPointCost.iNumPoints = 1;
    ActionPointCost.bConsumeAllPoints = true;
    ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.CounterattackActionPoint);
    Template.AbilityCosts.AddItem(ActionPointCost);

    Template.bAllowAmmoEffects = true;
    Template.bAllowBonusWeaponEffects = true;

    Template.bAllowFreeFireWeaponUpgrade = false;

    Template.AddTargetEffect(ShieldTraumaEffect());
    Template.AddTargetEffect(new class'X2Effect_ApplyWeaponDamage');
    Template.AddTargetEffect(class'X2StatusEffects'.static.CreateDisorientedStatusEffect(true,, false));

    // The unit gets to counterattack once
    if (`GetConfigBool("F_Parry_bOncePerTurn"))
    {
        SetValueEffect = new class'X2Effect_SetUnitValue';
        SetValueEffect.UnitName = class'X2Ability'.default.CounterattackDodgeEffectName;
        SetValueEffect.NewValueToSet = 0;
        SetValueEffect.CleanupType = eCleanup_BeginTurn;
        SetValueEffect.SetupEffectOnShotContextResult(true, true);
        Template.AddShooterEffect(SetValueEffect);
    }

    // Remove the dodge increase (happens with a counter attack, which is one time per turn)
    RemoveEffects = new class'X2Effect_RemoveEffects';
    RemoveEffects.EffectNamesToRemove.AddItem(class'X2Ability'.default.CounterattackDodgeEffectName);
    RemoveEffects.SetupEffectOnShotContextResult(true, true);
    Template.AddShooterEffect(RemoveEffects);

    Template.bUsesFiringCamera = true;
    Template.CinescriptCameraType = "Ranger_Reaper";

    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
    Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

    Template.bDisplayInUITooltip = false;
    Template.bDisplayInUITacticalText = false;

    Template.bCrossClassEligible = false;

    Template.bShowActivation = true;
    Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

    Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
    Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
    Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// Grants the passive dodge bonus during the enemy turn to increase the odds of Parry activating
static function X2AbilityTemplate ParryPreparation()
{
    local X2AbilityTemplate                 Template;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Effect_ToHitModifier            DodgeEffect;
    local X2Effect_SetUnitValue             SetValueEffect;

    Template = SelfTargetTrigger('F_Parry_Preparation', "img:///UILibrary_LW_Overhaul.LW_AbilityCombatives");

    Template.bDisplayInUITooltip = false;
    Template.bDisplayInUITacticalText = false;
    Template.bDontDisplayInAbilitySummary = true;

    Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'PlayerTurnEnded';
    Trigger.ListenerData.Filter = eFilter_Player;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
    Template.AbilityTriggers.AddItem(Trigger);
    // Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_UnitPostBeginPlay');

    DodgeEffect = new class'X2Effect_ToHitModifier';
    DodgeEffect.EffectName = class'X2Ability'.default.CounterattackDodgeEffectName;
    DodgeEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
    // AddEffectHitModifier(
    //     EAbilityHitResult ModType,
    //     int ModAmount,
    //     string ModReason,
    //     class<X2AbilityToHitCalc> MatchToHit = class'X2AbilityToHitCalc_StandardAim',
    //     bool Melee = true,
    //     bool NonMelee = true,
    //     bool Flanked = true,
    //     bool NonFlanked = true,
    //     optional array<name> AbilityArrayNames,
    //     bool ApplyIfImpaired = true,
    //     optional bool MatchSourceWeapon)
    DodgeEffect.AddEffectHitModifier(eHit_Graze, `GetConfigInt("F_Parry_DodgeBonus"), Template.LocFriendlyName,
        class'X2AbilityToHitCalc_StandardMelee', true, false, true, true,, false);
    DodgeEffect.bApplyAsTarget = true;
    Template.AddShooterEffect(DodgeEffect);

    SetValueEffect = new class'X2Effect_SetUnitValue';
    SetValueEffect.UnitName = class'X2Ability'.default.CounterattackDodgeEffectName;
    SetValueEffect.NewValueToSet = class'X2Ability'.default.CounterattackDodgeUnitValue;
    SetValueEffect.CleanupType = eCleanup_BeginTurn;
    Template.AddTargetEffect(SetValueEffect);

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// Activates the attack when a melee attack misses or grazes
static function X2AbilityTemplate ParryCounterattack()
{
    local X2AbilityTemplate Template;
    local X2AbilityTrigger_EventListener EventListener;

    Template = SelfTargetTrigger('F_Parry_Counterattack', "img:///UILibrary_LW_Overhaul.LW_AbilityCombatives");

    Template.bDisplayInUITooltip = false;
    Template.bDisplayInUITacticalText = false;
    Template.bDontDisplayInAbilitySummary = true;

    EventListener = new class'X2AbilityTrigger_EventListener';
    EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
    EventListener.ListenerData.EventID = 'AbilityActivated';
    EventListener.ListenerData.Filter = eFilter_None;
    EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.MeleeCounterattackListener;
    EventListener.ListenerData.Priority = 50;
    Template.AbilityTriggers.AddItem(EventListener);

    Template.CinescriptCameraType = "Muton_Counterattack";

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    return Template;
}

// Mind Blast
// (AbilityName="F_MindBlast", ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Deal a small amount of damage based on secondary weapon tier and remove action points from the target for next turn. Cooldown-based.
static function X2AbilityTemplate MindBlast()
{
    local X2AbilityTemplate             Template;
    local X2Condition_UnitProperty      UnitPropertyCondition;
    local X2Effect_ApplyWeaponDamage    WeaponDamageEffect;
    local X2Effect_Stunned              StunnedEffect;

    Template = SelfTargetActivated('F_MindBlast', "img:///UILibrary_FavidsPerkPack.UIPerk_MindBlast", `GetConfigBool("F_MindBlast_bAWC"));

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
    Template.AbilitySourceName = 'eAbilitySource_Psionic';
    Template.Hostility = eHostility_Offensive;

    Template.AbilityTargetStyle = default.SimpleSingleTarget;

    UnitPropertyCondition = new class'X2Condition_UnitProperty';
    UnitPropertyCondition.ExcludeRobotic = true;
    UnitPropertyCondition.FailOnNonUnits = true;
    Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
    Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

    Template.AddShooterEffectExclusions();

    AddCooldown(Template, `GetConfigInt("F_MindBlast_Cooldown"));
    AddActionPointCost(Template, eCost_SingleConsumeAll);

    StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(`GetConfigInt("F_MindBlast_StunDuration"), 100, false);
    StunnedEffect.bRemoveWhenSourceDies = false;
    Template.AddTargetEffect(StunnedEffect);

    WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
    WeaponDamageEffect.bIgnoreBaseDamage = true;
    WeaponDamageEffect.DamageTag = 'F_MindBlast';
    WeaponDamageEffect.bBypassShields = true;
    WeaponDamageEffect.bIgnoreArmor = true;
    Template.AddTargetEffect(WeaponDamageEffect);

    Template.CustomFireAnim = 'HL_M31_MindBlast';
    Template.CinescriptCameraType = "Psionic_FireAtUnit";
    Template.ActivationSpeech = 'Mindblast';

    Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

    Template.DefaultSourceItemSlot = eInvSlot_SecondaryWeapon;

    Template.AdditionalAbilities.AddItem('F_MindBlast_Anims');

    return Template;
}

static function X2AbilityTemplate MindBlastAnims()
{
    local X2AbilityTemplate             Template;
    local X2Effect_AdditionalAnimSets   AnimSetEffect;

    Template = Passive('F_MindBlast_Anims', "", false, false, true);

    Template.bDisplayInUITooltip = false;
    Template.bDisplayInUITacticalText = false;
    Template.bDontDisplayInAbilitySummary = true;

    Template.AbilityTargetConditions.AddItem(class'X2Condition_AnimSet'.static.SoldierAnimSetCondition());

    AnimSetEffect = new class'X2Effect_AdditionalAnimSets';
    AnimSetEffect.AddAnimSetWithPath("M31_EPP_Psi_ANIMS.Anims.AS_MindBlast");
    AnimSetEffect.BuildPersistentEffect(1, true, false);
    Template.AddTargetEffect(AnimSetEffect);

    return Template;
}

// Sense Panic
// (AbilityName="F_SensePanic")
// Shots against targets that are suffering from mental impairments ignore half of cover bonuses.
static function X2AbilityTemplate SensePanic()
{
    local X2AbilityTemplate     Template;
    local X2Effect_SensePanic   Effect;

    Template = Passive('F_SensePanic', "img:///UILibrary_XPerkIconPack.UIPerk_enemy_shot_psi", `GetConfigBool("F_SensePanic_bAWC"), true, true);

    Effect = new class'X2Effect_SensePanic';
    Effect.EffectName = 'F_SensePanic';
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Over Exertion
// (AbilityName="F_OverExertion")
// Immediately gain a standard action point.
static function X2AbilityTemplate OverExertion()
{
    local X2AbilityTemplate             Template;
    local X2Effect_GrantActionPoints    Effect;
    
    Template = SelfTargetActivated('F_OverExertion', "img:///UILibrary_DLC3Images.UIPerk_spark_overdrive", `GetConfigBool("F_OverExertion_bAWC"));
    
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

    AddCooldown(Template, `GetConfigInt("F_OverExertion_Cooldown"));
    AddCharges(Template, `GetConfigInt("F_OverExertion_Charges"));
    AddActionPointCost(Template, eCost_Free);

    Template.AddShooterEffectExclusions();

    Effect = new class'X2Effect_GrantActionPoints';
    Effect.NumActionPoints = 1;
    Effect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
    Template.AddTargetEffect(Effect);

    Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

    return Template;
}

// Riot Control
// (AbilityName="F_RiotControl")
// Grants a free Flashbang and Smoke Grenade
static function X2AbilityTemplate RiotControl()
{
    local X2AbilityTemplate Template;

    Template = Passive('F_RiotControl', "img:///UILibrary_PerkIcons.UIPerk_grenade_flash", `GetConfigBool("F_RiotControl_bAWC"), false);

    Template.AddTargetEffect(class'XMBEffect_AddGrenade'.static.AddGrenadeEffect('FlashbangGrenade'));
    Template.AddTargetEffect(class'XMBEffect_AddGrenade'.static.AddGrenadeEffect('SmokeGrenade'));

    return Template;
}

defaultproperties
{
    SuppressingFireActionPoint = F_SuppressingFire
}