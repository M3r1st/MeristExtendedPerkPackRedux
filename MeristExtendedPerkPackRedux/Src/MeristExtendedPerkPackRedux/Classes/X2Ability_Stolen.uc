class X2Ability_Stolen extends X2AbilityHelpers config(GameData_SoldierSkills);

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;

    Templates.AddItem(KillEmAll());
    Templates.AddItem(SurgicalPrecision());
    Templates.AddItem(SniperElite());

    return Templates;
}

// Kill 'Em All
// (AbilityName="F_KillEmAll", ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Take a shot at every enemy in a cone area.
// Original Creator: Musashi
static function X2AbilityTemplate KillEmAll()
{
    local X2AbilityTemplate             Template;
    local X2AbilityTarget_Cursor        CursorTarget;
    local X2AbilityMultiTarget_Cone     ConeMultiTarget;
    local X2Condition_Visibility        VisibilityCondition;
    local X2AbilityToHitCalc_StandardAim ToHitCalc;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'F_KillEmAll');

    Template.IconImage = "img:///UILibrary_XPerkIconPack.UIPerk_rifle_circle";
    Template.AbilitySourceName = 'eAbilitySource_Perk'; 
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
    Template.Hostility = eHostility_Offensive;

    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

    Template.bCrossClassEligible = `GetConfigBool("F_KillEmAll_bAWC");

    ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
    ToHitCalc.bOnlyMultiHitWithSuccess = false;
    ToHitCalc.bMultiTargetOnly = true;
    Template.AbilityToHitCalc = ToHitCalc;
    Template.bOverrideAim = true;
    Template.bCheckCollision = true;

    CursorTarget = new class'X2AbilityTarget_Cursor';
    Template.AbilityTargetStyle = CursorTarget;
    Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

    VisibilityCondition = new class'X2Condition_Visibility';
    VisibilityCondition.bRequireGameplayVisible = true;
    VisibilityCondition.bAllowSquadsight = `GetConfigBool("F_KillEmAll_bAllowSquadsight");

    Template.AbilityTargetConditions.AddItem(VisibilityCondition);
    Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
    Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
    Template.AddShooterEffectExclusions();

    ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
    ConeMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
    ConeMultiTarget.ConeEndDiameter = `TILESTOUNITS(`GetConfigInt("F_KillEmAll_ConeEndDiameter"));
    ConeMultiTarget.bUseWeaponRangeForLength = true;
    ConeMultiTarget.fTargetRadius = 99;
    ConeMultiTarget.bIgnoreBlockingCover = false;
    Template.AbilityMultiTargetStyle = ConeMultiTarget;
    Template.TargetingMethod = class'X2TargetingMethod_Cone';

    AddCooldown(Template, `GetConfigInt("F_KillEmAll_Cooldown"));
    AddActionPointCost(Template, eCost_WeaponConsumeAll);
    AddAmmoCost(Template, `GetConfigInt("F_KillEmAll_AmmoCost"));

    Template.bAllowAmmoEffects = true;
    Template.bAllowBonusWeaponEffects = true;

    Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
    Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
    Template.AddMultiTargetEffect(default.WeaponUpgradeMissDamage);

    Template.AssociatedPassives.AddItem('HoloTargeting');

    Template.bDisplayInUITooltip = true;
    Template.bDisplayInUITacticalText = true;

    Template.bShowActivation = true;

    Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
    Template.ActivationSpeech = 'Faceoff';

    Template.bUsesFiringCamera = true;
    Template.CinescriptCameraType = "StandardGunFiring";
    Template.bFrameEvenWhenUnitIsHidden = true;

    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = KillEmAll_BuildVisualization;
    Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

    Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
    Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
    Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

    Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

    return Template;
}

