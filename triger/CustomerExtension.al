pageextension 50991 CustomerExtension extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(ShowSalesReport)
            {
                Caption = 'نمایش گزارش فروش';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                // var
                //     SalesReport: Report "Customer Sales Report";
                //     Customer: Record Customer;
                begin
                    Message('saeedgg');
                    // Customer.Get(Rec."No.");
                    // SalesReport.SetTableView(Customer);
                    // SalesReport.RunModal();
                end;
            }
        }
    }
}