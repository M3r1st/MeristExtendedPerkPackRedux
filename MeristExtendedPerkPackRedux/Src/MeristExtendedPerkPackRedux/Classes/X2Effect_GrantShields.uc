class X2Effect_GrantShields extends X2Effect_ModifyStats;

var array<int> ShieldAmount;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Item SourceItem;
    local StatChange Change;
    local int Tech;

    Change.StatType = eStat_ShieldHP;

    SourceItem = XComGameState_Item(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.ItemStateObjectRef.ObjectID));
    if (SourceItem == none)
    {
        SourceItem = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.ItemStateObjectRef.ObjectID));
    }

    if (SourceItem != none)
    {
        Tech = `GetItemTech(SourceItem.GetMyTemplate()); 
        Tech = Clamp(Tech, 0, ShieldAmount.Length - 1);
        Change.StatAmount = ShieldAmount[Tech];
    }

    NewEffectState.StatChanges.AddItem(Change);
    super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

defaultproperties
{
    EffectName = F_GrantShields
    DuplicateResponse = eDupe_Allow
}