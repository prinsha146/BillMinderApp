import 'package:billminder/screens/edit_bill.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../utils/color_pallette.dart';

class ViewBills extends StatefulWidget {
  const ViewBills({super.key});

  @override
  State<ViewBills> createState() => _ViewBillsState();
}

class _ViewBillsState extends State<ViewBills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ph(context, 75.66),
      width: pw(context, 100),
      color: Pallette.billminder_secondary,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: pw(context, 4),
            vertical: ph(context, 1)
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Container(
            //   child: Text("Bills",
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Rent",
                            style: TextStyle(
                              fontSize: pw(context, 6),
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditBill())
                                    );
                                  },
                                  icon: const Icon(Icons.edit)
                                ),
                                IconButton(
                                  onPressed: () {
                                    //
                                  }, 
                                  icon: const Icon(Icons.share)
                                ),
                                IconButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Delete Bill'),
                                      content: const Text('Are you sure you want to delete this bill?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                          ), 
                                        TextButton(
                                           onPressed: () => Navigator.pop(context, 'Ok'),
                                          child: const Text('OK')
                                          )
                                      ]
                                    )
                                  ), 
                                  icon: const Icon(Icons.delete, color: Colors.red,)
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Weekly",
                              style: TextStyle(
                                fontSize: pw(context, 5)
                              ),
                            ),
                            Text("\$120",
                              style: TextStyle(
                                color: Colors.red,
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
    );
  }
}
