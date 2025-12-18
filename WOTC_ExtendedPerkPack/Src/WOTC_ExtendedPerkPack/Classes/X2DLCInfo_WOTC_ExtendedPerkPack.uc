class X2DLCInfo_WOTC_ExtendedPerkPack extends X2DownloadableContentInfo;

struct ItemTech
{
    var name Tech;
    var int Tier;
};

var config(XComGameData_SoldierSkills) array<ItemTech> GremlinTiers;
var config(XComGameData_SoldierSkills) array<ItemTech> WeaponTiers;
var config(XComGameData_SoldierSkills) array<ItemTech> ArmorTiers;
var config(XComGameData_SoldierSkills) array<name> ExplosiveDamageTypes;
var config(XComGameData_SoldierSkills) array<name> SmokeGrenades;
var array<name> CBAC_AllowedTypes;

var privatewrite config array<name> CachedActiveMods;

var config bool bLog;

var localized string strFreeAction;
var localized string strDefaultWeapon;

var localized array<name> LocalizedAbilities;
var localized array<name> LocalizedAbilitiesToHide;
var localized array<string> LocalizedAbilityNames;

var privatewrite config array<string> LikeLightning_Abilities;
var privatewrite config array<string> QuickPatch_Abilities;
var privatewrite config array<string> LickYourWounds_Abilities;

static event OnPostTemplatesCreated()
{
    local X2AbilityTemplateManager AbilityTemplateManager;
    local name AbilityName;

    `LOG("OnPostTemplatesCreated", default.bLog, 'WOTC_ExtendedPerkPack');

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    foreach class'X2Ability_ExtendedPerkPack'.default.Imposition_AllowedAbilities(AbilityName)
    {
        PatchAbilityForImposition(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.TrenchWarfare_AllowedAbilities(AbilityName)
    {
        PatchAbilityForTrenchWarfare(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.Botnet_AllowedAbilities(AbilityName)
    {
        PatchAbilityForBotnet(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.Bloodlet_AllowedAbilities(AbilityName)
    {
        PatchAbilityForBloodlet(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.Havoc_AllowedAbilities(AbilityName)
    {
        PatchAbilityForHavoc(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.ShieldTrauma_IncludeAbilities(AbilityName)
    {
        PatchAbilityForShieldTrauma(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.ControlledFire_AllowedAbilities(AbilityName)
    {
        PatchAbilityForControlledFire(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.SuppressingFire_AllowedAbilities(AbilityName)
    {
        PatchAbilityForSuppressingFire(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    foreach class'X2Ability_ExtendedPerkPack'.default.CoordinateFire_IncludeAbilities(AbilityName)
    {
        PatchAbilityForCoordinateFire(AbilityTemplateManager.FindAbilityTemplate(AbilityName));
    }

    PatchAbilityForStayCovered(AbilityTemplateManager.FindAbilityTemplate('ShieldWall'));

    AddEffectsToGrenades();
    GetLocalizedAbilityLists();
}

static function AddEffectToAbility(X2AbilityTemplate Template, X2Effect Effect, optional bool bApplyToTarget = true, optional bool bApplyToMultiTarget = true)
{
    if (Template != none)
    {
        if (bApplyToTarget && Template.AbilityTargetEffects.Length > 0)
        {
            Template.AddTargetEffect(Effect);
        }
        if (bApplyToMultiTarget && Template.AbilityMultiTargetEffects.Length > 0)
        {
            Template.AddMultiTargetEffect(Effect);
        }
    }
}

static function PatchAbilityForImposition(X2AbilityTemplate Template)
{
    local X2Effect Effect;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());

        Effect = class'X2Ability_ExtendedPerkPack'.static.ImpositionEffect();
        AddEffectToAbility(Template, Effect);
    }
}

static function PatchAbilityForTrenchWarfare(X2AbilityTemplate Template)
{
    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        Template.AbilityTriggers.AddItem(class'X2Ability_ExtendedPerkPack'.static.TrenchWarfareTrigger());
    }
}

static function PatchAbilityForBotnet(X2AbilityTemplate Template)
{
    local X2Effect Effect;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        Effect = class'X2Ability_ExtendedPerkPack'.static.BotnetEffect();
        AddEffectToAbility(Template, Effect);
    }
}

static function PatchAbilityForBloodlet(X2AbilityTemplate Template)
{
    local X2Effect Effect;

    if (Template != none)
    {
        Effect = class'X2Ability_ExtendedPerkPack'.static.BloodletEffect();
        AddEffectToAbility(Template, Effect);
    }
}

static function PatchAbilityForHavoc(X2AbilityTemplate Template)
{
    local X2Effect Effect;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        Effect = class'X2Ability_ExtendedPerkPack'.static.HavocEffect();
        AddEffectToAbility(Template, Effect,, `GetConfigBool("F_Havoc_bApplyToMultiTarget"));
    }
}

