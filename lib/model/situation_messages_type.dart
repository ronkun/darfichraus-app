class SituationMessageType {
  String situationMessageTypeId;
  String situationMessageTypeName;
  String situationMessageTypeModified;
  String situationMessageTypeMedia;
  int situationMessageTypeSeverity;
  String situationMessageTypeColor;

  SituationMessageType ({
    this.situationMessageTypeId, 
    this.situationMessageTypeModified, 
    this.situationMessageTypeName, 
    this.situationMessageTypeMedia, 
    this.situationMessageTypeSeverity, 
    this.situationMessageTypeColor,
  });

  factory SituationMessageType.fromJson(Map<String, dynamic> json){
    return SituationMessageType(
      situationMessageTypeId: json['id'],
      situationMessageTypeModified: json['modified'],
      situationMessageTypeName: json['name'],
      situationMessageTypeMedia: json['media'],
      situationMessageTypeSeverity: json['severity'],
      situationMessageTypeColor: json['color'],
    );
  }
}