page 50100 "Auto Setup"
{
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Auto Setup";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Auto Nos"; Rec."Auto Nos")
                {

                    ApplicationArea = All;

                }
                field("Auto Rental Nos"; Rec."Auto Rental Nos")
                {
                    ApplicationArea = All;

                }
                field("Extras Location"; Rec."Extras location")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}