static function PatchAbilityForShieldTrauma(X2AbilityTemplate Template)
{
    local X2Effect                      Effect;
    local int                           Index;
    local X2Effect                      TargetEffect;
    local X2Effect_Stunned              StunnedEffect;
    local X2Condition                   TargetCondition;
    local X2Condition_AbilityProperty   AbilityCondition;
    local bool                          bFoundEffect;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        
        Effect = class'X2Ability_ExtendedPerkPack'.static.ShieldTraumaEffect();

        if (Template.AbilityTargetEffects.Length > 0)
        {
            foreach Template.AbilityTargetEffects(TargetEffect)
            {
                StunnedEffect = X2Effect_Stunned(TargetEffect);
                if (StunnedEffect != none)
                {
                    foreach StunnedEffect.TargetConditions(TargetCondition)
                    {
                        AbilityCondition = X2Condition_AbilityProperty(TargetCondition);
                        if (AbilityCondition != none)
                        {
                            if (AbilityCondition.OwnerHasSoldierAbilities.Find('F_ShieldTrauma') != INDEX_NONE)
                            {
                                `LOG(Template.DataName $ " already has a Shield Trauma effect");
                                StunnedEffect.ApplyChance = `GetConfigInt("F_ShieldTrauma_StunChance");
                                StunnedEffect.StunLevel = `GetConfigInt("F_ShieldTrauma_StunDuration");
                                bFoundEffect = true;
                            }
                        }
                    }
                }
            }

            if (!bFoundEffect)
            {
                for (Index = 0; Index < Template.AbilityTargetEffects.Length; Index++)
                {
                    if (X2Effect_ApplyWeaponDamage(Template.AbilityTargetEffects[Index]) != none)
                    {
                        Template.AbilityTargetEffects.InsertItem(Index, Effect);
                        break;
                    }
                }
                if (Index == Template.AbilityTargetEffects.Length)
                {
                    Template.AddTargetEffect(Effect);
                }
            }
        }
        if (Template.AbilityMultiTargetEffects.Length > 0)
        {
            bFoundEffect = false;
            foreach Template.AbilityMultiTargetEffects(TargetEffect)
            {
                StunnedEffect = X2Effect_Stunned(TargetEffect);
                if (StunnedEffect != none)
                {
                    foreach StunnedEffect.TargetConditions(TargetCondition)
                    {
                        AbilityCondition = X2Condition_AbilityProperty(TargetCondition);
                        if (AbilityCondition != none)
                        {
                            if (AbilityCondition.OwnerHasSoldierAbilities.Find('F_ShieldTrauma') != INDEX_NONE)
                            {
                                `LOG(Template.DataName $ " already has a Shield Trauma effect");
                                StunnedEffect.ApplyChance = `GetConfigInt("F_ShieldTrauma_StunChance");
                                StunnedEffect.StunLevel = `GetConfigInt("F_ShieldTrauma_StunDuration");
                                bFoundEffect = true;
                            }
                        }
                    }
                }
            }

            if (!bFoundEffect)
            {
                for (Index = 0; Index < Template.AbilityMultiTargetEffects.Length; Index++)
                {
                    if (X2Effect_ApplyWeaponDamage(Template.AbilityMultiTargetEffects[Index]) != none)
                    {
                        Template.AbilityMultiTargetEffects.InsertItem(Index, Effect);
                        break;
                    }
                }
                if (Index == Template.AbilityMultiTargetEffects.Length)
                {
                    Template.AddMultiTargetEffect(Effect);
                }
            }
        }
    }
}

static function PatchAbilityForControlledFire(X2AbilityTemplate Template)
{
    local X2AbilityCost         AbilityCost;
    local X2AbilityCost_Ammo    AmmoCost;
    local int                   Index;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        foreach Template.AbilityCosts(AbilityCost, Index)
        {
            AmmoCost = X2AbilityCost_Ammo(AbilityCost);
            if (AmmoCost != none)
            {
                Template.AbilityCosts[Index] = class'X2Ability_ExtendedPerkPack'.static.ControlledFireAmmoCost(AmmoCost);
            }
        }
    }
}

static function PatchAbilityForSuppressingFire(X2AbilityTemplate Template)
{
    local X2AbilityCost                 AbilityCost;
    local X2AbilityCost_ActionPoints    ActionPointCost;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        foreach Template.AbilityCosts(AbilityCost)
        {
            ActionPointCost = X2AbilityCost_ActionPoints(AbilityCost);
            if (ActionPointCost != none)
            {
                ActionPointCost.AllowedTypes.AddItem(class'X2Ability_ExtendedPerkPack'.default.SuppressingFireActionPoint);
            }
        }
        Template.AbilityTriggers.AddItem(class'X2Ability_ExtendedPerkPack'.static.SuppressingFireTrigger());
    }
}

