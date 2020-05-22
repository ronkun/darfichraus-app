import 'package:crimsy/model/city_information_model.dart';

class Region {
  String regionZipPart;
  int regionCount;
  List<CityInformation> regionCities;

  Region ({
    this.regionZipPart, 
    this.regionCount, 
    this.regionCities, 
  });

  factory Region.fromJson(Map<String, dynamic> json){
    return Region(
      regionZipPart: json['zip-part'],
      regionCount: json['count'],
      regionCities: List<CityInformation>.from(json["cities"].map((x) => CityInformation.fromJson(x))),
      // list.map((i) => Data.fromJson(i)).toList()
    );
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zip-part'] = this.regionZipPart;
    data['count'] = this.regionCount;
    if (this.regionCities != null) {
      data['cities'] = this.regionCities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// {
//   "zip-part": "830",
//   "count": 42,
//   "cities": [
//     {
//       "city": "Bad Aibling",
//       "zip": "83043",
//       "county": "Landkreis Rosenheim",
//       "state": "Bayern",
//       "country": "Deutschland"
//     }
//   ]
// }