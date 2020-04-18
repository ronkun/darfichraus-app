class Restriction {
  String restrictionId; 
  String restrictionDescription; 
  String restrictionShortDescription;
  String restrictionPublisher;
  String restrictionFurtherInformation;
  String restrictionRecipient;
  String restrictionStart;
  String restrictionEnd;
  String restrictionState;
  String restrictionType;
  String restrictionArealIdentifier;
  String restrictionCreated;
  bool restrictionVerified;
  
    Restriction ({
      this.restrictionId,
      this.restrictionDescription,
      this.restrictionShortDescription, 
      this.restrictionPublisher, 
      this.restrictionFurtherInformation, 
      this.restrictionRecipient, 
      this.restrictionStart, 
      this.restrictionEnd, 
      this.restrictionState, 
      this.restrictionType, 
      this.restrictionArealIdentifier, 
      this.restrictionCreated, 
      this.restrictionVerified,
    });
   
    factory Restriction.fromJson(Map<String, dynamic> json){
      return Restriction(
        restrictionId: json['id'],
        restrictionDescription: json['restrictionDescription'],
        restrictionShortDescription: json['shortDescription'],
        restrictionPublisher: json['publisher'],
        restrictionFurtherInformation: json['furtherInformation'],
        restrictionRecipient: json['recipient'],
        restrictionStart: json['restrictionStart'],
        restrictionEnd: json['restrictionEnd'],
        restrictionState: json['restrictionState'],
        restrictionType: json['restrictionType'],
        restrictionArealIdentifier: json['restrictionIdentifier'],
        restrictionCreated: json['restrictionCreated'],
        restrictionVerified: json['verified'],
      );
    }

//   [
//   {
//     "id": "string",
//     "created": "2020-04-18T12:58:25.082Z",
//     "modified": "2020-04-18T12:58:25.082Z",
//     "areal": "ZIP",
//     "arealIdentifier": "string",
//     "restrictionType": "PUBLIC_TRANSPORTATION",
//     "restrictionState": "BAN",
//     "shortDescription": "There are zombies everywhere",
//     "restrictionDescription": "string",
//     "restrictionStart": "2020-03-21",
//     "restrictionEnd": "2020-03-21",
//     "recipient": "Schüler",
//     "publisher": "Regierung",
//     "furtherInformation": "http://link/to/more/information",
//     "verified": false
//   }
// ]
}