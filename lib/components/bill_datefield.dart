import 'package:billminder/utils/color_pallette.dart';
import 'package:flutter/material.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:intl/intl.dart';


class BillDateField extends StatefulWidget {
  String label;
  TextEditingController controllerName;
  bool isRequired = false;


  BillDateField({
    super.key,
    required this.label,
    required this.controllerName,
    //required this.textInputAction,
    //required this.labelText,
    this.isRequired = false,
    //this.value = ''
  });

  @override
  State<BillDateField> createState() => _BillDateState();
}

class _BillDateState extends State<BillDateField> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: widget.label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black, // Adjust this if you use a different text color
              ),
              children: widget.isRequired ? [
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Asterisk color
                  ),
                ),
              ] : [],
            ),
          ),
          Container(
            // margin: const EdgeInsets.symmetric(
            //             vertical: 12.0
            //           ),
            height: ph(context, 7),
            decoration: BoxDecoration(
              color: Pallette.billminder_bill_textfield,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              //textInputAction: textInputAction,
              controller: widget.controllerName,
              decoration: const InputDecoration(
                //labelText: "Start Date",
                icon: Icon(Icons.calendar_today_rounded),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Add padding here
              ),
              onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), 
                            firstDate: DateTime(2000), 
                            lastDate: DateTime(3000),
                            );

                            if (pickeddate != null){
                              setState(() {
                                widget.controllerName.text = DateFormat("yyyy-MM-dd").format(pickeddate).toString();
                              });
                            }
                        },
                        validator: (value) {
                        if (widget.isRequired == true && (value == null || value.isEmpty)) {
                          return 'Please enter the date';
                        }
                     },
            ),
          ),
        ],
      ),
    );
  }
}
