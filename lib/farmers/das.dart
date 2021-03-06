import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/change_pas.dart';
import 'package:farmers_konekt/farmers/details.dart';
import 'package:farmers_konekt/farmers/firebase_operation.dart';
import 'package:farmers_konekt/farmers/notification.dart';
import 'package:farmers_konekt/farmers/requests.dart';
import 'package:farmers_konekt/farmers/settings.dart';
import 'package:farmers_konekt/homeview/login.dart';
//import 'package:farmers_konekt/homeview/login.dart';
import 'package:farmers_konekt/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:farmers_konekt/hive_service.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

// final Stream<QuerySnapshot> _types =
//       FirebaseFirestore.instance.collection('user_info').snapshots();

List<_SalesData> data = [
  _SalesData('Jan', 1),
  _SalesData('Feb', 28),
  _SalesData('Mar', 34),
  _SalesData('Apr', 32),
  _SalesData('May', 40),
  _SalesData('Jun', 34),
  _SalesData('Jul', 32),
  _SalesData('Aug,', 40),
  _SalesData('Sept', 34),
  _SalesData('Oct', 32),
  _SalesData('Nov', 40),
  _SalesData('Dec', 34),
];

class _DashState extends State<Dash> {
  Map details = {};
  HiveService hiveService = HiveService();
  @override
  void initState() {
    getDetails();
    super.initState();
  }

  void getDetails() async {
    await getFirestoreDoc();
    Map _details = await hiveService.getUserInfo();
    print(_details);
    setState(() {
      details = _details;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          // PopupMenuButton(
          //   child: Center(child: Text('Hire me')),
          //   itemBuilder: (context) {
          //     return List.generate(1, (index) {
          //       return PopupMenuItem(
          //         child: Column(children: [
          //           Text('Clic here to choose  a quipment youre lookig for!'),
          //           TextButton(onPressed: () {}, child: Text('Equipment')),
          //         ]),
          //       );
          //     });
          //   },
          // ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          GestureDetector(
            onTap: (() {}),
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: const Text('ko'),
            ),
          ),
          PopupMenuButton(
            //initialValue: 0,
            child: Center(child: Icon(Icons.menu)),
            itemBuilder: (context) {
              return List.generate(1, (index) {
                return PopupMenuItem(
                    value: index,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Recoverd()));
                            },
                            child: Text('Change Password')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Change personal inf')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Settings')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Requests()));
                            },
                            child: Text('History')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Requests()));
                            },
                            child: Text('Change Password')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Message()));
                            },
                            child: Text('Contact Us')),
                      ],
                    ));
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.greenAccent,
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 47, 101, 145),
                ),
                child: Text(''),
              ),
              Divider(
                color: Colors.blueAccent,
              ),
              // Container(
              //     height: 240,
              //     width: 100,
              //     color: Colors.white,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.chat_sharp),
                  Text("${details['fullName']}"),
                ],
              ),
              Divider(
                color: Colors.blueAccent,
              ),
              Text('Equipment request'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.refresh),
                  TextButton(onPressed: () {}, child: Text('All Request')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.hide_image_rounded),
                  TextButton(onPressed: () {}, child: Text('Hiring')),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Actions',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.settings),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Settings',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.restart_alt),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LogIn();
                        }));
                      },
                      child: Text(
                        'Log out',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ],
          )),
      body: ListView(children: <Widget>[
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: 250,
                    color: Color.fromARGB(255, 183, 190, 201),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.refresh_rounded)
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text('Total Request'),
                          SizedBox(
                            width: 40,
                          ),
                          Divider(color: Colors.lightBlue),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.forward),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: 250,
                    color: Colors.blueAccent,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.refresh_rounded)
                            ],
                          ),
                          Text('Pending Request'),
                          Divider(color: Colors.lightBlue),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.forward),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: 250,
                    color: Color.fromARGB(255, 230, 215, 77),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.refresh_rounded)
                            ],
                          ),
                          Text('Assigned Request'),
                          Divider(color: Colors.lightBlue),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.forward),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: 250,
                    color: Color.fromRGBO(77, 230, 146, 1),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.refresh_rounded)
                            ],
                          ),
                          Text('Completed Request'),
                          Divider(color: Colors.lightBlue),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.forward),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: 250,
                    color: Color(0xFFF34B4B),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.refresh_rounded)
                            ],
                          ),
                          Text('Cancelled Request'),
                          Divider(color: Colors.lightBlue),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View'),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.forward),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        //Container(
        Card(
          color: Colors.lightBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //color: Colors.amberAccent,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Equipment Request'),
                  PopupMenuButton(
                    child: Center(child: Text('Weekly')),
                    itemBuilder: (context) {
                      return List.generate(1, (index) {
                        return PopupMenuItem(
                          child: Column(children: [
                            Text('Choose time range'),
                            TextButton(onPressed: () {}, child: Text('weekly')),
                            TextButton(
                                onPressed: () {}, child: Text('Monthly')),
                            TextButton(onPressed: () {}, child: Text('Yearly')),
                          ]),
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        //),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('The chart beside shows the tractor services you requested'),
            Expanded(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Request history'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Request Odered',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
            ),
          ],
        ),

        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Requests();
              }));
            },
            child: Text('Request your now')),
      ]),
    );
  }
}

class $details {}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