static function PatchAbilityForCoordinateFire(X2AbilityTemplate Template)
{
    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());
        Template.AdditionalAbilities.AddItem('F_CoordinateFire_Attack');
    }
}

static function PatchAbilityForStayCovered(X2AbilityTemplate Template)
{
    local X2Effect                      Effect;
    local X2Effect_PersistentStatChange PersistentStatChangeEffect;
    local X2Effect_PersistentStatChange NewPersistentStatChangeEffect;
    local X2Condition_SoldierAbilities  AbilityCondition;
    local X2Condition_SoldierAbilities  NoAbilityCondition;
    local int                           Index;

    if (Template != none)
    {
        `LOG(Template.DataName, default.bLog, GetFuncName());

        NoAbilityCondition = new class'X2Condition_SoldierAbilities';
        NoAbilityCondition.ExcludedAbilities.AddItem('F_StayCovered');

        AbilityCondition = new class'X2Condition_SoldierAbilities';
        AbilityCondition.RequiredAbilities.AddItem('F_StayCovered');

        foreach Template.AbilityTargetEffects(Effect)
        {
            PersistentStatChangeEffect = X2Effect_PersistentStatChange(Effect);
            if (PersistentStatChangeEffect != none)
            {
                // Make a copy of the existing stat change effect
                NewPersistentStatChangeEffect = new class'X2Effect_PersistentStatChange'(PersistentStatChangeEffect);
                // Add (no) ability condition to the old effect
                PersistentStatChangeEffect.TargetConditions.AddItem(NoAbilityCondition);
                // Remove negative defense stat change from the new effect
                for (Index = NewPersistentStatChangeEffect.m_aStatChanges.Length - 1; Index >= 0; Index--)
                {
                    if (NewPersistentStatChangeEffect.m_aStatChanges[Index].StatType == eStat_Defense
                        && NewPersistentStatChangeEffect.m_aStatChanges[Index].StatAmount < 0)
                    {
                        NewPersistentStatChangeEffect.m_aStatChanges.Remove(Index, 1);
                    }
                }
                // Add ability condition to the new effect 
                NewPersistentStatChangeEffect.TargetConditions.AddItem(AbilityCondition);
                // Add new effect to the ability
                Template.AddTargetEffect(NewPersistentStatChangeEffect);
                break;
            }
        }
    }
}

static function AddEffectsToGrenades()
{
    local X2ItemTemplateManager         ItemManager;
    local array<name>                   TemplateNames;
    local array<X2DataTemplate>         TemplateAllDifficulties;
    local X2DataTemplate                Template;
    local X2GrenadeTemplate             GrenadeTemplate;
    local name                          TemplateName;

    local X2Effect_EPPApplyCombatDrugsToWorld   CombatDrugsWorldEffect;
    local X2Effect                              CombatDrugsEffect;
    local X2Effect_EPPApplyRegenMistToWorld     RegenMistWorldEffect;
    local X2Effect                              RegenMistEffect;

    ItemManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
    ItemManager.GetTemplateNames(TemplateNames);
    foreach TemplateNames(TemplateName)
    {
        ItemManager.FindDataTemplateAllDifficulties(TemplateName, TemplateAllDifficulties);
        
        foreach TemplateAllDifficulties(Template)
        {
            GrenadeTemplate = X2GrenadeTemplate(Template);
            if (GrenadeTemplate != none)
            {
                if (default.SmokeGrenades.Find(GrenadeTemplate.DataName) != INDEX_NONE)
                {
                    // Combat Stimulants
                    CombatDrugsWorldEffect = new class'X2Effect_EPPApplyCombatDrugsToWorld';
                    CombatDrugsEffect = class'X2Effect_EPPCombatDrugs'.static.CombatDrugsEffect();
                    GrenadeTemplate.ThrownGrenadeEffects.AddItem(CombatDrugsWorldEffect);
                    GrenadeTemplate.ThrownGrenadeEffects.AddItem(CombatDrugsEffect);
                    GrenadeTemplate.LaunchedGrenadeEffects.AddItem(CombatDrugsWorldEffect);
                    GrenadeTemplate.LaunchedGrenadeEffects.AddItem(CombatDrugsEffect);
                    // Regenerative Mist
                    RegenMistWorldEffect = new class'X2Effect_EPPApplyRegenMistToWorld';
                    RegenMistEffect = class'X2Effect_EPPRegenMist'.static.RegenMistEffect();
                    GrenadeTemplate.ThrownGrenadeEffects.AddItem(RegenMistWorldEffect);
                    GrenadeTemplate.ThrownGrenadeEffects.AddItem(RegenMistEffect);
                    GrenadeTemplate.LaunchedGrenadeEffects.AddItem(RegenMistWorldEffect);
                    GrenadeTemplate.LaunchedGrenadeEffects.AddItem(RegenMistEffect);
                }
            }
        }
    }
}

static function GetLocalizedAbilityLists()
{
    local X2DataTemplate            IterateTemplate;
    local array<X2DataTemplate>     DataTemplates;
    local X2DataTemplate            DataTemplate;
    local X2AbilityTemplate         Template;
    local int                       Index;
    local string                    OutString;

    local X2AbilityTemplateManager  AbilityMgr;

    AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    foreach AbilityMgr.IterateTemplates(IterateTemplate)
    {
        if (!ClassIsChildOf(IterateTemplate.Class, class'X2AbilityTemplate')) continue;

        AbilityMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);

        foreach DataTemplates(DataTemplate)
        {
            Template = X2AbilityTemplate(DataTemplate);

            if (default.LocalizedAbilitiesToHide.Find(Template.DataName) != INDEX_NONE)
                continue;

            Index = default.LocalizedAbilities.Find(Template.DataName);
            if (Index == INDEX_NONE)
                OutString = Template.LocFriendlyName;
            else
                OutString = default.LocalizedAbilityNames[Index];

            if (class'X2Ability_ExtendedPerkPack'.default.LikeLightning_AllowedAbilities.Find(Template.DataName) != INDEX_NONE)
                default.LikeLightning_Abilities.AddItem(OutString);
            if (class'X2Ability_ExtendedPerkPack'.default.QuickPatch_AllowedAbilities.Find(Template.DataName) != INDEX_NONE)
                default.QuickPatch_Abilities.AddItem(OutString);
            if (class'X2Ability_ExtendedPerkPack'.default.LickYourWounds_AllowedAbilities.Find(Template.DataName) != INDEX_NONE)
                default.LickYourWounds_Abilities.AddItem(OutString);
        }
    }
    default.LikeLightning_Abilities.Sort(SortAbilities);
    default.QuickPatch_Abilities.Sort(SortAbilities);
    default.LickYourWounds_Abilities.Sort(SortAbilities);
}

delegate int SortAbilities(string A, string B)
{
    local int Index;

    for (Index = 0; Index < Min(Len(A), Len(B)); Index++)
    {
        if (A > B)
            return -1;
        else if (A < B)
            return 1;
    }

    if (Len(A) > Len(B))
        return -1;
    else if (Len(A) < Len(B))
        return 1;
    else
        return 0;
}

static function OnPreCreateTemplates()
{
    GetActiveMods();
}

static final function GetActiveMods()
{
    local XComOnlineEventMgr    EventManager;
    local int                   Index;

    EventManager = `ONLINEEVENTMGR;

    for (Index = EventManager.GetNumDLC() - 1; Index >= 0; Index--) 
    {
        default.CachedActiveMods.AddItem(EventManager.GetDLCNames(Index));
    }
}

static final function bool IsModActive(name ModName)
{
    return default.CachedActiveMods.Find(ModName) != INDEX_NONE;
}

static final function bool AreModsActive(const array<name> ModNames)
{
    local name ModName;

    foreach ModNames(ModName)
    {
        if (!IsModActive(ModName))
        {
            return false;
        }
    }
    return true;
}

static function int GetItemTech(X2ItemTemplate ItemTemplate)
{
    local X2WeaponTemplate      WeaponTemplate;
    local X2ArmorTemplate       ArmorTemplate;
    local X2GremlinTemplate     GremlinTemplate;
    local int Index;

    if (ItemTemplate != none)
    {
        GremlinTemplate = X2GremlinTemplate(ItemTemplate);
        WeaponTemplate = X2WeaponTemplate(ItemTemplate);
        ArmorTemplate = X2ArmorTemplate(ItemTemplate);

        if (GremlinTemplate != none)
        {
            Index = default.GremlinTiers.Find('Tech', GremlinTemplate.WeaponTech);
            if (Index != INDEX_NONE)
            {
                return default.GremlinTiers[Index].Tier;
            }
        }
        else if (WeaponTemplate != none)
        {
            Index = default.WeaponTiers.Find('Tech', WeaponTemplate.WeaponTech);
            if (Index != INDEX_NONE)
            {
                return default.WeaponTiers[Index].Tier;
            }
        }
        else if (ArmorTemplate != none)
        {
            Index = default.ArmorTiers.Find('Tech', ArmorTemplate.ArmorTechCat);
            if (Index != INDEX_NONE)
            {
                return default.ArmorTiers[Index].Tier;
            }
        }
    }

    return -1;
}

static function bool AbilityTagExpandHandler_CH(string InString, out string OutString, Object ParseObj, Object StrategyParseOb, XComGameState GameState)
{
    switch (InString)
    {
        case "F_BoundWeaponName":
            OutString = GetBoundWeaponName(ParseObj, StrategyParseOb, GameState);
            return true;
        case "F_SelfCooldown":
            OutString = GetSelfCooldown(ParseObj, StrategyParseOb, GameState);
            return true;
        case "F_SelfCharges":
            OutString = GetSelfCharges(ParseObj, StrategyParseOb, GameState);
            return true;
        case "F_FreeAction":
            OutString = ColorText_Green(default.strFreeAction);
            return true;
        case "F_BleedingDamage":
            GetEffectDamageOnTickString(ParseObj, StrategyParseOb, GameState);
            return true;
        case "F_StationaryThreat_StartingValue":
        case "F_StationaryThreat_DamagePerTurn":
        case "F_StationaryThreat_MaxTurns":
        case "F_Maim_Duration":
        case "F_QuickPatch_ActivationsPerTurn":
        case "F_Preservation_DefenseBonus":
        case "F_Preservation_Duration":
        case "F_LickYourWounds_HealAmount":
        case "F_LickYourWounds_MaxHealAmount":
        case "F_Momentum_AimBonus":
        case "F_Momentum_CritBonus":
        case "F_ThousandsToGo_ActivationsPerTurn":
        case "F_Recharge_CooldownReduction":
        case "F_Recharge_ActivationsPerTurn":
        case "F_PierceTheVeil_Duration":
        case "F_TheBiggerTheyAre_AimBonus":
        case "F_TheBiggerTheyAre_CritBonus":
        case "F_CallForFire_Radius":
        case "F_LockNLoad_AmmoToReload":
        case "F_LockNLoad_ActivationsPerTurn":
        case "F_Imposition_AimPenalty":
        case "F_Imposition_Duration":
        case "F_Compensation_ActivationsPerTurn":
        case "F_FirstStrike_FlankingDamageBonus":
        case "F_FirstStrike_ConcealedDamageBonus":
        case "F_DisablingShot_StunDuration":
        case "F_Blend_Duration":
        case "F_Botnet_Duration":
        case "F_Botnet_HackPenalty":
        case "F_ReadyForAnything_ActivationsPerTurn":
        case "F_Resupply_AmmoToReload":
        case "F_AmmoConservation_Duration":
        case "F_AmmoConservation_MaxAmmoPerUse":
        case "F_Dedication_Duration":
        case "F_Dedication_MobilityBonus":
        case "F_Triage_Radius":
        case "F_Triage_HealAmount":
        case "F_FieldMedic_BonusChargesPerItem":
        case "F_Bloodlet_DamagePerTurn":
        case "F_BlindingFire_ToHitPenalty":
        case "F_BlindingFire_ConeWidth":
        case "F_BlindingFire_ConeLength":
        case "F_BlindingFire_AimPenalty":
        case "F_BlindingFire_Duration":
        case "F_CombatDrugs_AimBonus":
        case "F_CombatDrugs_CritBonus":
        case "F_SaltInTheWound_DamageBonus":
        case "F_Unload_MaxShots":
        case "F_Ambush_ConeEndDiameter":
        case "F_Ambush_ConeLength":
        case "F_Renewal_Radius":
        case "F_Renewal_HealAmount":
        case "F_Renewal_MaxHealAmount":
        case "F_OpenFire_AimBonus":
        case "F_OpenFire_CritBonus":
        case "F_Finesse_ActivationsPerTurn":
        case "F_ShoulderToLeanOn_AimBonus":
        case "F_ShoulderToLeanOn_ShieldAimBonus":
        case "F_BolsteredWall_DodgeBonus":
        case "F_Adrenaline_ActivationsPerMission":
        case "F_Adrenaline_ShieldAmount":
        case "F_WatchThemRun_ActivationsPerTurn":
        case "F_Rally_Radius":
        case "F_Rally_Duration":
        case "F_ShieldTrauma_StunDuration":
        case "F_Avenger_ActivationsPerTurn":
        case "F_FireFirst_ActivationsPerTurn":
        case "F_Flatline_DamageBonus":
        case "F_Flatline_Rupture":
        case "F_ColdBlooded_ActivationsPerTurn":
        case "F_Predator_AimBonus":
        case "F_Predator_CritBonus":
        case "F_Survivor_BonusBleedOutTurns":
        case "F_Survivor_WoundReduction":
        case "F_RegenerativeMist_HealAmount":
        case "F_RegenerativeMist_MaxHealAmount":
        case "F_Stiletto_PierceBonus":
        case "F_Indomitable_Duration":
        case "F_PerfectGuard_ArmorBonus":
        case "F_ShieldRegeneration_MaxShield":
        case "F_ShieldRegeneration_ShieldAmount":
        case "F_ShieldRegeneration_ActivationsPerMission":
        case "F_CalmMind_PsiBonus":
        case "F_CalmMind_WillBonus":
        case "F_PutEmDown_AimBonus":
        case "F_PutEmDown_CritBonus":
        case "F_WilltoSurvive_ArmorBonus":
        case "F_WilltoSurvive_DodgeBonus":
        case "F_WatchfulEye_ActivationsPerTurn":
        case "F_Safeguard_DefenseBonus":
        case "F_Safeguard_ShieldDefenseBonus":
        case "F_TradeFire_ActivationsPerUse":
        case "F_Rampart_Duration":
        case "F_Parry_DodgeBonus":
        case "F_MindBlast_StunDuration":
        case "F_KillEmAll_ConeEndDiameter":
            OutString = ColorText_Gold(`GetConfigInt(InString));
            return true;
        case "F_Bloodlet_ApplyChance":
        case "F_Unload_DamagePenalty":
        case "F_CoverArea_DamageReduction":
        case "F_ShieldTrauma_StunChance":
        case "F_Rampart_DamageReduction":
            OutString = ColorText_Gold(`GetConfigInt(InString) $ "%");
            return true;
        case "F_ChipAway_ShredBonuses":
        case "F_Havoc_Damage":
        case "F_Rally_ShieldAmount":
            OutString = GetTagValueFromItemTech(InString, ParseObj, StrategyParseOb, GameState);
            return true;
        case "F_Intimidate_ApplyChance":
            OutString = GetTagValueFromItemTech(InString, ParseObj, StrategyParseOb, GameState,,, "%");
            return true;
        case "F_Unload_ToHitMod":
            OutString = ColorText_Gold(Abs(`GetConfigInt(InString)));
            return true;
        case "F_ShoulderToLeanOn_Radius":
        case "F_CoverArea_Radius":
        case "F_Safeguard_Radius":
        case "F_Rampart_Radius":
        case "F_CoordinateFire_Radius":
            OutString = ColorText_Gold(TruncateFloat(`GetConfigFloat(InString), 1));
            return true;
        case "LikeLightning_AllowedAbilities":
            OutString = GetStringFromLocalizedList(default.LikeLightning_Abilities);
            return true;
        case "QuickPatch_AllowedAbilities":
            OutString = GetStringFromLocalizedList(default.QuickPatch_Abilities);
            return true;
        case "LickYourWounds_AllowedAbilities":
            OutString = GetStringFromLocalizedList(default.LickYourWounds_Abilities);
            return true;
    }

    return false;
}

static private function string TruncateFloat(float fValue, optional int Places = 2, optional bool bCanBeInteger = true)
{
    local string TempString;
    local string FloatString;
    local int i;
    local float TestFloat;
    local float TempFloat;

    TempFloat = fValue;
    
    for (i = 0; i < Places; i++)
    {
        TempFloat *= 10.0;
    }
    
    TempFloat = Round(TempFloat);
    for (i = 0; i < Places; i++)
    {
        TempFloat /= 10.0;
    }

    TempString = string(TempFloat);
    for (i = InStr(TempString, ".") + 1; i < Len(TempString) ; i++)
    {
        FloatString = Left(TempString, i);
        TestFloat = float(FloatString);
        if (TempFloat ~= TestFloat)
        {
            break;
        }
    }

    if (Right(FloatString, 1) == ".")
    {
        if (bCanBeInteger)
        {
            FloatString -= ".";
        }
        else
        {
            FloatString $= "0";
        }
    }

    return FloatString;
}

static private function string GetBoundWeaponName(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local X2AbilityTemplate     AbilityTemplate;
    local X2ItemTemplate        ItemTemplate;
    local XComGameState_Effect  EffectState;
    local XComGameState_Ability AbilityState;
    local XComGameState_Item    ItemState;

    AbilityTemplate = X2AbilityTemplate(ParseObj);
    if (StrategyParseObj != none && AbilityTemplate != none)
    {
        ItemTemplate = GetItemBoundToAbilityFromUnit(XComGameState_Unit(StrategyParseObj), AbilityTemplate.DataName, GameState);
    }
    else
    {
        EffectState = XComGameState_Effect(ParseObj);
        AbilityState = XComGameState_Ability(ParseObj);

        if (EffectState != none)
        {
            AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
        }

        if (AbilityState != none)
        {
            ItemState = AbilityState.GetSourceWeapon();

            if (ItemState != none)
                ItemTemplate = ItemState.GetMyTemplate();
        }
    }

    if (ItemTemplate != none)
    {
        return ItemTemplate.GetItemAbilityDescName();
    }
    
    return default.strDefaultWeapon;
}

static private function X2ItemTemplate GetItemBoundToAbilityFromUnit(XComGameState_Unit UnitState, name AbilityName, XComGameState GameState)
{
    local SCATProgression           Progression;
    local XComGameState_Item        ItemState;
    local EInventorySlot            Slot;

    if (UnitState == none)
        return none;

    Progression = UnitState.GetSCATProgressionForAbility(AbilityName);
    if (Progression.iRank == INDEX_NONE || Progression.iBranch == INDEX_NONE)
        return none;

    Slot = UnitState.AbilityTree[Progression.iRank].Abilities[Progression.iBranch].ApplyToWeaponSlot;
    if (Slot == eInvSlot_Unknown)
        return none;

    ItemState = UnitState.GetItemInSlot(Slot, GameState);
    if (ItemState != none)
    {
        return ItemState.GetMyTemplate();
    }

    return none;
}

static private function XComGameState_Unit GetSourceUnitFromParseObj(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local XComGameState_Effect      EffectState;
    local XComGameState_Ability     AbilityState;
    local XComGameState_Unit        SourceUnit;

    if (StrategyParseObj != none)
    {
        SourceUnit = XComGameState_Unit(StrategyParseObj);
    }
    else
    {
        EffectState = XComGameState_Effect(ParseObj);
        AbilityState = XComGameState_Ability(ParseObj);

        if (EffectState != none)
            AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));

        if (AbilityState != none)
            SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
    }
    return SourceUnit;
}

