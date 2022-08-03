page 50103 "Auto"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Auto;
    CardPageId = "Auto Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Mark No."; Rec."Mark No.")
                {
                    ApplicationArea = All;
                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;

                }
                field("Creation date"; Rec."Creation date")
                {
                    ApplicationArea = All;
                }
                field("Insurance expiration date"; Rec."Insurance expiration date")
                {
                    ApplicationArea = All;
                }
                field("TE expiration date"; Rec."TE expiration date")
                {
                    ApplicationArea = All;
                }
                field("Location code"; Rec."Location code")
                {
                    ApplicationArea = All;
                }
                field("Rental service"; Rec."Rental service")
                {
                    ApplicationArea = All;
                }
                field("Rental price"; Rec."Rental price")
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
            action("Auto Reservation")
            {
                ApplicationArea = All;

                RunObject = page "Auto Reservation";
                RunPageLink = "Auto No." = field("No.");
            }
            action("Generate report")
            {
                ApplicationArea = All;
                RunObject = report "Auto Card Report";
            }
        }
    }
}