function KillEmAll_BuildVisualization(XComGameState VisualizeGameState)
{
    local XComGameStateHistory              History;
    local XComGameStateVisualizationMgr     VisualizationMgr;

    local X2AbilityTemplate                 AbilityTemplate;
    local XComGameStateContext_Ability      Context;
    local AbilityInputContext               AbilityContext;
    local StateObjectReference              ShootingUnitRef;
    // local X2Action_Fire                     FireAction;
    local X2Action_Fire_Faceoff             FireFaceoffAction;
    local XComGameState_BaseObject          TargetStateObject; // Container for state objects within VisualizeGameState

    local Actor                         TargetVisualizer, ShooterVisualizer;
    local X2VisualizerInterface         TargetVisualizerInterface;
    local int                           EffectIndex, TargetIndex;

    local VisualizationActionMetadata       EmptyTrack;
    local VisualizationActionMetadata       ActionMetadata;
    local VisualizationActionMetadata       SourceTrack;

    local X2Action_PlaySoundAndFlyOver      SoundAndFlyover;
    local name                              ApplyResult;

    local X2Action_StartCinescriptCamera    CinescriptStartAction;
    local X2Action_EndCinescriptCamera      CinescriptEndAction;
    local X2Camera_Cinescript               CinescriptCamera;
    local string                            PreviousCinescriptCameraType;
    local X2Effect                          TargetEffect;

    local X2Action_MarkerNamed              JoinActions;
    local array<X2Action>                   LeafNodes;
    local X2Action_ApplyWeaponDamageToUnit  ApplyWeaponDamageAction;

    History = `XCOMHISTORY;
    VisualizationMgr = `XCOMVISUALIZATIONMGR;

    Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
    AbilityContext = Context.InputContext;
    AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.AbilityTemplateName);
    ShootingUnitRef = Context.InputContext.SourceObject;

    ShooterVisualizer = History.GetVisualizer(ShootingUnitRef.ObjectID);

    SourceTrack = EmptyTrack;
    SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(ShootingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShootingUnitRef.ObjectID);
    if (SourceTrack.StateObject_NewState == none)
        SourceTrack.StateObject_NewState = SourceTrack.StateObject_OldState;
    SourceTrack.VisualizeActor = ShooterVisualizer;

    if (AbilityTemplate.ActivationSpeech != '') // allows us to change the template without modifying this function later
    {
        SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(SourceTrack, Context));
        SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", AbilityTemplate.ActivationSpeech, eColor_Good);
    }

    // Add a Camera Action to the Shooter's Metadata.  Minor hack: To create a CinescriptCamera the AbilityTemplate 
    // must have a camera type. So manually set one here, use it, then restore.
    PreviousCinescriptCameraType = AbilityTemplate.CinescriptCameraType;
    AbilityTemplate.CinescriptCameraType = "StandardGunFiring";
    CinescriptCamera = class'X2Camera_Cinescript'.static.CreateCinescriptCameraForAbility(Context);
    CinescriptStartAction = X2Action_StartCinescriptCamera(class'X2Action_StartCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
    CinescriptStartAction.CinescriptCamera = CinescriptCamera;
    AbilityTemplate.CinescriptCameraType = PreviousCinescriptCameraType;

    class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded);

    //  Now configure a fire action for each multi target
    for (TargetIndex = 0; TargetIndex < AbilityContext.MultiTargets.Length; ++TargetIndex)
    {
        // Add an action to pop the previous CinescriptCamera off the camera stack.
        CinescriptEndAction = X2Action_EndCinescriptCamera(class'X2Action_EndCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
        CinescriptEndAction.CinescriptCamera = CinescriptCamera;
        CinescriptEndAction.bForceEndImmediately = true;

        // Add an action to push a new CinescriptCamera onto the camera stack.
        AbilityTemplate.CinescriptCameraType = "StandardGunFiring";
        CinescriptCamera = class'X2Camera_Cinescript'.static.CreateCinescriptCameraForAbility(Context);
        CinescriptCamera.TargetObjectIdOverride = AbilityContext.MultiTargets[TargetIndex].ObjectID;
        CinescriptStartAction = X2Action_StartCinescriptCamera(class'X2Action_StartCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
        CinescriptStartAction.CinescriptCamera = CinescriptCamera;
        AbilityTemplate.CinescriptCameraType = PreviousCinescriptCameraType;

        // Add a custom Fire action to the shooter Metadata.
        TargetVisualizer = History.GetVisualizer(AbilityContext.MultiTargets[TargetIndex].ObjectID);
        FireFaceoffAction = X2Action_Fire_Faceoff(class'X2Action_Fire_Faceoff'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
        FireFaceoffAction.SetFireParameters(Context.IsResultContextMultiHit(TargetIndex), AbilityContext.MultiTargets[TargetIndex].ObjectID, false);
        FireFaceoffAction.vTargetLocation = TargetVisualizer.Location;

        // Setup target response
        TargetVisualizerInterface = X2VisualizerInterface(TargetVisualizer);
        ActionMetadata = EmptyTrack;
        ActionMetadata.VisualizeActor = TargetVisualizer;
        TargetStateObject = VisualizeGameState.GetGameStateForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID);
        if (TargetStateObject != none)
        {
            History.GetCurrentAndPreviousGameStatesForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID,
                                                            ActionMetadata.StateObject_OldState, ActionMetadata.StateObject_NewState,
                                                            eReturnType_Reference,
                                                            VisualizeGameState.HistoryIndex);
            `assert(ActionMetadata.StateObject_NewState == TargetStateObject);
        }
        else
        {
            //If TargetStateObject is none, it means that the visualize game state does not contain an entry for the primary target. Use the history version
            //and show no change.
            ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(AbilityContext.MultiTargets[TargetIndex].ObjectID);
            ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
        }

        for (EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityMultiTargetEffects.Length; ++EffectIndex)
        {
            TargetEffect = AbilityTemplate.AbilityMultiTargetEffects[EffectIndex];
            ApplyResult = Context.FindMultiTargetEffectApplyResult(TargetEffect, TargetIndex);

            // Target effect visualization
            AbilityTemplate.AbilityMultiTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, ApplyResult);

            // Source effect visualization
            AbilityTemplate.AbilityMultiTargetEffects[EffectIndex].AddX2ActionsForVisualizationSource(VisualizeGameState, SourceTrack, ApplyResult);
        }
        if (TargetVisualizerInterface != none)
        {
            //Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
            TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
        }

        ApplyWeaponDamageAction = X2Action_ApplyWeaponDamageToUnit(VisualizationMgr.GetNodeOfType(VisualizationMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToUnit', TargetVisualizer));
        if (ApplyWeaponDamageAction != none)
        {
            VisualizationMgr.DisconnectAction(ApplyWeaponDamageAction);
            VisualizationMgr.ConnectAction(ApplyWeaponDamageAction, VisualizationMgr.BuildVisTree, false, FireFaceoffAction);
        }
    }
    class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded);

    // Add an action to pop the last CinescriptCamera off the camera stack.
    CinescriptEndAction = X2Action_EndCinescriptCamera(class'X2Action_EndCinescriptCamera'.static.AddToVisualizationTree(SourceTrack, Context, false, SourceTrack.LastActionAdded));
    CinescriptEndAction.CinescriptCamera = CinescriptCamera;

    //Add a join so that all hit reactions and other actions will complete before the visualization sequence moves on. In the case
    // of fire but no enter cover then we need to make sure to wait for the fire since it isn't a leaf node
    VisualizationMgr.GetAllLeafNodes(VisualizationMgr.BuildVisTree, LeafNodes);

    if (VisualizationMgr.BuildVisTree.ChildActions.Length > 0)
    {
        JoinActions = X2Action_MarkerNamed(class'X2Action_MarkerNamed'.static.AddToVisualizationTree(SourceTrack, Context, false, none, LeafNodes));
        JoinActions.SetName("Join");
    }
}

// Surgical Precision
// (AbilityName="F_SurgicalPrecision")
// Reduces aim penalties from cover by half.
// Original Creator: Musashi
static function X2AbilityTemplate SurgicalPrecision()
{
    local X2AbilityTemplate             Template;
    local X2Effect_SurgicalPrecision    Effect;

    Template = Passive('F_SurgicalPrecision', "img:///UILibrary_FavidsPerkPack.UIPerk_SnipersEye", `GetConfigBool("F_SurgicalPrecision_bAWC"), true, false);

    Effect = new class'X2Effect_SurgicalPrecision';
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}

// Sniper Elite
// (AbilityName="F_SniperElite")
// Removes squadsight penalties. Passive.
// Original Creator: Musashi
static function X2AbilityTemplate SniperElite()
{
    local X2AbilityTemplate                 Template;
    local X2Effect_NoSquadsightPenalties    Effect;

    Template = Passive('F_SniperElite', "img:///UILibrary_XPerkIconPack.UIPerk_sniper_blaze", `GetConfigBool("F_SniperElite_bAWC"), true, false);

    Effect = new class'X2Effect_NoSquadsightPenalties';
    Effect.BuildPersistentEffect(1, true, false);
    Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
    Template.AddTargetEffect(Effect);

    return Template;
}
