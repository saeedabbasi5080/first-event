pageextension 50990 SalesOrderPageExt extends "Sales Order"
{
    layout
    {

    }

    actions
    {
        // modify(Release)
        // {
        //     trigger OnBeforeAction()
        //     begin
        //         PostSalesOrder(Rec);
        //     end;
        // }

    }

    trigger OnOpenPage()
    begin
        PostSalesOrder(Rec);
    end;

    procedure PostSalesOrder(var SalesHeader: Record "Sales Header")
    begin
        Rec.Status := Rec.Status::Released;
        Rec.Modify();
        OnAfterSalesOrderPosted(Rec);
    end;


    [IntegrationEvent(true, false)]
    local procedure OnAfterSalesOrderPosted(SalesHeader: Record "Sales Header")
    begin
    end;
}