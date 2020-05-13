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
}