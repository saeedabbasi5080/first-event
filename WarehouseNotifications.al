codeunit 50991 WarehouseNotifications
{
    [EventSubscriber(ObjectType::page, 42, 'OnAfterSalesOrderPosted', '', true, true)]
    local procedure OnAfterSalesOrderPosted(SalesHeader: Record "Sales Header")
    var
        NotificationMessage: Label 'Sales order %1 has been posted. Please 2% prepare the items for shipment00000.', Comment = '%1 = tuj, 2% = hjghj';
    begin
        // ارسال اعلان به بخش انبار
        Message(NotificationMessage, SalesHeader."Document Date", SalesHeader."No."); //NotificationMessage, SalesHeader."No."
        // یا ارسال ایمیل، پیامک، و غیره
    end;

    //     procedure PostSalesOrder(var SalesHeader: Record "Sales Header")
    // begin
    //     // منطق ارسال سفارش فروش
    //     // ...

    //     SalesHeader.Status := SalesHeader.Status::Released;
    //     SalesHeader.Modify();

    //     OnAfterSalesOrderPosted(SalesHeader); // انتشار رویداد
    // end;
}