page 50108 "Auto Rent Header"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Header";
    CardPageId = "Auto Rent Header Card";
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
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    Release: Codeunit "Auto Rent Header codeunit";
                begin
                    Release.Release(Rec);
                end;
            }
            action("Return car")
            {
                ApplicationArea = All;
                RunObject = page "Auto Rent Damage";
                RunPageLink = "Document No." = field("No."), "Line No." = field("Auto No.");
                trigger OnAction()
                var
                    FinishedAutoRentHeader: Record "Finished Auto Rent Header";
                    FinishedAutorentLine: Record "Finished Auto Rent Line";
                    AutoRentLine: Record "Auto Rent Line";
                    AutoRentHeader: Record "Auto Rent Header";
                begin
                    FinishedAutoRentHeader."No." := "No.";
                    FinishedAutoRentHeader."Client No." := "Client No.";
                    FinishedAutoRentHeader."Drivers license" := "Drivers license";
                    FinishedAutoRentHeader."Date" := "Date";
                    FinishedAutoRentHeader."Auto No." := "Auto No.";
                    FinishedAutoRentHeader."Reservation Date From" := "Reservation Date From";
                    FinishedAutoRentHeader."Reservation Date To" := "Reservation Date To";
                    FinishedAutoRentHeader.Total := Total;
                    FinishedAutoRentHeader.Insert();
                    if (AutoRentLine.FindFirst()) then
                        repeat
                            if (AutoRentLine."Document No." = "No.") then begin
                                FinishedAutorentLine.TransferFields(AutoRentLine);
                                FinishedAutorentLine.Insert();
                                AutoRentLine.Delete();
                            end
                        until AutoRentLine.Next() = 0;
                    AutoRentHeader.Get("No.");
                    AutoRentHeader.Delete();
                end;
            }
        }
    }
}