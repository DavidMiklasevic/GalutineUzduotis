page 50104 "Auto Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = Auto;

    layout
    {
        area(Content)
        {
            group(General)
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
        }
    }

    var
        myInt: Integer;
}