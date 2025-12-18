class X2Effect_RefundAmmoCost extends X2Effect_Persistent;

var array<name> ExcludeAbilities;
var array<EInventorySlot> ApplyToSlots;

var int MaxAmmoPerUse;
var name CountValueName;

var bool bShowFlyover;
var name FlyoverEventName;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager EventMgr;
    local XComGameState_Unit UnitState;
    local Object EffectObj;

    EventMgr = `XEVENTMGR;

    EffectObj = EffectGameState;
    UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (bShowFlyover && FlyoverEventName != '')
    {
        EventMgr.RegisterForEvent(EffectObj, FlyoverEventName, EffectGameState.TriggerAbilityFlyover, ELD_OnStateSubmitted,, UnitState);
    }
}

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit TargetUnitState;
    
    TargetUnitState = XComGameState_Unit(kNewTargetState);

    if (TargetUnitState != none)
    {
        TargetUnitState.SetUnitFloatValue(CountValueName, 0, eCleanup_BeginTactical);
    }
}

function bool PostAbilityCostPaid(
    XComGameState_Effect EffectState,
    XComGameStateContext_Ability AbilityContext,
    XComGameState_Ability kAbility,
    XComGameState_Unit SourceUnit,
    XComGameState_Item AffectWeapon,
    XComGameState NewGameState,
    const array<name> PreCostActionPoints,
    const array<name> PreCostReservePoints)
{
    local XComGameState_Ability EffectAbilityState;
    local UnitValue CountUnitValue;
    local int AmmoToReload;

    if (!IsEffectCurrentlyRelevant(EffectState, SourceUnit))
    {
        return false;
    }

    if (ExcludeAbilities.Find(kAbility.GetMyTemplateName()) == INDEX_NONE)
    {
        if (kAbility.iAmmoConsumed > 0 && ApplyToSlots.Find(AffectWeapon.InventorySlot) != INDEX_NONE)
        {
            AmmoToReload = kAbility.iAmmoConsumed;
            // if MaxAmmoPerUse is defined, see how much is left
            if (CountValueName != '' && MaxAmmoPerUse > 0)
            {
                AmmoToReload = Min(AmmoToReload, MaxAmmoPerUse - CountUnitValue.fValue);
            }
            if (AffectWeapon.InventorySlot == eInvSlot_PrimaryWeapon && AffectWeapon.Ammo <= AffectWeapon.GetClipSize())
            {
                AmmoToReload = Min(AffectWeapon.GetClipSize() -  AffectWeapon.Ammo, AmmoToReload);
            }
            
            if (AmmoToReload > 0)
            {
                if (CountValueName != '')
                {
                    SourceUnit.SetUnitFloatValue(CountValueName, CountUnitValue.fValue + AmmoToReload, eCleanup_BeginTactical);
                }

                if (bShowFlyover && FlyoverEventName != '')
                {
                    EffectAbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
                    `XEVENTMGR.TriggerEvent(FlyoverEventName, EffectAbilityState, SourceUnit, NewGameState);
                }

                AffectWeapon.Ammo += AmmoToReload;
            }
        }
    }

    return false;
}

function bool IsThisEffectBetterThanExistingEffect(const out XComGameState_Effect ExistingEffect)
{
    return true;
}

function bool IsEffectCurrentlyRelevant(XComGameState_Effect EffectGameState, XComGameState_Unit TargetUnit)
{
    local UnitValue CountUnitValue;

    if (CountValueName != '')
    {
        TargetUnit.GetUnitValue(CountValueName, CountUnitValue);
        if (MaxAmmoPerUse > 0 && CountUnitValue.fValue >= MaxAmmoPerUse)
            return false;
    }

    return true;
}

defaultproperties
{
    DuplicateResponse = eDupe_Refresh

    ApplyToSlots[0] = eInvSlot_PrimaryWeapon;
}