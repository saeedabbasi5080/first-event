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
        saeedextend();
    end;


    [IntegrationEvent(true, false)]
    local procedure OnAfterSalesOrderPosted(SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure saeedextend()
    begin
    end;
}

// برای ساخت و استفاده یک ایونت ابتدا آن را به صورت دو ایونتی که در بالا ساخته ایم ایجاد می کنیم و یک پرسیجر برای آن می سازیم و بدنه پرسیجر را باید خالی بگذاریم
// در صورتی که بدنه پرسیجر را خالی نگذاریم ارور خواهیم گرفت
// سپس یک ایونت سابسکرایبر ایجاد می کنیم که این ایونت را لیسن کند، در صورتی که این ایونت فراخوانی گردد کد یونیتی که در آن سابسکرایبر نوشته شده است فراخوانی خواهد گردید
