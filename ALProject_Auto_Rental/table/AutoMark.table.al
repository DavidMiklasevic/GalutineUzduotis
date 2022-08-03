table 50101 "Auto Mark"
{
    Caption = 'Auto Mark';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;


        }
        field(10; "Mark"; Text[20])
        {
            Caption = 'Mark';
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
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Mark)
        {
        }
    }

}