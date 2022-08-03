table 50112 "Finished Auto Rent Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Line No."; Code[20])
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Type"; Enum "Auto Rent Line Enum")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(12; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;


        }
        field(13; "Amount"; Integer)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(14; "Price"; Integer)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
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
}