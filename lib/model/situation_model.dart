/*
Sitution e.g. Corona or Influenza
*/

class Situation {
  String referenceId; 
  String title;
  String situationId;
  String situationModified;
  String situationTypeId;
  String situationName;
  String situationEnd;
  String situationStart;
  int situationSeverity;
  bool situationActive;

  Situation ({
    this.referenceId, 
    this.situationId, 
    this.situationModified, 
    this.situationName, 
    this.situationTypeId, 
    this.situationStart, 
    this.situationEnd, 
    this.situationSeverity, 
    this.situationActive,
  });

  factory Situation.fromJson(Map<String, dynamic> json){
    return Situation(
      situationId: json['id'],
      situationModified: json['modified'],
      situationName: json['id'],
      situationTypeId: json['situationTypeId'],
      situationStart: json['startDate'],
      situationEnd: json['endDate'],
      situationSeverity: json['severity'],
      situationActive: json['active'],
   );
  }
}

// {
//   "id": "string",
//   "modified": "2020-05-22T10:20:07.839Z",
//   "name": "Corona/Covid-19",
//   "situationTypeId": "string",
//   "startDate": "2020-01-01",
//   "endDate": "2020-12-31",
//   "severity": 0,
//   "active": true
// }