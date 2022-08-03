table 50106 "Auto Damage"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
            DataClassification = CustomerContent;
            TableRelation = Auto;

        }
        field(10; "Line No."; Code[20])
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(11; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(12; "Damage report"; Text[30])
        {
            Caption = 'Damage report';
            DataClassification = CustomerContent;
        }
        field(13; "Status"; Enum "Auto Damage Status enum")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }

}