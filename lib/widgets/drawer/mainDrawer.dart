import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/service/regions_service.dart';
import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pref_dessert/pref_dessert.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<CityInformation> _selectedRegionsList = [];
  List<String> regions = new List<String>();
  final TextEditingController _typeAheadController = TextEditingController();
  var repo = new FuturePreferencesRepository<CityInformation>(new CityInfoDesSer());
  CityInformation tmpCity;

  // Future<List<CityInformation>> prefRegions;

  @override
  void initState() {
    super.initState();
    // prefRegions = repo.findAll();
  }

  void _insertSelectedRegion(CityInformation city) {
    setState(() {
       if (_selectedRegionsList.contains(city)) {
          // print('Already exists!');
        } else {
          _selectedRegionsList.add(city);
          // print('Added!');
          repo.removeAll();
          // _selectedRegionsList.forEach((element) => print("CITIES: "+element.cityInformationCity));
          repo.saveAll(_selectedRegionsList); 
        }
        // print("SIZE REGIONSLIST: "+_selectedRegionsList.length.toString());
    });
  }

   void _removeSelectedRegion(CityInformation city) {
    setState(() {
      // print("delete triggered"+_selectedRegionsList.length.toString());
      if(_selectedRegionsList.contains(city)){
        // print("delete: "+city.cityInformationCity);
        // print("selected regions size before: "+_selectedRegionsList.length.toString());
        repo.removeAll();
        _selectedRegionsList.remove(city);
        // print("selected regions size AFTER: "+_selectedRegionsList.length.toString());
        repo.saveAll(_selectedRegionsList);
      }
    });
   }

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
                      onTap: () {
                        this._typeAheadController.text = "";
                      },
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
                      if(pattern.isEmpty){
                      }else{
                        return await getCitiesForZip(pattern);
                      }
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.location_city, color: Colors.lightBlue[800]),
                        title: Text((suggestion as CityInformation).cityInformationCity),
                        subtitle: Text(suggestion.cityInformationZip + ", " + suggestion.cityInformationState),
                        dense: true,
                        // subtitle: Text('\$${suggestion['price']}'),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      CityInformation city = suggestion as CityInformation;
                      this._typeAheadController.text = city.cityInformationZip + ", " + city.cityInformationCity;
                      _insertSelectedRegion(city);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => ProductPage(product: suggestion)
                      // ));
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Bitte PLZ eingeben';
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
                    child:  FutureBuilder<List<CityInformation>>(
                      future: repo.findAll(),
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
                                  tmpCity = snapshot.data[index];
                                  if(!_selectedRegionsList.contains(tmpCity))
                                    _selectedRegionsList.add(tmpCity);
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 11),
                                    child: ListTile(
                                      title: Text(tmpCity.cityInformationCity),
                                      subtitle: Text(tmpCity.cityInformationZip + ", " + tmpCity.cityInformationState),
                                      // trailing: Icon(Icons.remove_circle, size: 16),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          // IconButton(
                                          //   icon: Icon(
                                          //     Icons.favorite_border,
                                          //     size: 16.0,
                                          //     color: Colors.brown[900],
                                          //   ),
                                          //   onPressed: () {
                                          //     //   _onDeleteItemPressed(index);
                                          //   },
                                          // ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle,
                                              size: 16.0,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              _removeSelectedRegion(snapshot.data[index]);
                                            },
                                          ),
                                        ],
                                      ),
                                      leading: Icon(Icons.location_city, color: Colors.lightBlue[800]),
                                      dense: true,
                                      enabled: true,
                                    )
                                  );
                                }
                              ); 
                              // : Padding(padding: EdgeInsets.only(top: 25), child: Text("Keine Regionen ausgewählt", style: TextStyle(fontWeight: FontWeight.w500)));
                            }
                        }
                      }
                    )
                  ),
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


    
  // getRegionsAsList() async {
  //   Future<List> _futureOfList = PreferencesHelper.getStringList('regions');
  //   List list = await _futureOfList ;
  //   return list;
  //   // print(list);
  // }
}

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

