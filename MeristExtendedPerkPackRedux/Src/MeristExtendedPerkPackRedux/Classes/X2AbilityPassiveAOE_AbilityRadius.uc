class X2AbilityPassiveAOE_AbilityRadius extends X2AbilityPassiveAOE_WeaponRadius;

function DrawAOETiles(const XComGameState_Ability Ability, const vector Location)
{
    local XComGameState_Unit    AbilityOwner;
    local XGUnit                Unit;
    local vector                NewLocation;

    AbilityOwner = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(Ability.OwnerStateObject.ObjectID));
    Unit = XGUnit(AbilityOwner.GetVisualizer());
    NewLocation = Unit.GetFootLocation();

    super.DrawAOETiles(Ability, NewLocation);
}

// function float GetTargetRadius(const XComGameState_Ability Ability)
// {
//     local X2AbilityTemplate             AbilityTemplate;
//     local X2AbilityMultiTarget_Radius   RadiusMultiTarget;

//     AbilityTemplate = Ability.GetMyTemplate();
//     RadiusMultiTarget = X2AbilityMultiTarget_Radius(AbilityTemplate.AbilityMultiTargetStyle);
//     if (RadiusMultiTarget != none)
//     {
//         return `METERSTOUNITS(RadiusMultiTarget.GetTargetRadius(Ability));
//     }

//     return super.GetTargetRadius(Ability);
// }