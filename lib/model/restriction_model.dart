import 'package:flutter/material.dart';

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
  Image restrictionAreaSymbol;
  
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
    this.restrictionAreaSymbol,
  });
   
  String translatedType(String type) {
      switch (type) {
        case "PUBLIC_TRANSPORTATION":
          return "Nahverkehr";
        case "RETAIL":
          return "Einzelhandel";
        case "EVENTS_AND_ASSEMBLIES":
          return "Veranstaltungen & Gruppen";
        case "PUBLIC_PLACES":
          return "Öffentliche Plätze";
        case "GASTRONOMY":
          return "Gastronomie";
        case "CURFEW":
          return "Ausgangsbeschränkung";
        default:
          return type;
      }
    }

  Image translateRestrictionAreaSymbol(String area) {
    switch (area) {
      case "Rheinland-Pfalz":
        return Image(image: AssetImage('assets/state_img/rheinlandpfalz.png'), fit: BoxFit.fitWidth);
      // return Image.asset('assets/state_img/rheinlandpfalz.png');
      case "Baden-Württemberg":
        return Image(image: AssetImage('assets/state_img/badenwuertemberg.png'), fit: BoxFit.fitWidth);
      case "Hessen":
        return Image(image: AssetImage('assets/state_img/hessen.png'), fit: BoxFit.fitWidth);
      case "Hamburg":
        return Image(image: AssetImage('assets/state_img/hamburg.png'), fit: BoxFit.fitWidth);
      case "Sachsen-Anhalt": 
        return Image(image: AssetImage('assets/state_img/sachsenanhalt.png'), fit: BoxFit.fitWidth);
      case "Nordrhein-Westfalen":
        return Image(image: AssetImage('assets/state_img/nordrheinwestfalen.png'), fit: BoxFit.fitWidth);
      case "Berlin":  
        return Image(image: AssetImage('assets/state_img/berlin.png'), fit: BoxFit.fitWidth);
      case "Hamburg":
          return Image(image: AssetImage('assets/state_img/hamburg.png'), fit: BoxFit.fitWidth);
      case "Bayern":  
        return Image(image: AssetImage('assets/state_img/bayern.png'), fit: BoxFit.fitWidth);
      case "Bremen":  
        return Image(image: AssetImage('assets/state_img/bremen.png'), fit: BoxFit.fitWidth); 
      case "Saarland":  
        return Image(image: AssetImage('assets/state_img/saarland.png'), fit: BoxFit.fitWidth);
      case "Sachsen":  
        return Image(image: AssetImage('assets/state_img/sachsen.png'), fit: BoxFit.fitWidth);      
      case "Schleswig-Holstein":  
        return Image(image: AssetImage('assets/state_img/schleswigholstein.png'), fit: BoxFit.fitWidth);
      case "Thüringen":  
        return Image(image: AssetImage('assets/state_img/thueringen.png'), fit: BoxFit.fitWidth);
      case "Brandenburg":  
        return Image(image: AssetImage('assets/state_img/brandenburg.png'), fit: BoxFit.fitWidth);
      case "Berlin":  
        return Image(image: AssetImage('assets/state_img/berlin.png'), fit: BoxFit.fitWidth);
      case "Mecklenburg-Vorpommern":  
        return Image(image: AssetImage('assets/state_img/mecklenburgvorpommern.png'), fit: BoxFit.fitWidth);
      case "Deutschland": 
        return Image(image: AssetImage('assets/state_img/germany.png'), fit: BoxFit.fitWidth);

      default:
        return null;
    }
  }

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
        restrictionArealIdentifier: json['arealIdentifier'],
        restrictionCreated: json['restrictionCreated'],
        restrictionVerified: json['verified'],
        // restrictionAreaSymbol: restrictionAreaSymbol(),
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