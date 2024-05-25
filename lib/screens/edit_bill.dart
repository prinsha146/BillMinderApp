import 'package:billminder/components/bill_datefield.dart';
import 'package:billminder/components/bill_note_textfield.dart';
import 'package:billminder/components/bill_textfield.dart';
import 'package:flutter/material.dart';
//import 'package:billminder/components/textfield.dart';
import 'package:billminder/utils/color_pallette.dart';
import 'package:billminder/utils/size_utils.dart';

class EditBill extends StatefulWidget {
  EditBill({super.key});

  @override
  State<EditBill> createState() => _EditBillState();
}

class _EditBillState extends State<EditBill> {
  TextEditingController nameController = TextEditingController(text: 'Rent');
  TextEditingController amountController = TextEditingController(text: '250');
  TextEditingController frequencyController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  TextEditingController notifyController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final List<String> _frequencyList = [
      'Weekly',
      'Fortnightly',
      'Monthly',
      'Quaterly'
  ];

    String _frequencyValue = 'Weekly';
    DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate)
      {
        setState(() {
          selectedDate = picked;
        });
      }
        
    }

  void _submitData(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bill',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
      ),
      backgroundColor: Pallette.billminder_primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: ph(context, 90),
          color: Pallette.billminder_secondary,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: pw(context, 5)
            ),
            child: Column(
              children: [
                BillTextField(
                    label: 'Name',
                    controllerName: nameController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Rent',
                    isRequired: true
                ),
                BillTextField(
                    label: 'Amount',
                    controllerName: amountController,
                    textInputAction: TextInputAction.next,
                    hintText: '200',
                    isRequired: true,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Frequency',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // Adjust this if you use a different text color
                          ),
                          children: [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red, // Asterisk color
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                        color: Pallette.billminder_bill_textfield,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownMenu<String>(
                        //width: MediaQuery.of(context).size.width,
                        initialSelection: _frequencyList.first,
                        enableSearch: false,
                        onSelected: (String? value) {
                          FocusScope.of(context).unfocus();
                          setState((){
                            _frequencyValue = value!;
                          });
                        },
                        width: MediaQuery.of(context).size.height,
                        inputDecorationTheme: const InputDecorationTheme(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
                        ),
                        dropdownMenuEntries: _frequencyList.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                        leadingIcon: const Icon(
                          Icons.arrow_drop_down,
                          ),
                      ),
                      )
                    ],
                  ),
                ),
                // BillTextField(
                //     label: 'Frequency',
                //     controllerName: frequencyController,
                //     textInputAction: TextInputAction.next,
                //     hintText: 'Weekly',
                //     isRequired: true,
                // ),
                // BillTextField(
                //     label: 'Start Date',
                //     controllerName: startdateController,
                //     textInputAction: TextInputAction.next,
                //     hintText: '25/02/2024',
                //     isRequired: true,
                // ),
                // BillTextField(
                //     label: 'End Date',
                //     controllerName: enddateController,
                //     textInputAction: TextInputAction.next,
                //     hintText: '',
                // ),
                // BillTextField(
                //     label: 'Notify Me At',
                //     controllerName: notifyController,
                //     textInputAction: TextInputAction.next,
                //     hintText: '24/05/2024',
                //     isRequired: true,
                // ),
                BillDateField(
                  label: 'Start Date',
                  controllerName: startdateController,
                  isRequired: true,
                ),
                SizedBox(height: 10),
                BillDateField(
                  label: 'End Date', 
                  controllerName: enddateController
                ),

                 BillDateField(
                  label: 'Notification Date', 
                  controllerName: notifyController
                ),
                Container(
                  height: ph(context, 15),
                  child: BillNotesTextField(
                    label: 'Add Note',
                    controllerName: noteController,
                    textInputAction: TextInputAction.done,
                    hintText: 'Please pay on time.',
                  ),
                ),
                InkWell(
                  onTap: () {
                    _submitData();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: ph(context, 2)
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: pw(context, 20),
                      height: ph(context, 4.5),
                      decoration: BoxDecoration(
                        color: Pallette.billminder_secondary_two,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  } 
}