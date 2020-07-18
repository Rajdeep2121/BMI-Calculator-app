import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Home(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  double _currentheight;
  double _currentweight;
  double _im;
  double _bmi = 0.0;
  bool calculated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              // color: Colors.green[100],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      'Body Mass Index \nCalculator',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    decoration: BoxDecoration(
                      color: Color(0xff624bff),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 200,
                    child: calculated == false
                        ? Center(
                            child: Text(
                              'Enter details',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 70,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              '${_bmi.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ProximaNova',
                                fontSize: 70,
                              ),
                            ),
                          ),
                  ),
                  Container(
                    // color: Colors.green,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Container(
                              width: 200,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter valid height';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Height(in metres)',
                                  fillColor: Colors.green[50],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color(0xff624bff), width: 2.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color(0xff624bff), width: 2.0),
                                  ),
                                ),
                                onChanged: (val) => setState(
                                    () => _currentheight = double.parse(val)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Container(
                              width: 200,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter valid weight';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Weight(in kgs)',
                                  fillColor: Colors.green[50],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color(0xff624bff), width: 2.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color(0xff624bff), width: 2.0),
                                  ),
                                ),
                                onChanged: (val) => setState(
                                    () => _currentweight = double.parse(val)),
                              ),
                            ),
                          ),
                          FlatButton.icon(
                            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            color: Color(0xff624bff),
                            label: Text(
                              'Submit',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(
                                  () {
                                    _im = _currentheight * _currentheight;
                                    _bmi = _currentweight / _im;
                                    calculated = true;
                                  },
                                );
                              }
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[300],
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.teal[800],
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 50),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Status:',
                          style: TextStyle(
                              fontFamily: 'ProximaNova', fontSize: 20),
                        ),
                        calculated == false
                            ? Text('Not Yet Known')
                            : analysis(_bmi),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget analysis(_bmi) {
    if (_bmi < 16) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Severe \nThinness.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/thin.jpg',
            height: 90,
          )
        ],
      );
    } else if (_bmi < 17 && _bmi > 16) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Moderate \nThinness.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/thin.jpg',
            height: 90,
          ),
        ],
      );
    } else if (_bmi < 18.5 && _bmi > 17) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Mild \nThinness.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/thin.jpg',
            height: 90,
          ),
        ],
      );
    } else if (_bmi < 25 && _bmi > 18.5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Normal.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/normal.jpg',
            height: 90,
          ),
        ],
      );
    } else if (_bmi < 30 && _bmi > 25) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Overweight.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/fat.jpg',
            height: 90,
          ),
        ],
      );
    } else if (_bmi < 35 && _bmi > 30) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Obese \nCategory 1.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/fat.jpg',
            height: 90,
          ),
        ],
      );
    } else if (_bmi < 40 && _bmi > 35) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Obese \nCategory 2.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/fat.jpg',
            height: 90,
          ),
        ],
      );
    } else if (_bmi > 40) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Obese \nCategory 3.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'ProximaNova',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/fat.jpg',
            height: 90,
          ),
        ],
      );
    }
    return Text('');
  }
}
