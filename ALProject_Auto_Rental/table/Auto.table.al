table 50103 "Auto"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(10; Name; Text[30])
        {
            Caption = 'Auto name';
            DataClassification = CustomerContent;

        }
        field(11; "Mark No."; Code[20])
        {
            Caption = 'Mark No.';
            DataClassification = CustomerContent;
            TableRelation = "Auto Mark";
        }
        field(12; "Model No."; Code[20])
        {
            Caption = 'Model No.';
            DataClassification = CustomerContent;
            TableRelation = "Auto Model";


        }
        field(13; "Creation date"; Date)
        {
            Caption = 'Creation date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
        field(14; "Insurance expiration date"; Date)
        {
            Caption = 'Insurance expiration date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
        field(15; "TE expiration date"; Date)
        {
            Caption = 'TE expiration date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
        field(16; "Location code"; Code[20])
        {
            Caption = 'Location code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(17; "Rental service"; Code[20])
        {
            Caption = 'Rental service';
            DataClassification = CustomerContent;
            TableRelation = Resource;
        }
        field(18; "Rental price"; Decimal)
        {
            Caption = 'Rental price';
            Editable = false;

            FieldClass = FlowField;
            CalcFormula = lookup(Resource."Unit Price" where("No." = field("Rental service")));
        }
        //Report fields
        field(19; "Total rent cost"; Integer)
        {
            Caption = 'Total Rent cost';
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
    local procedure CheckDates()
    var
        Error: Label 'Creation date must be earlier than Insurance expiration date and/or TE expiration date';
    begin
        if ("Insurance expiration date" = 0D) or ("TE expiration date" = 0D) then
            exit;
        if ("Insurance expiration date" < "Creation date") or ("TE expiration date" < "Creation date") then
            Error(Error,
            FieldCaption("Creation date"),
            FieldCaption("Insurance expiration date"),
            FieldCaption("TE expiration date"),
            "Creation date",
            "Insurance expiration date",
            "TE expiration date");

    end;

    local procedure ShowModels()
    var
        ModelTable: Record "Auto Model";
    begin
        ModelTable.SetRange(ModelTable."Mark No.", "Mark No.");
    end;

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get("No.");
            AutoSetup.TestField("Auto Nos");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Auto Nos", WorkDate(), true);
        end;
    end;


}