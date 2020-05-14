import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/sharedPreferencesHelper.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<String> _selectedRegions;
  List<String> regions = new List<String>();
  final TextEditingController _typeAheadController = TextEditingController();
  CityInformation city;

  @override
  void initState() {
    super.initState();
    regions.add("45133");
    regions.add("49716");
    // regions.add("");
    // regions.add("Berlin");
    PreferencesHelper.setStringList('regions', regions);
  }

//with city objects
// class JsonPersonDesSer extends DesSer<Person>{
//   @override
//   Person deserialize(String s) {
//     var map = json.decode(s);
//     return new Person(map['name'] as String, map['age'] as int);
//   }

//   @override
//   String serialize(Person t) {
//     var map = {"name":t.name, "age":t.age};
//     return json.encode(map);
//   }

// }



  // void _insertSelectedRegion(String value) {
  //   setState(() {
  //     if(!_selectedStatesList.contains(value) && value.isNotEmpty)
  //       _selectedStatesList.add(value);
  //   });
  // }

  //  void _removeSelectedStates(String value) {
  //   setState(() {
  //     if(_selectedStatesList.contains(value)){
  //       _selectedStatesList.remove(value);
  //     }
  //   });
  // }


    @override
    Widget build(BuildContext context) {
      return Drawer(
            // padding: EdgeInsets.zero,
            elevation: 1.5,
              child: Column( 
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: MainColors.dirMainBlue,
                      // image: DecorationImage(
                      //     fit: BoxFit.scaleDown, 
                      //     image: AssetImage('assets/logo/Logo_darf-ich-raus-edit.png')
                      // )
                    ), 
                    child: null,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: 
                  TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      // autofocus: true,
                      controller: this._typeAheadController,
                      style: DefaultTextStyle.of(context).style.copyWith(
                        fontStyle: FontStyle.italic
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Postleitzahl eingeben",
                      )
                    ),
                    suggestionsCallback: (pattern) async {
                      // var suggestions = getRegionsForZip(pattern);
                      // print(suggestions.toString());
                      return await getCitiesForZip(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text((suggestion as CityInformation).cityInformationCity),
                        dense: true,
                        // subtitle: Text('\$${suggestion['price']}'),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      CityInformation city = suggestion as CityInformation;
                      print(city.cityInformationZip +  ' was selected');
                      // _selectedRegions.add()
                      this._typeAheadController.text = city.cityInformationZip;
                      PreferencesHelper.setStringList('regions', _selectedRegions);
                      
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => ProductPage(product: suggestion)
                      // ));
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please select a city';
                      }
                    },
                  )),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsets.all(15.0),
                  //     hintText: 'Region hinzufügen',
                  //     prefixIcon: Icon(Icons.add),
                  //   ),
                  // ),
                  Expanded(
                    child:  FutureBuilder<List<String>>(
                      future: PreferencesHelper.getStringList('regions'),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:       
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Utility.getCircularProgressIndicator(50.0, 50.0);
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if(snapshot.hasData) {
                              return ListView.builder(
                                //itemCount: filtered.length
                                //  SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
                                //   restrictionsCount = snapshot.data.length;
                                //  })));
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                getCitiesForZip(snapshot.data[index]).then((val) {
                                  city = val.asMap()[0];
                                  print(city.cityInformationCity);
                                });
                                  // city = getCityForZip(snapshot.data[index]);
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 11),
                                    child: ListTile(
                                      title: Text(city.cityInformationCity),
                                      subtitle: Text(city.cityInformationZip + ", " + city.cityInformationState),
                                      trailing: Icon(Icons.keyboard_arrow_right),
                                      leading: Icon(Icons.location_city),
                                      dense: true,
                                      enabled: true,
                                    )
                                  );
                                }
                              );
                            }
                        }
                      }
                    )
                  )

                    // ListView(
                    //   padding: EdgeInsets.zero,
                    //   children: <Widget>[
                    //     ListTile(
                    //       leading: Icon(Icons.location_city),
                    //       title: Text('Nordrhein-Westfalen'),
                    //       trailing: Icon(Icons.keyboard_arrow_right),
                    //       dense: true,
                    //       enabled: true,
                    //     ),
                    //     ListTile(
                    //       leading: Icon(Icons.location_city),
                    //       title: Text('Bayern'),
                    //       trailing: Icon(Icons.keyboard_arrow_right),
                    //       dense: true,
                    //       enabled: true,
                    //     ),
                    //     ListTile(
                    //       leading: Icon(Icons.location_city),
                    //       title: Text('Hessen'),
                    //       trailing: Icon(Icons.keyboard_arrow_right),
                    //       dense: true,
                    //       enabled: true,
                    //     ),
                    //   ]
                    // )
                  ,
                  Container(
                    // This align moves the children to the bottom
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                            child: Column(
                          children: <Widget>[
                            Divider(),
                            ListTile(
                                leading: Icon(Icons.info),
                                title: Text('Über uns'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  navigateToPage(context, 'aboutus');
                                },
                                // onTap: () => navigateToPage(context, 'anotherPage'),
                              ),
                            ListTile(
                                leading: Icon(Icons.help),
                                title: Text('Hilfe und Feedback'))
                          ],
                        )
                    )
                  )
                )
            ],
          ),
        );
      }
    
    navigateToPage(BuildContext context, String page) {
      Navigator.of(context).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
    }
    
    getPageCrisisSelection() {
      return          
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Text("j"),
        );
    }

    // CityInformation getCityForZip(String data) {
    //   getCitiesForZip(data).then((val) {
    //     // setState(() {
    //       city = val.asMap()[0];
    //     // }); 
    //     print(city.cityInformationCity);
    //     return city;
    //   });
    // }
    
  // getRegionsAsList() async {
  //   Future<List> _futureOfList = PreferencesHelper.getStringList('regions');
  //   List list = await _futureOfList ;
  //   return list;
  //   // print(list);
  // }
}