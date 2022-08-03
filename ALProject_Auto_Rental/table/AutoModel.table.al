table 50102 "Auto Model"
{
    DataClassification = CustomerContent;

    fields
    {


        field(1; "Mark No."; Code[20])
        {
            Caption = 'Mark No.';
            DataClassification = CustomerContent;
            TableRelation = "Auto Mark";


        }
        field(10; "Model No."; Code[20])
        {
            Caption = 'Model No.';
            DataClassification = CustomerContent;

        }
        field(11; "Model"; Text[20])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
        }
    }
    keys
    {

        key(Key1; "Mark No.", "Model No.")
        {
            Clustered = true;

        }


    }
    fieldgroups
    {
        fieldgroup(DropDown; "Model No.", "Mark No.", Model)
        {
        }
        fieldgroup(Brick; "Model No.")
        {

        }
    }

}