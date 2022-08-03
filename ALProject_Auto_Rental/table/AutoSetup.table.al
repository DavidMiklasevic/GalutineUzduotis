table 50100 "Auto Setup"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = CustomerContent;

        }
        field(10; "Auto Nos"; Code[20])
        {
            Caption = 'Auto Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(11; "Auto Rental Nos"; Code[20])
        {
            Caption = 'Auto Rental Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(12; "Extras location"; Code[20])
        {
            Caption = 'Extras location';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }


}