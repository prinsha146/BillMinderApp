import 'package:billminder/screens/edit_bill.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/material.dart';
import '../utils/color_pallette.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallette.billminder_primary,
        title: const Text('Notifications'),
      ),
      body: Container(
      //height: ph(context, 75.66),
      width: pw(context, 100),
      color: Pallette.billminder_secondary,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: pw(context, 4),
            vertical: ph(context, 1)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Container(
            //   child: Text("Notifications",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: pw(context, 5)
            //     ),
            //   ),
            // ),
            Container(
              height: ph(context, 72),
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: ph(context, 1.5)
                    ),
                    height: ph(context, 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Pallette.billminder_bill_tiles
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("    Rent",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: pw(context, 6),
                              fontWeight: FontWeight.bold,
                              
                            ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("You have \$250 due on 01/05/2024.",
                              style: TextStyle(
                                fontSize: pw(context, 5)
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  );
                }),
            )


          ],
        ),

      ),
    )
    );
     
  }
}
