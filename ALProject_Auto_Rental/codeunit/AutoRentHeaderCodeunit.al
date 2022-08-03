codeunit 50100 "Auto Rent Header codeunit"
{
    TableNo = "Auto Rent Header";

    procedure Release(var AutoRentHeader: Record "Auto Rent Header")
    begin
        AutoRentHeader.TestField("Reservation Date From");
        AutoRentHeader.TestField("Reservation Date To");
        AutoRentHeader.TestField(Total);

        AutoRentHeader."Rent Status" := AutoRentHeader."Rent Status"::Released;
        AutoRentHeader.Modify();

    end;


    var
        myInt: Integer;
}