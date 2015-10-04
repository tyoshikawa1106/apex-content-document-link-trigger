public with sharing class ContentDocumentLinkTriggerHelper {

    /**
     * Constructor
     */
    public ContentDocumentLinkTriggerHelper() {

    }

    /**
     * Get ContentDocumentId
     */
    public Set<Id> getDocumentIds(List<ContentDocumentLink> ContentDocumentLinks) {
        Set<Id> docIds = new Set<Id>();
        for (ContentDocumentLink cdl : ContentDocumentLinks) {
            if (String.isNotEmpty(cdl.ContentDocumentId)) {
                docIds.add(cdl.ContentDocumentId);
            }
        }

        return docIds;
    }

    /**
     * Get Content Version Map
     */
    public Map<Id, ContentVersion> getContentVersionMap(List<ContentVersion> versions) {
        Map<Id, ContentVersion> versionMap = new Map<Id, ContentVersion>();
        for (ContentVersion v : versions) {
            versionMap.put(v.ContentDocumentId, v);
        }

        return versionMap;
    }

    /**
     * Check File Type
     */
    public void isFileType(List<ContentDocumentLink> ContentDocumentLinks, Map<Id, ContentVersion> versionMap) {
        for (ContentDocumentLink cdl : ContentDocumentLinks) {
            if (versionMap.containsKey(cdl.ContentDocumentId)) {
                ContentVersion version = versionMap.get(cdl.ContentDocumentId);
                if (version.PublishStatus.equals('P') && (version.FileExtension != null && version.FileExtension.equals('png'))) {
                    cdl.addError('Sorry, NG File Type [png]');
                }
            }
        }
    }
}
