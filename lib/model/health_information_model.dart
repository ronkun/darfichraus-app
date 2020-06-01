import 'package:crimsy/model/region_model.dart';

class HealthInformation {
  final String gen;
  final String bez;
  final int ewz;
  final double deathRate;
  final int cases;
  final int deaths;
  final double casesPer100k;
  final double casesPerPopulation;
  final String bl;
  final String county;
  final String lastUpdate;
  final double cases7Per100k;
  final String districtType;

  const HealthInformation(
      {this.gen,
      this.bez,
      this.ewz,
      this.deathRate,
      this.cases,
      this.deaths,
      this.casesPer100k,
      this.casesPerPopulation,
      this.bl,
      this.county,
      this.lastUpdate,
      this.cases7Per100k,
      this.districtType}
  );

  factory HealthInformation.fromJson(Map<String, dynamic> json) {
    return HealthInformation(
      gen: json['gen'],
      bez: json['bez'],
      ewz: json['ewz'],
      deathRate: json['deathRate'],
      cases: json['cases'],
      deaths: json['deaths'],
      casesPer100k: json['casesPer100k'],
      casesPerPopulation: json['casesPerPopulation'],
      bl: json['bl'],
      county: json['county'],
      lastUpdate: json['lastUpdate'],
      cases7Per100k: json['cases7Per100k'],
      districtType: json['districtType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gen'] = this.gen;
    data['bez'] = this.bez;
    data['ewz'] = this.ewz;
    data['deathRate'] = this.deathRate;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['casesPer100k'] = this.casesPer100k;
    data['casesPerPopulation'] = this.casesPerPopulation;
    data['bl'] = this.bl;
    data['county'] = this.county;
    data['lastUpdate'] = this.lastUpdate;
    data['cases7Per100k'] = this.cases7Per100k;
    data['districtType'] = this.districtType;
    return data;
  }
}


// class HealthInformation {
//   CityInformation location;
//   List<HealthInformation> healthInformation;

//   HealthInformation({this.location, this.healthInformation});

//   factory HealthInformation.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null
//         ? new CityInformation().fromJson(json['location'])
//         : null;
//     if (json['healthInformation'] != null) {
//       healthInformation = new List<HealthInformation>();
//       json['healthInformation'].forEach((v) {
//         healthInformation.add(new HealthInformation.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.location != null) {
//       data['location'] = this.location.toJson();
//     }
//     if (this.healthInformation != null) {
//       data['healthInformation'] =
//           this.healthInformation.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Location {
//   String city;
//   String zip;
//   String county;
//   String state;
//   String country;

//   Location({this.city, this.zip, this.county, this.state, this.country});

//   Location.fromJson(Map<String, dynamic> json) {
//     city = json['city'];
//     zip = json['zip'];
//     county = json['county'];
//     state = json['state'];
//     country = json['country'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['city'] = this.city;
//     data['zip'] = this.zip;
//     data['county'] = this.county;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     return data;
//   }
// }