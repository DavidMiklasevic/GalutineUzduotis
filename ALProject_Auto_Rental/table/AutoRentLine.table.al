table 50109 "Auto Rent Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;

        }
        field(2; "Line No."; Code[20])
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(10; "Type"; Enum "Auto Rent Line Enum")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;

        }
        field(11; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation =
            if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;
            trigger OnValidate()
            begin
                GetLineInfo();
            end;
        }
        field(12; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation =
            if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;

        }
        field(13; "Amount"; Integer)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CountTotalCost();
            end;
        }
        field(14; "Price"; Integer)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
            TableRelation =
            if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;
            Editable = false;
        }
        field(15; "Total cost"; Integer)
        {
            Caption = 'Total cost';
            DataClassification = CustomerContent;
            Editable = false;

        }




    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }


    var
        myInt: Integer;


    local procedure GetLineInfo()
    var
        ItemTable: Record Item;
        ResourceTable: Record Resource;
    begin
        if (Type = Type::Item) then begin
            ItemTable.Get("No.");
            Description := ItemTable.Description;
            Price := ItemTable."Unit Price";
        end
        else
            if (Type = Type::Resource) then begin
                ResourceTable.Get("No.");
                Description := ResourceTable.Name;
                Price := ResourceTable."Unit Price";
            end;
    end;

    local procedure CountTotalCost()
    begin
        "Total cost" := Price * Amount;
    end;

    trigger OnDelete()
    var
        AutoRentHeader: Record "Auto Rent Header";
        ErrorMessage: Label 'Can not delete this line';
    begin
        AutoRentHeader.Get("Document No.");
        if ("Line No." = AutoRentHeader."Auto No.") then Error(ErrorMessage);
    end;


}