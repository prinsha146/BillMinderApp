// home_page.dart
//import 'package:billminder/models/bill_model.dart';
//import 'package:billminder/screens/add_bill.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_pallette.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ph(context, 75.66),
      width: pw(context, 100),
      color: Pallette.billminder_secondary,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: pw(context, 4)
        ),
        child: Column(
          children: [
            SizedBox(
              height: ph(context, 2.5),
            ),
            Container(
              height: ph(context, 12),
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
                          fontSize: pw(context, 6),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("\$452",
                        style: TextStyle(
                          fontSize: pw(context, 6),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF70810)
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
