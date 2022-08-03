table 50105 "Auto Reservation"
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
        field(11; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(12; "Reservation Date From"; Date)
        {
            Caption = 'Reservation Date From';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckReservationDate();
            end;
        }
        field(13; "Reservation Date To"; Date)
        {
            Caption = 'Reservation Date To';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckReservationDate();
            end;
        }

    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }
    local procedure CheckReservationDate()
    var
        Error: Label 'This car is already reserved in this period of time, choose a different time';
        AutoReservation: record "Auto Reservation";
        Temp: Integer;
    begin
        if ("Reservation Date From" = 0D) or ("Reservation Date To" = 0D) then
            exit;
        if AutoReservation.FindFirst() then
            repeat
                if (((AutoReservation."Auto No." = "Auto No.") and (AutoReservation."Reservation Date From" < "Reservation Date From") and (AutoReservation."Reservation Date To" > "Reservation Date To"))
                or ((AutoReservation."Auto No." = "Auto No.") and (AutoReservation."Reservation Date From" > "Reservation Date From") and (AutoReservation."Reservation Date From" < "Reservation Date To"))
                or ((AutoReservation."Auto No." = "Auto No.") and (AutoReservation."Reservation Date To" > "Reservation Date From") and (AutoReservation."Reservation Date To" < "Reservation Date To"))) then
                    Temp := Temp + 1;
            Until AutoReservation.Next() = 0;



        if (Temp > 0) then
            Error(Error,
            FieldCaption("Reservation Date From"),
            FieldCaption("Reservation Date To"),
            "Reservation Date From",
            "Reservation Date To");

    end;


}