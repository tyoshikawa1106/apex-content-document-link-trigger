trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {

    ContentDocumentLinkTriggerHandler handler = new ContentDocumentLinkTriggerHandler();

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // Check Upload File Type
            handler.isSharingAllowed(Trigger.new);
        }
    }
}