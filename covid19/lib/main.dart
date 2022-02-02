// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/Covidtoday.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Covid19 report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get uri => null;
  late List<CovidTodayResult> _dataFromWebapi;
  @override
  void initState() {
    super.initState();

    getcovidtoday();
  }

  Future<List<CovidTodayResult>> getcovidtoday() async {
    // print("Test");
    var url =
        Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
    var response = await http.get(url);
    //print(response.body);
    _dataFromWebapi = covidTodayResultFromJson(response.body);
    return _dataFromWebapi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getcovidtoday(),
        builder: (BuildContext content, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.red.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading:
                              FaIcon(FontAwesomeIcons.lungsVirus, size: 50),
                          title: Text(
                            '${_dataFromWebapi[0].newCase} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          subtitle: Text(
                            'จำนวนผู้ติดเชื้อรายใหม่',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.red.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.viruses, size: 50),
                          title: Text(
                            '${_dataFromWebapi[0].newCaseExcludeabroad} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'จำนวนผู้ติดจากภายในประเทศ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.red.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.virus, size: 50),
                          title: Text(
                            '${_dataFromWebapi[0].totalCase} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'จำนวนผู้ติดเชื้อสะสม',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.grey.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.dizzy,
                            size: 50,
                          ),
                          title: Text(
                            '${_dataFromWebapi[0].newDeath} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'จำนวนผู้เสียชีวิตรายใหม่',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.cross,
                            size: 50,
                          ),
                          title: Text(
                            '${_dataFromWebapi[0].totalDeath} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'จำนวนผู้เสียชีวิตสะสม',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.green.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.plusCircle,
                            size: 50,
                          ),
                          title: Text(
                            '${_dataFromWebapi[0].newRecovered} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'รักษาหาย',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Card(
                    color: Colors.green.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.2),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.heartbeat,
                            size: 50,
                          ),
                          title: Text(
                            '${_dataFromWebapi[0].totalRecovered} คน',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'จำนวนผู้รักษาหายสะสม',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
