import 'package:pref_dessert/pref_dessert.dart';
import 'package:uuid/uuid.dart';

class CityInformation {
  String uuid ;
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

  CityInformation.initialize() {
    this.uuid = Uuid().v1();
  }

  factory CityInformation.fromJson(Map<String, dynamic> json){
    return CityInformation(
      cityInformationCity: json['city'],
      cityInformationZip: json['zip'],
      cityInformationCounty: json['county'],
      cityInformationState: json['state'],
      cityInformationCountry: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.cityInformationCity;
    data['zip'] = this.cityInformationZip;
    data['county'] = this.cityInformationCounty;
    data['state'] = this.cityInformationState;
    data['country'] = this.cityInformationCountry;
    return data;
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
    // print("CITY TO SAVE"+t.cityInformationCity);
    return "${t.cityInformationCity},${t.cityInformationZip},${t.cityInformationCounty},${t.cityInformationState},${t.cityInformationCountry}";
  }
  
  @override
  String get key => "selectedregions";

}