static private function X2ItemTemplate GetItemTemplateFromParseObj(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local XComGameState_Effect      EffectState;
    local XComGameState_Ability     AbilityState;
    local XComGameState_Item        ItemState;
    local X2ItemTemplate            ItemTemplate;

    if (StrategyParseObj != none)
    {
        ItemTemplate = GetItemBoundToAbilityFromUnit(XComGameState_Unit(StrategyParseObj), X2AbilityTemplate(ParseObj).DataName, GameState);
    }
    else
    {
        EffectState = XComGameState_Effect(ParseObj);
        AbilityState = XComGameState_Ability(ParseObj);

        if (EffectState != none)
            AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));

        if (AbilityState != none)
        {
            ItemState = AbilityState.GetSourceWeapon();

            if (ItemState != none)
                ItemTemplate = ItemState.GetMyTemplate();
        }
    }
    return ItemTemplate;
}

static private function X2AbilityTemplate GetAbilityTemplateFromParseObj(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local XComGameState_Effect      EffectState;
    local XComGameState_Ability     AbilityState;
    local X2AbilityTemplate         AbilityTemplate;

    if (StrategyParseObj != none)
    {
        AbilityTemplate = X2AbilityTemplate(ParseObj);
    }
    else
    {
        EffectState = XComGameState_Effect(ParseObj);
        AbilityState = XComGameState_Ability(ParseObj);

        if (EffectState != none)
            AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));

        if (AbilityState != none)
            AbilityTemplate = AbilityState.GetMyTemplate();
    }
    return AbilityTemplate;
}

