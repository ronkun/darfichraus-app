import 'package:crimsy/model/situation_category_model.dart';
import 'package:crimsy/model/situation_messages_document.dart';
import 'package:crimsy/model/situation_messages_type.dart';
import 'package:crimsy/model/situation_model.dart';

class SituationMessage {
  String situationMessageId;
  String situationMessageModified;
  String situationMessageTitle;
  String situationMessageMessage;
  String situationMessageExcerpt;
  String situationMessageIcon;
  String situationMessageStatus;
  int situationMessageSeverity;
  double situationMessageVersion; 
  List<Situation> situationMessageSituation;
  List<SituationMessageType> situationMessageType;
  List<SituationMessageDocuments> situationMessageDocuments;
  List<String> situationMessageAreaOfEffect = [];
  List<SituationCategory> situationMessageAffectedCategories;

  SituationMessage ({
    this.situationMessageId, 
    this.situationMessageModified, 
    this.situationMessageTitle, 
    this.situationMessageMessage, 
    this.situationMessageExcerpt, 
    this.situationMessageIcon, 
    this.situationMessageSeverity, 
    this.situationMessageStatus, 
    this.situationMessageVersion, 
    this.situationMessageSituation,
    this.situationMessageType, 
    this.situationMessageDocuments, 
    this.situationMessageAreaOfEffect, 
    this.situationMessageAffectedCategories,
  });

  factory SituationMessage.fromJson(Map<String, dynamic> json){
    return SituationMessage(
      situationMessageId: json['id'],
      situationMessageModified: json['modified'],
      situationMessageTitle: json['title'],
      situationMessageMessage: json['message'],
      situationMessageExcerpt: json['excerpt'],
      situationMessageIcon: json['icon'],
      situationMessageSeverity: json['severity'],
      situationMessageStatus: json['status'],
      situationMessageVersion: json['version'],
      situationMessageAreaOfEffect: json['areaOfEffect'],
      situationMessageAffectedCategories: json['affectedCategories'],
      situationMessageSituation: List<Situation>.from(json["situation"].map((x) => Situation.fromJson(x))),
      situationMessageType: List<SituationMessageType>.from(json["messageType"].map((x) => SituationMessageType.fromJson(x))),
      situationMessageDocuments: List<SituationMessageDocuments>.from(json["documents"].map((x) => SituationMessageDocuments.fromJson(x))),
   );
  }
}