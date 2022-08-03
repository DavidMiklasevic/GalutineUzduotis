page 50113 "Auto Rent Damage"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Damage";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        AutoDamage: Record "Auto Damage";
    begin
        AutoDamage."Auto No." := Rec."Line No.";
        AutoDamage."Line No." := Format(AutoDamage.Count + 1);
        AutoDamage.Date := Rec.Date;
        AutoDamage."Damage report" := Rec.Description;
        AutoDamage.Status := AutoDamage.Status::Active;
        AutoDamage.Insert();
    end;
}