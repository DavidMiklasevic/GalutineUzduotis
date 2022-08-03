page 50110 "DriversLicensePicture"
{
    Caption = 'Drivers License Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Auto Rent Header";
    layout
    {
        area(content)
        {
            field("Drivers license"; Rec."Drivers license")
            {
                ApplicationArea = Basic, Suite, Invoicing;
                ShowCaption = false;
                ToolTip = 'Specifies the picture that has been inserted for the item.';
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';
                Visible = HideActions = FALSE;

                trigger OnAction()
                begin
                    ImportFromDevice;
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';
                Visible = HideActions = FALSE;

                trigger OnAction()
                begin
                    DeleteItemPicture;
                end;
            }
        }
    }
    [Scope('OnPrem')]
    procedure ImportFromDevice()
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
    begin
        Find;
        TestField("No.");

        ClientFileName := '';
        FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
        if FileName = '' then
            Error('');

        Clear("Drivers license");
        "Drivers license".ImportFile(FileName, ClientFileName);
        Modify(true);
        OnImportFromDeviceOnAfterModify(Rec);

        if FileManagement.DeleteServerFile(FileName) then;
    end;

    procedure DeleteItemPicture()
    begin
        TestField("No.");

        if not Confirm(DeleteImageQst) then
            exit;

        Clear("Drivers license");
        Modify(true);

        OnAfterDeleteItemPicture(Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterDeleteItemPicture(var AutoRentHeader: Record "Auto Rent Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnImportFromDeviceOnAfterModify(var AutoRentHeader: Record "Auto Rent Header")
    begin
    end;


    var
        Camera: Codeunit Camera;
        [InDataSet]
        CameraAvailable: Boolean;
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;
        HideActions: Boolean;
        MustSpecifyDescriptionErr: Label 'You must add a description to the item before you can import a picture.';
        MimeTypeTok: Label 'image/jpeg', Locked = true;
}