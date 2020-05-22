import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/service/regions_service.dart';
import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/sharedPreferencesHelper.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pref_dessert/pref_dessert.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeId = 'first';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<String> statesValues = <String>['Pandemie - Corona Sars-CoV-2', 'Pandemie - Katastrophe B', 'Erdbeben - Katastrophe C', 'Katastrophe D'];
  List<String> crisisValues = <String>['Baden-Württemberg', 'Bayern', 'Berlin', 'Brandenburg', 'Bremen', 'Hamburg', 'Hessen', 'Mecklenburg-Vorpommern', 'Niedersachsen', 'Nordrhein-Westfalen', 'Rheinland-Pfalz', 'Saarland', 'Sachsen', 'Sachsen-Anhalt', 'Schleswig-Holstein', 'Thüringen'];
  List<CityInformation> _selectedRegionsList = [];
  List<String> regions = new List<String>();
  final TextEditingController _typeAheadController = TextEditingController();
  var repo = new FuturePreferencesRepository<CityInformation>(new CityInfoDesSer());
  CityInformation tmpCity;

  Future<List<CityInformation>> prefRegions;
  final emailFormController = TextEditingController();

  @override
  void dispose() {

    // Clean up the controller when the widget is disposed.
    emailFormController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    PreferencesHelper.getString("eMail").then((value) {
        setState(() {
          emailFormController.text = value;
        });
      }
    );
    // prefRegions = repo.findAll();

    super.initState();
  }

  // put into preferenceshelper!
  void _insertSelectedRegion(CityInformation city) {
    setState(() {
       if (_selectedRegionsList.contains(city)) {
          // print('Already exists!');
        } else {
          _selectedRegionsList.add(city);
          // print('Added!');
          repo.removeAll();
          // _selectedRegionsList.forEach((element) => print("CITYS"+element.cityInformationCity));
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

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? MainColors.dirMainBlue : LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  // void _insertSelectedCrisis(String value) {
  //   setState(() {
  //     if(!_selectedCrisisList.contains(value) && value.isNotEmpty)
  //       _selectedCrisisList.add(value);
  //   });
  // }

  //  void _removeSelectedCrisis(String value) {
  //   setState(() {
  //     if(_selectedCrisisList.contains(value))
  //       _selectedCrisisList.remove(value);
  //   });
  // }

  // void _insertSelectedState(String value) {
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
            backgroundColor: MainColors.dirMainBlue,
            elevation: 0.0,
            leading: Hero(
              tag: "widget.advisorCardObject.uuid + ""_backIcon",
              child: Material(
                color: Colors.transparent,
                type: MaterialType.transparency,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ),
            ),
            actions: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        // _pageController.nextPage(
                        //   duration: Duration(milliseconds: 500),
                        //   curve: Curves.ease,
                        // );
                        Navigator.pushNamed(context, '/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Überspringen',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                  ),
                ),
            ],
          ),
      body: 
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     stops: [0.1, 0.7, 0.8, 0.9],
          //     colors: [
          //       MainColors.dirMainBlue,
          //       Colors.lightBlue[800],
          //       Colors.lightBlue[700],
          //       Colors.lightBlue[600],
          //     ],
          //   ),
          // ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      // getPageCrisisSelection(),
                      getPageStateSelection(),
                      getPageSettingsSelection(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                              color: MainColors.dirMainBlue,
                              textColor: Colors.white,
                              disabledColor: Colors.white,
                              disabledTextColor: Colors.white,
                              splashColor: Colors.lightBlue[100],
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Weiter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 21.0,
                                    )
                                  ),
                                ],
                              ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 50.0,
              width: double.infinity,
              color: MainColors.dirMainBlue,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Fertig',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }


  /*
    ####### PAGES
  */

  // getPageCrisisSelection() {
  //   return          
  //     Padding(
  //       padding: EdgeInsets.all(40.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Center(
  //             child: 
  //             Text(
  //               "Über welche Krise möchtest Du informiert werden?",
  //               style: TextStyle(color: MainColors.dirMainBlue, fontSize: 16.0, fontWeight: FontWeight.bold),
  //             )
  //           ),
  //           SizedBox(height: 30.0),
  //           new DropdownButton<String>(
  //             hint: _selectedCrisis == null
  //             ? Text(
  //               'Bitte Krise auswählen',
  //               style: TextStyle(
  //                   color: MainColors.dirMainBlue,
  //               ),
  //             )
  //             : Text(
  //               _selectedCrisis,
  //               style: TextStyle(
  //                   color: MainColors.dirMainBlue,
  //               ),
  //             ),
  //             iconEnabledColor: Colors.white,
  //             iconDisabledColor: Colors.white,
  //             isExpanded: true,
  //             items: statesValues.map((String value) {
  //               return new DropdownMenuItem<String>(
  //                 value: value,
  //                 child: new Text(
  //                   value,
  //                   style: TextStyle(
  //                     color: Colors.lightBlue[800],
  //                   ),
  //                 ),
  //               );
  //             }).toList(),
  //             onChanged: (value) {
  //               setState(() {
  //                 _selectedCrisis = value;
  //               });
  //             },
  //             icon: IconButton(
  //               icon: Icon(Icons.add),
  //               onPressed: () {
  //                 if(_selectedCrisis!=null)
  //                   _insertSelectedCrisis(_selectedCrisis);
  //               },
  //             ),
  //           ),
  //           // SizedBox(height: 15.0),
  //           new Expanded(
  //             child: ListView.builder(
  //               itemCount: _selectedCrisisList.length,
  //               itemBuilder: (context, index) {
  //                 return ListTile(
  //                   title: Text(
  //                     _selectedCrisisList[index],
  //                     style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
  //                   ),
  //                   leading: Text(
  //                     (index+1).toString(), 
  //                     style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
  //                     ),
  //                   trailing:  IconButton(
  //                     icon: new Icon(
  //                         Icons.delete,
  //                         color: MainColors.dirMainBlue,
  //                       ),
  //                     onPressed: () { 
  //                       _removeSelectedCrisis(_selectedCrisisList[index]);
  //                     },
  //                   ),
  //                 );
  //               },
  //             )
  //           )
  //         ],
  //       ),
  //     );
  // }

  getPageStateSelection() {
    return 
      Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                    Center(
              child: 
              Text(
                "Bitte füge die Regionen hinzu, die Dich interessieren.",
                style: TextStyle(color: MainColors.dirMainBlue, fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ),
            SizedBox(height: 30.0),
            // new DropdownButton<String>(
            //   hint: _selectedCrisis.isEmpty
            //   ? Text(
            //     'Postleitzahl eingeben',
            //     style: TextStyle(
            //         color: MainColors.dirMainBlue
            //     ),
            //   )
            //   : Text(
            //     _selectedState,
            //     style: TextStyle(
            //         color: MainColors.dirMainBlue,
            //     ),
            //   ),
            //   iconEnabledColor: MainColors.dirMainBlue,
            //   iconDisabledColor: Colors.grey,
            //   isExpanded: true,
            //   items: crisisValues.map((String value) {
            //     return new DropdownMenuItem<String>(
            //       value: value,
            //       child: new Text(
            //         value,
            //         style: TextStyle(
            //           color: Colors.lightBlue[800],
            //         ),
            //       ),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedState = value;
            //     });
            //   },
            //   icon: IconButton(
            //     icon: Icon(Icons.add),
            //     onPressed: () {
            //       if(_selectedState!=null)
            //         _insertSelectedState(_selectedState);
            //     },
            //   ),
            // ),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                onTap: () {
                  this._typeAheadController.text = "";
                },
                // autofocus: true,
                controller: this._typeAheadController,
                // style: DefaultTextStyle.of(context).style.copyWith(
                //   fontStyle: FontStyle.italic,
                //   fontSize: 12,
                // ),
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
            ),
            
            SizedBox(height: 10),
            Text(
              _selectedRegionsList.length.toString() + " von " +"5 Regionen hinzugefügt", 
              style: TextStyle(color: Colors.lightBlue[800], fontSize: 11.0, fontWeight: FontWeight.w600),),
            SizedBox(height: 15),
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
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _selectedStatesList.length,
            //     itemBuilder: (context, index) {
            //       return  Opacity(
            //         opacity: 0.8,
            //         child: Card(
            //           color: Colors.lightBlue[800],
            //           child: ListTile(
            //           title: Text(
            //             _selectedStatesList[index],
            //             style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
            //           ),
            //           leading: Text(
            //             (index+1).toString(), 
            //             style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           trailing:  IconButton(
            //             icon: Icon(
            //                 Icons.delete,
            //                 color: Colors.white,
            //               ),
            //             onPressed: () { 
            //               _removeSelectedStates(_selectedStatesList[index]);
            //             },
            //           ),
            //         )));
            //     },
            //   )
            // ),
          ],
        ),
      );
  }

  getPageSettingsSelection() {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "Einstellungen",
              style: TextStyle(color: MainColors.dirMainBlue, fontSize: 16.0, fontWeight: FontWeight.bold),
            )
          ),
          SizedBox(height: 30.0),
          TextField(
            controller: emailFormController,
            autofocus: true,
            decoration: new InputDecoration(
                labelText: 'E-Mail:', hintText: "E-Mail Adresse eingeben"),
                style: TextStyle(color: MainColors.dirMainBlue),
          ),
          SizedBox(height: 30.0),
          SwitchListTile(
            activeColor: Colors.lightBlue[300],
            contentPadding: const EdgeInsets.all(0),
            value: true,
            title: Text("Push-Benachrichtigungen"),
            onChanged: (val) {
              PreferencesHelper.setBool("push_notifications", val);
            },
          ),
          SwitchListTile(
            activeColor: Colors.lightBlue[300],
            contentPadding: const EdgeInsets.all(0),
            value: false,
            title: Text("E-Mail Benachrichtigungen"),
            onChanged: (val) {
              PreferencesHelper.setBool("email_notifications", val);
            },
          ),
          SwitchListTile(
            activeColor: Colors.lightBlue[800],
            contentPadding: const EdgeInsets.all(0),
            value: true,
            title: Text("Newsletter"),
            onChanged: (val) {
              PreferencesHelper.setBool("newsletter", val);
            },
          ),
          SwitchListTile(
            activeColor: Colors.lightBlue[300],
            contentPadding: const EdgeInsets.all(0),
            value: true,
            title: Text("Standortbestimmmung"),
            onChanged: (val) {
              PreferencesHelper.setBool("gps_location", val);
            },
          ),
        ],
      ),
    );
  }

}