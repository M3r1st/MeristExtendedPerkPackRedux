class XMBEffect_AddGrenade extends XMBEffect_AddUtilityItem config(GameData_SoldierSkills);

struct UpgradeInfo
{
    var name ResearchName;
    var name BaseItemName;
    var name ItemName;
};

var config array<UpgradeInfo> Upgrades;

var bool bAllowUpgrades;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_HeadquartersXCom XComHQ;
    local X2ItemTemplateManager     ItemTemplateMgr;
    local X2ItemTemplate            ItemTemplate;
    local XComGameState_Unit        NewUnit;
    local UpgradeInfo               Upgrade;
    local name                      TemplateName;

    XComHQ = `XCOMHQ;

    NewUnit = XComGameState_Unit(kNewTargetState);
    if (NewUnit == none)
        return;

    if (class'X2AbilityHelpers'.static.SkipForDirectMissionTransfer(ApplyEffectParameters))
        return;

    ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    TemplateName = DataName;
    if (bAllowUpgrades)
    {
        foreach Upgrades(Upgrade)
        {
            if (Upgrade.BaseItemName == TemplateName
                && XComHQ.IsTechResearched(Upgrade.ResearchName))
            {
                TemplateName = Upgrade.ItemName;
            }
        }
    }

    ItemTemplate = ItemTemplateMgr.FindItemTemplate(TemplateName);

    // Use the highest upgraded available version of the item
    if (bUseHighestAvailableUpgrade)
        XComHQ.UpdateItemTemplateToHighestAvailableUpgrade(ItemTemplate);

    AddUtilityItem(NewUnit, ItemTemplate, NewGameState, NewEffectState);
}

static function XMBEffect_AddGrenade AddGrenadeEffect(name ItemName, optional bool bCanUpgrade = true, optional bool bSkipWeight = true)
{
    local XMBEffect_AddGrenade Effect;

    Effect = new class'XMBEffect_AddGrenade';
    Effect.DataName = ItemName;
    Effect.bAllowUpgrades = bCanUpgrade;
    if (bSkipWeight)
        Effect.SkipAbilities.AddItem('SmallItemWeight');
    Effect.BuildPersistentEffect(1, true, false);
    
    return Effect;
}

defaultproperties
{
    EffectName = M31_AddGrenade
    bAllowUpgrades = true;
}