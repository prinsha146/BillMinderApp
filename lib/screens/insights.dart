import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color_pallette.dart';
import 'package:billminder/utils/size_utils.dart';


class Insights extends StatefulWidget{
  const Insights({super.key});

  @override
  _InsightsState createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {

  final List<Tab> _homeScreenTabs = const <Tab>[
    Tab(text: 'Tab1', icon: Icon(Icons.camera)),
    Tab(text: 'Tab2', icon: Icon(Icons.camera)),
    Tab(text: 'Tab3', icon: Icon(Icons.camera)),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'msc',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              padding: EdgeInsets.only(left: 25, bottom: 10),
              color: Pallette.billminder_secondary_two,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                   Expanded(child: Container()),
                     const TabBar(
                      indicatorColor: Color(0xff404040),
                      tabs: [ 
                        Text("Weekly",
                        
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        )
                        ),
                        Text("Monthly",
                        
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        )
                        ),  
                        Text("Yearly",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        )
                        )],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body:  Container(
            color: Pallette.billminder_secondary,
            child: TabBarView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                height: pw(context, 120),
                width: pw(context, 180),
                child: ClipRRect(
                  child: Image.asset('assets/icons/weekly.png'),
                ),
              )
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                height: pw(context, 90),
                width: pw(context, 120),
                
                child: ClipRRect(
                  child: Image.asset('assets/icons/monthly.png',
                  fit: BoxFit.cover,
                  ),
                ),
              )
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                height: pw(context, 90),
                width: pw(context, 120),
                
                child: ClipRRect(
                  child: Image.asset('assets/icons/monthly.png'),
                ),
              )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  }

    // return DefaultTabController(
    //   length: 3, 
    //   child: Container(
    //   height: MediaQuery.of(context).size.height * 1.0,
    //   width: pw(context, 100),
    //   color: Pallette.billminder_secondary,
    //   child: Container(
    //     margin: EdgeInsets.symmetric( horizontal: pw(context, 4)),
    //     child: const Column(
    //       children: [
    //         const SizedBox(height: 60,),
    //         TabBar(
    //           tabs: [
    //             Tab(text: 'Weekly',),
    //             Tab(text: 'Monthly',),
    //             Tab(text: 'Yearly')
    //           ]),
    //           Expanded(
    //             child: TabBarView(
    //               //controller: _tabController,
    //             children: [
    //               Text('weekly'),
    //               Text('Monthly'),
    //               Text('Yearly')
    //             ]
    //           )
    //             )
    //       ],
    //     ),
          
    //   ),
    // )
    //   );
  //}
//}