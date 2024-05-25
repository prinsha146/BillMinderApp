// home_page.dart
//import 'package:billminder/models/bill_model.dart';
//import 'package:billminder/screens/add_bill.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/color_pallette.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState((){
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: ph(context, 90),
      height: MediaQuery.of(context).size.height * 1.0,
      width: pw(context, 100),
      color: Pallette.billminder_secondary,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: pw(context, 4)
        ),
        child: Column(
          children: [
            SizedBox(
              height: ph(context, 2.5)
            ),
            Container(
              //height: ph(context, 15),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Pallette.billminder_bill_tiles
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Upcoming Bills",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: pw(context, 6)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("3 Bills",
                        style: TextStyle(
                          fontSize: pw(context, 5),
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text("\$452",
                        style: TextStyle(
                          fontSize: pw(context, 5),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF70810)
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: pw(context, 4)
                  ),
                  child: TableCalendar(
                    rowHeight: 43,
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true
                        ),
                    // calendarStyle: CalendarStyle(
                    //   defaultDecoration: BoxDecoration(
                    //     color: Colors.white,
                    //     //borderRadius: BorderRadius.circular(2)
                    //   )
                    // ),
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 10, 16),
                    onDaySelected: _onDaySelected,
                  ),
                )
              ],
            )
          ],
        ),

      ),
    );
  }
}
