class X2Condition_AnimSet extends X2Condition config(GameData_SoldierSkills);

var array<string> ValidAnimSets;
var config array<string> SoldierAnimSets;

event name CallMeetsCondition(XComGameState_BaseObject kTarget)
{
    local XComContentManager    Content;
    local XComGameState_Unit    UnitState;
    local XComUnitPawn          Pawn;
    local AnimSet               AnimSet;
    local int                   i;

    UnitState = XComGameState_Unit(kTarget);

    if (UnitState != none)
    {
        Pawn = XGUnit(UnitState.GetVisualizer()).GetPawn();
        if (Pawn != none)
        {
            Content = `CONTENT;
            for (i = 0; i < ValidAnimSets.Length; i++)
            {
                AnimSet = AnimSet(Content.RequestGameArchetype(ValidAnimSets[i]));
                if (AnimSet != none)
                {
                    if (Pawn.Mesh.AnimSets.Find(AnimSet) != INDEX_NONE)
                    {
                        return 'AA_Success';
                    }
                }
            }
            return 'AA_UnitIsWrongType';
        }
    }
    else return 'AA_NotAUnit';
}

static function X2Condition_AnimSet SoldierAnimSetCondition()
{
    local X2Condition_AnimSet Condition;

    Condition = new class'X2Condition_AnimSet';
    Condition.ValidAnimSets = default.SoldierAnimSets;

    return Condition;
}