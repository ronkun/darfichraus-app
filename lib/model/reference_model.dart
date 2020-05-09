class SituationReference {
  String referenceId; 
  // String modified;
  // String type;
  // String classifier;
  // String source;
  String title;


  SituationReference ({
    this.referenceId,

  });

  factory SituationReference.fromJson(Map<String, dynamic> json){
    return SituationReference(
      // restrictionId: json['id'],
      // restrictionDescription: json['restrictionDescription'],
      // restrictionShortDescription: json['shortDescription'],
      // restrictionPublisher: json['publisher'],
      // restrictionFurtherInformation: json['furtherInformation'],
      // restrictionRecipient: json['recipient'],
      // restrictionStart: json['restrictionStart'],
      // restrictionEnd: json['restrictionEnd'],
      // restrictionState: json['restrictionState'],
      // restrictionType: json['restrictionType'],
      // restrictionArealIdentifier: json['arealIdentifier'],
      // restrictionCreated: json['restrictionCreated'],
      // restrictionVerified: json['verified'],
      // restrictionAreaSymbol: restrictionAreaSymbol(),
    );
  }
//     [
//   {
//     "id": "string",
//     "modified": "2020-05-09T22:25:02.645Z",
//     "title": "How to wear a face mask?",
//     "type": "URL",
//     "classifier": "ATTACHMENT",
//     "source": "http://darfichraus.de/mask-mandatory.pdf"
//   }
// ]
}