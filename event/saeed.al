codeunit 50990 saeidcodeunit
{
    [EventSubscriber(ObjectType::Page, 42, 'saeedextend', '', false, false)]

    local procedure saeedextend()
    var
        saeidmessage: Label 'hi';
    begin
        Message(saeidmessage);
    end;
}