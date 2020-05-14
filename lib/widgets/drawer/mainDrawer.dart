import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/model/region_model.dart';
import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class MainDrawer extends StatelessWidget {

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
               TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  style: DefaultTextStyle.of(context).style.copyWith(
                    fontStyle: FontStyle.italic
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  )
                ),
                suggestionsCallback: (pattern) async {
                  // var suggestions = getRegionsForZip(pattern);
                  // print(suggestions.toString());
                  return await getRegionsForZip(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text((suggestion as CityInformation).cityInformationCity),
                    // subtitle: Text('\$${suggestion['price']}'),
                  );
                },
                onSuggestionSelected: (suggestion) {

                  CityInformation city = suggestion as CityInformation;

                  print(city.cityInformationZip +  ' was selected');
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => ProductPage(product: suggestion)
                  // ));
                },
              ),
                // TextField(
                //   decoration: InputDecoration(
                //     contentPadding: EdgeInsets.all(15.0),
                //     hintText: 'Region hinzufügen',
                //     prefixIcon: Icon(Icons.add),
                //   ),
                // ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text('Nordrhein-Westfalen'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        dense: true,
                        enabled: true,
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text('Bayern'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        dense: true,
                        enabled: true,
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text('Hessen'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        dense: true,
                        enabled: true,
                      ),
                    ]
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

}