static private function string GetSelfCooldown(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local X2AbilityTemplate AbilityTemplate;

    AbilityTemplate = GetAbilityTemplateFromParseObj(ParseObj, StrategyParseObj, GameState);

    if (AbilityTemplate != none)
    {
        if (AbilityTemplate.AbilityCooldown != none)
        {
            return ColorText_Gold(AbilityTemplate.AbilityCooldown.iNumTurns);
        }
        else
        {
            return ColorText_Gold("0");
        }
    }
    return ColorText_Grey("?");
}

static private function string GetSelfCharges(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local X2AbilityTemplate AbilityTemplate;

    AbilityTemplate = GetAbilityTemplateFromParseObj(ParseObj, StrategyParseObj, GameState);

    if (AbilityTemplate != none)
    {
        if (AbilityTemplate.AbilityCharges != none)
        {
            return ColorText_Gold(AbilityTemplate.AbilityCharges.InitialCharges);
        }
    }
    return ColorText_Grey("?");
}

static private function string GetEffectDamageOnTickString(Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
    local XComGameState_Effect          EffectState;
    local X2Effect_Persistent           PersistentEffect;
    local X2Effect                      ApplyOnTickEffect;
    local X2Effect_ApplyWeaponDamage    WeaponDamageEffect;
    local WeaponDamageValue             Damage;
    local int                           MinDamage, MaxDamage;
    local string                        OutString;

    EffectState = XComGameState_Effect(ParseObj);

    if (EffectState != none)
    {
        PersistentEffect = EffectState.GetX2Effect();
        if (PersistentEffect != none)
        {
            foreach PersistentEffect.ApplyOnTick(ApplyOnTickEffect)
            {
                WeaponDamageEffect = X2Effect_ApplyWeaponDamage(ApplyOnTickEffect);
                if (WeaponDamageEffect != none)
                {
                    Damage = WeaponDamageEffect.EffectDamageValue;
                    MinDamage = Damage.Damage - Damage.Spread + (Damage.PlusOne >= 100 ? 1 : 0);
                    MaxDamage = Damage.Damage + Damage.Spread + (Damage.PlusOne > 0 ? 1 : 0);
                    if (MinDamage == MaxDamage)
                    {
                        OutString = string(MaxDamage);
                    }
                    else
                    {
                        OutString = string(MinDamage) $ " - " $ string(MaxDamage);
                    }
                    return OutString;
                }
            }
        }
    }

    return "?";
}

