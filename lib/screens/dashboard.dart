import 'package:billminder/screens/insights.dart';
import 'package:billminder/screens/login.dart';
import 'package:billminder/screens/notifications.dart';
import 'package:billminder/screens/view_bills.dart';
import 'package:billminder/utils/color_pallette.dart';
import 'package:flutter/material.dart';

import 'add_bill.dart';
import 'homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ViewBills(),
    Insights(),
    // Text(
    //   'Index 2: School',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 3: Settings',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBill(),
            )); },
        backgroundColor: Pallette.billminder_secondary_two,
        child: Icon(Icons.add),

      ),
      appBar: AppBar(
        backgroundColor: Pallette.billminder_primary,
        //title: const Text('BillMinder'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            }, 
            icon: const Icon(Icons.add_alert)
          ),
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }, 
            icon: const Icon(Icons.account_circle)
          )
        ],
        leading: MenuBar(children: [],

        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
          
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp),
            label: 'View Bills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insights'
          )
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Pallette.billminder_primary,
        selectedItemColor: Pallette.billminder_secondary_two,
        selectedLabelStyle: TextStyle(color: Pallette.billminder_secondary_two), // Style for selected labels
        onTap: _onItemTapped,
      ),
    );
  }
}
