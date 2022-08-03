page 50109 "Auto Rent Header Card"
{
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Rent Header";


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
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field("Drivers license"; Rec."Drivers license")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }
                field("Reservation Date From"; Rec."Reservation Date From")
                {
                    ApplicationArea = All;
                }
                field("Reservation Date To"; Rec."Reservation Date To")
                {
                    ApplicationArea = All;
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                }
                field("Rent Status"; Rec."Rent Status")
                {
                    ApplicationArea = All;
                }
            }
            part(AutoRentLine; "Auto Rent Line")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
        }
        area(FactBoxes)
        {
            part("Picture"; DriversLicensePicture)
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
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