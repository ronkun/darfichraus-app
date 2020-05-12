class SituationMessageDocuments {
  String situationMessageDocumentsId;
  String situationMessageDocumentsModified;
  String situationMessageDocumentsTitle;
  String situationMessageDocumentTypes;
  String situationMessageDocumentsClassifier;
  String situationMessageDocumentsSource;

  SituationMessageDocuments ({
    this.situationMessageDocumentsModified, 
    this.situationMessageDocumentsId, 
    this.situationMessageDocumentsTitle, 
    this.situationMessageDocumentTypes, 
    this.situationMessageDocumentsClassifier, 
    this.situationMessageDocumentsSource,
  });

  factory SituationMessageDocuments.fromJson(Map<String, dynamic> json){
    return SituationMessageDocuments(
      situationMessageDocumentsId: json['id'],
      situationMessageDocumentsModified: json['modified'],
      situationMessageDocumentsTitle: json['title'],
      situationMessageDocumentTypes: json['types'],
      situationMessageDocumentsClassifier: json['classifier'],
      situationMessageDocumentsSource: json['source'],
    );

//     "documents": [
//       {
//         "id": "string",
//         "modified": "2020-05-12T07:50:12.228Z",
//         "title": "How to wear a face mask?",
//         "type": "URL",
//         "classifier": "ATTACHMENT",
//         "source": "http://darfichraus.de/mask-mandatory.pdf"
//       }
//     ],
  }
}
