public with sharing class ContentDocumentLinkTriggerHandler {

    private ContentDocumentLinkTriggerHelper helper = new ContentDocumentLinkTriggerHelper();
    private ContentDocumentLinkTriggerDao dao = new ContentDocumentLinkTriggerDao();

    /**
     * Constructor
     */
    public ContentDocumentLinkTriggerHandler() {

    }

    /**
     * Check Upload File Type
     */
    public void isSharingAllowed(List<ContentDocumentLink> ContentDocumentLinks) {

        // Get ContentDocumentId
        Set<Id> docIds = this.helper.getDocumentIds(ContentDocumentLinks);

        // Get ContentVersion Records
        List<ContentVersion> versions = this.dao.getContentVersions(docIds);

        // Get ContentVersion Map
        Map<Id, ContentVersion> versionMap = this.helper.getContentVersionMap(versions);

        // Check File Type
        this.helper.isFileType(ContentDocumentLinks, versionMap);
    }
}