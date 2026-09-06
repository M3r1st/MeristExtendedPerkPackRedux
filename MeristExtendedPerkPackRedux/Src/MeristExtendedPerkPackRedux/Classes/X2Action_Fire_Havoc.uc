class X2Action_Fire_Havoc extends X2Action_Fire;

var protected bool bReceivedActivationMessage;

function Init()
{
    super.Init();

    bReceivedActivationMessage = false;
}

function NotifyTargetsAbilityApplied()
{
    if (!bReceivedActivationMessage)
    {
        DoNotifyTargetsAbilityAppliedWithMultipleHitLocations(VisualizeGameState, AbilityContext, StateChangeContext.AssociatedState.HistoryIndex, ProjectileHitLocation, 
                                                            allHitLocations, PrimaryTargetID, bNotifyMultiTargetsAtOnce);
        bReceivedActivationMessage = true;
    }
}

simulated state Executing
{
    simulated function BeginState(name PrevStateName)
    {
        super.BeginState(PrevStateName);
    }

    simulated event Tick(float fDeltaT)
    {
        //  nothing
    }

Begin:
    while (!bReceivedActivationMessage && !IsTimedOut())
        Sleep(0.0f);

    SetTargetUnitDiscState();
    CompleteAction();
}