static private function string GetTagValueFromItemTech(string Tag, Object ParseObj, Object StrategyParseObj, XComGameState GameState,
    optional EInventorySlot Slot = eInvSlot_Unknown, optional bool bSquash = true, optional string Suffix)
{
    local XComGameState_Unit    SourceUnit;
    local X2ItemTemplate        ItemTemplate;
    local bool                  bStrategy;
    local int                   i, Index;
    local array<int>            Array, NewArray;
    local string                OutString;
    local string                LeftString, MidString, RightString;

    bStrategy = StrategyParseObj != none;
    SourceUnit = GetSourceUnitFromParseObj(ParseObj, StrategyParseObj, GameState);

    if (Slot != eInvSlot_Unknown)
    {
        ItemTemplate = SourceUnit.GetItemInSlot(Slot).GetMyTemplate();
    }
    else
    {
        ItemTemplate = GetItemTemplateFromParseObj(ParseObj, StrategyParseObj, GameState);
    }

    Array = `GetConfigArrayInt(Tag);

    if (Array.Length == 0)
        return ColorText_Grey("?");

    Index = -1;
    if (ItemTemplate != none)
    {
        Index = GetItemTech(ItemTemplate);
        if (Index != -1)
            Index = Clamp(Index, 0, Array.Length - 1);
    }

    if (!bStrategy)
    {
        if (0 <= Index && Index < Array.Length)
        {
            OutString = ColorText_Gold(Array[Index] $ Suffix);
        }
    }
    else
    {
        if (bSquash)
        {
            for (i = 0; i < Array.Length; i++)
            {
                if (Index > i && Array[i] == Array[Index])
                {
                    Index = i;
                }
                if (NewArray.Length == 0 || NewArray[NewArray.Length - 1] != Array[i])
                {
                    NewArray.AddItem(Array[i]);
                }
            }
            Array = NewArray;
        }
        if (Index == -1)
        {
            for (i = 0; i < Array.Length; i++)
            {
                OutString $= Array[i] $ Suffix;
                if (i < Array.Length - 1)
                {
                    OutString = OutString $ " / ";
                }
            }
        }
        else
        {
            for (i = 0; i < Index; i++)
            {
                LeftString $= Array[i] $ Suffix;
                if (i < Array.Length - 1)
                {
                    LeftString = LeftString $ " / ";
                }
            }
            MidString = string(Array[Index]) $ Suffix;
            for (i = Index + 1; i < Array.Length; i++)
            {
                RightString $= " / " $ Array[i] $ Suffix;
            }

            if (LeftString != "")
                OutString $= ColorText_Grey(LeftString);
            OutString $= ColorText_Gold(MidString);
            if (RightString != "")
                OutString $= ColorText_Grey(RightString);
        }
    }
    
    if (OutString != "")
        return OutString;
    
    return ColorText_Grey("?");
}

static private function string GetStringFromLocalizedList(const array<string> LocalizedList)
{
    local string OutString;
    local int Index;
    
    for (Index = 0; Index < LocalizedList.Length; Index++)
    {
        OutString $= ColorText_LimeGreen(LocalizedList[Index]);
        if (Index != LocalizedList.Length - 1)
            OutString $= " - ";
    }
    return OutString;
}

static private function string ColorText_Gold(coerce string strInput, optional bool bOpen = false)
{
    // #ffd700
    return ColorText_Internal("#ffd700", strInput, bOpen);
}

static private function string ColorText_Green(coerce string strInput, optional bool bOpen = false)
{
    // #3cdc3c
    return ColorText_Internal("#3cdc3c", strInput, bOpen);
}

static private function string ColorText_LimeGreen(coerce string strInput, optional bool bOpen = false)
{
    // #0bff9b
    return ColorText_Internal("#0bff9b", strInput, bOpen);
}

static private function string ColorText_Grey(coerce string strInput, optional bool bOpen = false)
{
    // #909497
    return ColorText_Internal("#909497", strInput, bOpen);
}

static private function string ColorText_Internal(string strHexCode, coerce string strInput, optional bool bOpen = false)
{
    local string OutString;

    OutString = "<font color='" $ strHexCode $ "'>" $ strInput;
    if (!bOpen)
        OutString = OutString $ "</font>";

    return OutString;
}

static private function string ColorText_Close()
{
    return "</font>";
}