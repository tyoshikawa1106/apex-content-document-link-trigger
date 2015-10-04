public with sharing class ContentDocumentLinkTriggerDao {

    /**
     * Constructor
     */
    public ContentDocumentLinkTriggerDao() {

    }

    /**
     * Get Content Version Records
     */
    public List<ContentVersion> getContentVersions(Set<Id> docIds) {
        return [
            SELECT
                 Id
                ,ContentDocumentId
                ,PublishStatus
                ,FileExtension
            FROM
                ContentVersion
            WHERE
                ContentDocumentId IN: docIds
        ];
    }
}