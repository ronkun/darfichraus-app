import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String _selectedCrisis = '';
  String _selectedState = '';
  List<String> _selectedCrisisList = [];
  List<String> _selectedStatesList = [];
  List<String> statesValues = <String>['Pandemie - Corona Sars-CoV-2', 'Pandemie - Katastrophe B', 'Erdbeben - Katastrophe C', 'Katastrophe D'];
  List<String> crisisValues = <String>['Baden-Württemberg', 'Bayern', 'Berlin', 'Brandenburg', 'Bremen', 'Hamburg', 'Hessen', 'Mecklenburg-Vorpommern', 'Niedersachsen', 'Nordrhein-Westfalen', 'Rheinland-Pfalz', 'Saarland', 'Sachsen', 'Sachsen-Anhalt', 'Schleswig-Holstein', 'Thüringen'];

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
        color: isActive ? Colors.white : Colors.lightBlue[200],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

   void _insertSelectedCrisis(String value) {
    setState(() {
      if(!_selectedCrisisList.contains(value) && value.isNotEmpty)
        _selectedCrisisList.add(value);
    });
  }

   void _removeSelectedCrisis(String value) {
    setState(() {
      if(_selectedCrisisList.contains(value))
        _selectedCrisisList.remove(value);
    });
  }


  void _insertSelectedState(String value) {
    setState(() {
      if(!_selectedStatesList.contains(value) && value.isNotEmpty)
        _selectedStatesList.add(value);
    });
  }

   void _removeSelectedStates(String value) {
    setState(() {
      if(_selectedStatesList.contains(value)){
        _selectedStatesList.remove(value);
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.7, 0.8, 0.9],
              colors: [
                Colors.lightBlue[800],
                Colors.lightBlue[700],
                Colors.lightBlue[600],
                Colors.lightBlue[500],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: 
                              Text(
                                "Über welche Krise möchtest Du informiert werden?",
                                style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                              )
                            ),
                            SizedBox(height: 30.0),
                            new DropdownButton<String>(
                              hint: _selectedCrisis == null
                              ? Text(
                                'Bitte Krise auswählen',
                                style: TextStyle(
                                    color: Colors.white,
                                ),
                              )
                              : Text(
                                _selectedCrisis,
                                style: TextStyle(
                                    color: Colors.white,
                                ),
                              ),
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              isExpanded: true,
                              items: statesValues.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.lightBlue[800],
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                 _selectedCrisis = value;
                                });
                              },
                              icon: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  if(_selectedCrisis!=null)
                                    _insertSelectedCrisis(_selectedCrisis);
                                },
                              ),
                            ),
                            // SizedBox(height: 15.0),
                            new Expanded(
                              child: ListView.builder(
                                itemCount: _selectedCrisisList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      _selectedCrisisList[index],
                                      style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                    leading: Text(
                                      (index+1).toString(), 
                                      style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
                                      ),
                                    trailing:  IconButton(
                                      icon: new Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      onPressed: () { 
                                        _removeSelectedCrisis(_selectedCrisisList[index]);
                                      },
                                    ),
                                  );
                                },
                              )
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                                    Center(
                              child: 
                              Text(
                                "Bitte wähle die Bundesländer aus, die Dich interessieren.",
                                style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                              )
                            ),
                            SizedBox(height: 30.0),
                            new DropdownButton<String>(
                              hint: _selectedCrisis == null
                              ? Text(
                                'Bitte Bundesland auswählen',
                                style: TextStyle(
                                    color: Colors.white,
                                ),
                              )
                              : Text(
                                _selectedState,
                                style: TextStyle(
                                    color: Colors.white,
                                ),
                              ),
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              isExpanded: true,
                              items: crisisValues.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.lightBlue[800],
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                 _selectedState = value;
                                });
                              },
                              icon: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  if(_selectedState!=null)
                                    _insertSelectedState(_selectedState);
                                },
                              ),
                            ),
                            new Expanded(
                              child: ListView.builder(
                                itemCount: _selectedStatesList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      _selectedStatesList[index],
                                      style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                    leading: Text(
                                      (index+1).toString(), 
                                      style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight: FontWeight.bold),
                                      ),
                                    trailing:  IconButton(
                                      icon: new Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      onPressed: () { 
                                        _removeSelectedStates(_selectedStatesList[index]);
                                      },
                                    ),
                                  );
                                },
                              )
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Lorem Ipsum",
                                style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                              )
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'lorem Ipsum',
                              style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'lorem Ipsum',
                              style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
                              color: Colors.white,
                              textColor: Colors.lightBlue[800],
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.lightBlue[800],
                              splashColor: Colors.lightBlue[100],
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Weiter',
                                    style: TextStyle(
                                      color: Colors.lightBlue[800],
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.lightBlue[800],
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
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Starten',
                      style: TextStyle(
                        color: Colors.lightBlue[800],
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
}