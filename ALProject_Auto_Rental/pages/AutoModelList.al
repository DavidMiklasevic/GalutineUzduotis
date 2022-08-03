page 50102 "Auto Model list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Model";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Mark No."; Rec."Mark No.")
                {
                    ApplicationArea = All;

                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;

                }
                field("Model"; Rec.Model)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}