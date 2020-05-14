import 'package:pref_dessert/pref_dessert.dart';

class CityInformation {
  String cityInformationCity;
  String cityInformationZip;
  String cityInformationCounty;
  String situationMessageTypeMedia;
  String cityInformationState;
  String cityInformationCountry;

  CityInformation ({
    this.cityInformationCity, 
    this.cityInformationZip, 
    this.cityInformationCounty, 
    this.cityInformationState, 
    this.cityInformationCountry, 
  });

  factory CityInformation.fromJson(Map<String, dynamic> json){
    return CityInformation(
      cityInformationCity: json['city'],
      cityInformationZip: json['zip'],
      cityInformationCounty: json['county'],
      cityInformationState: json['state'],
      cityInformationCountry: json['country'],
    );
  }

  @override
  bool operator ==(other) {
    return this.cityInformationZip == other.cityInformationZip && this.cityInformationCity == other.cityInformationCity;
  }

  @override
    int get hashCode => cityInformationZip.hashCode;
  }


class CityInfoDesSer extends DesSer<CityInformation>{
  @override
  CityInformation deserialize(String s) {
    var split = s.split(",");
    return new CityInformation(
      cityInformationCity: split[0], 
      cityInformationZip: split[1], 
      cityInformationCounty: split[2], 
      cityInformationState: split[3], 
      cityInformationCountry: split[4]);
  }

  @override
  String serialize(CityInformation t) {
    print("CITY TO SAVE"+t.cityInformationCity);
    return "${t.cityInformationCity},${t.cityInformationZip},${t.cityInformationCounty},${t.cityInformationState},${t.cityInformationCountry}";
  }
  
  @override
  String get key => "selectedregions";

}