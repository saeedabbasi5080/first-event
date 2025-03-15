tableextension 50990 SalesHeaderExtension extends "Sales Header"
{
    trigger OnAfterInsert()
    begin
        SendWarehouseNotification(Rec);
    end;

    local procedure SendWarehouseNotification(SalesHeader: Record "Sales Header")
    var
        NotificationMessage: Label 'سفارش فروش %1 برای مشتری %2 ثبت شد. اقلام: %3', Comment = '%1 = Sales Order No., %2 = Customer Name, %3 = Items List';
        SalesLine: Record "Sales Line";
        ItemsList: Text;
    begin
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                ItemsList += SalesLine."No." + ', ';
            until SalesLine.Next() = 0;

        Message(StrSubstNo(NotificationMessage, SalesHeader."No.", SalesHeader."Sell-to Customer Name", ItemsList));

        // یا ارسال ایمیل، پیامک، و غیره
    end;
}