table 50107 "Auto Rent Header"
{
    Caption = 'Auto Rent Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Editable = false;
        }
        field(10; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                CountDebt();
                CheckBlocked();
            end;
        }
        field(11; "Drivers license"; Media)
        {
            Caption = 'Drivers license';
            DataClassification = CustomerContent;
        }
        field(12; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;

        }
        field(13; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
            DataClassification = CustomerContent;
            TableRelation = Auto;
            trigger OnValidate()
            begin
                SetAutoRentLine();
            end;
        }
        field(14; "Reservation Date From"; Date)
        {
            Caption = 'Reservation Date From';
            DataClassification = CustomerContent;

        }
        field(15; "Reservation Date To"; Date)
        {
            Caption = 'Reservation Date To';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckReservationMatch();
                ModifyAutoRent();
            end;
        }
        field(16; "Total"; Integer)
        {
            Caption = 'Total';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Auto Rent Line"."Total cost" where("Document No." = field("No.")));
        }
        field(17; "Rent Status"; Enum "Auto Rent Header Enum")
        {
            Caption = ' Rent Status';
            DataClassification = CustomerContent;
            Editable = false;

        }
        //Fields for report
        field(18; "Auto Rent Cost"; Integer)
        {
            Caption = 'Auto Rent Cost';
            DataClassification = CustomerContent;


        }
        field(19; "Other Rent Cost"; Integer)
        {
            Caption = 'Other Rent Cost';
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        TestField("Rent Status", "Rent Status"::Open);

    end;

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get("No.");
            AutoSetup.TestField("Auto Rental Nos");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Auto Rental Nos", WorkDate(), true);
        end;
    end;

    local procedure CountDebt()
    var
        CustLedger: Record "Cust. Ledger Entry";
        TotalAmount: Decimal;
        ErrorMessage: Label 'Customer has debt';
    begin
        CustLedger.SetRange("Customer No.", "Client No.");
        if CustLedger.FindFirst() then
            repeat
                TotalAmount += CustLedger.Amount;
            until CustLedger.Next() = 0;

        if (TotalAmount < 1) then
            exit
        else
            Error(ErrorMessage,
            "Client No.");
    end;

    local procedure CheckBlocked()
    var
        CustomerTable: Record Customer;
        ErrorMessage: Label 'Customer is blocked';
    begin
        CustomerTable.Get("Client No.");
        if (CustomerTable.Blocked <> CustomerTable.Blocked::" ") then
            Error(ErrorMessage,
            "Client No.");
    end;

    local procedure CheckReservationMatch()
    var
        AutoReservation: Record "Auto Reservation";
        ErrorMessage: Label 'Auto reservation date does not match';
    begin
        if (AutoReservation.FindFirst()) then
            repeat
                if ((AutoReservation."Auto No." = "Auto No.") and (AutoReservation."Client No." = "Client No.")
                and (AutoReservation."Reservation Date From" = "Reservation Date From") and (AutoReservation."Reservation Date To" = "Reservation Date To"))
                then
                    exit
            Until AutoReservation.Next() = 0;
        Error(ErrorMessage, "Reservation Date From", "Reservation Date To");

    end;

    procedure SetAutoRentLine()
    var
        AutoRentLine: Record "Auto Rent Line";
        AutoTable: Record Auto;
        ResourceTable: Record Resource;

    begin
        AutoRentLine."Document No." := "No.";
        AutoRentLine."Line No." := "Auto No.";
        AutoTable.Get("Auto No.");
        AutoRentLine."No." := AutoTable."Rental service";
        ResourceTable.Get(AutoTable."Rental service");
        AutoRentLine.Description := ResourceTable.Name;

        AutoRentLine.Price := ResourceTable."Unit Price";

        AutoRentLine.Insert();
    end;

    procedure ModifyAutoRent()
    var
        AutoRentLine: Record "Auto Rent Line";
    begin
        AutoRentLine.Get("No.", "Auto No.");
        AutoRentLine.Amount := "Reservation Date To" - "Reservation Date From";
        AutoRentLine."Total cost" := AutoRentLine.Amount * AutoRentLine.Price;
        AutoRentLine.Modify();
    end;
}


