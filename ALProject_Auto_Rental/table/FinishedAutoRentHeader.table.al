table 50111 "Finished Auto Rent Header"
{
    Caption = 'Finished Auto Rent Header';
    DataClassification = CustomerContent;


    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(11; "Drivers license"; Media)
        {
            Caption = 'Drivers license';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(12; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(13; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(14; "Reservation Date From"; Date)
        {
            Caption = 'Reservation Date From';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(15; "Reservation Date To"; Date)
        {
            Caption = 'Reservation Date To';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16; "Total"; Integer)
        {
            Caption = 'Total';
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
}