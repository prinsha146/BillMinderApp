//import 'package:billminder/components/textfield.dart';
import 'package:billminder/utils/color_pallette.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../components/bill_note_textfield.dart';
import '../components/bill_textfield.dart';
//import '../models/bill_model.dart';

class AddBill extends StatefulWidget {
  AddBill({super.key});

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Bill',
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
              horizontal: pw(context, 5), vertical: pw(context,5)
            ),
            child: Column(
              children: [
                BillTextField(
                    label: 'Name',
                    controllerName: nameController,
                    textInputAction: TextInputAction.next,
                    hintText: '',
                    isRequired: true,
                ),
                BillTextField(
                    label: 'Amount',
                    controllerName: amountController,
                    textInputAction: TextInputAction.next,
                    hintText: '',
                    isRequired: true,
                ),
                
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: DropdownMenu<String>(
                      width: MediaQuery.of(context).size.width,
                      label: const Text('Frequency'),
                      initialSelection: _frequencyList.first,
                      onSelected: (String? value) {
                        setState((){
                          _frequencyValue = value!;
                        });
                      },
                      dropdownMenuEntries: _frequencyList.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
                      }).toList(),
                    ),
                  ),

                        Container(
                    height: ph(context, 7),
                    decoration: BoxDecoration(
                      color: Pallette.billminder_bill_textfield,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                        controller: startdateController,
                        decoration: const InputDecoration(
                          labelText: "Start Date",
                          icon: Icon(Icons.calendar_today_rounded),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
                        ),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), 
                            firstDate: DateTime(2000), 
                            lastDate: DateTime(3000)
                            );
                    
                            if (pickeddate != null){
                              setState(() {
                                startdateController.text = pickeddate.toString();
                              });
                            }
                        },
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the start date';
                        }
                      },
                      ),
                  ),
                 
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12.0
                      ),
                      height: ph(context, 7),
                      decoration: BoxDecoration(
                      color: Pallette.billminder_bill_textfield,
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                      controller: enddateController,
                      decoration: const InputDecoration(
                        labelText: 'End Date',
                        icon: Icon(Icons.calendar_today),
                        border: InputBorder.none,
                        //contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
                      ),
                      onTap: () async {
                        DateTime? selectedEndDate = await showDatePicker(
                          context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime(2000), 
                          lastDate: DateTime(3000));
                          if (selectedEndDate != null){
                              setState(() {
                                enddateController.text = selectedEndDate.toString();
                              });
                            }
                      }
                      ),
                    ),
                    TextFormField(
                    controller: notifyController,
                    decoration: const InputDecoration(
                      labelText: 'Notify Me At',
                      icon: Icon(Icons.calendar_today)
                    ),
                    onTap: () async {
                      DateTime? selectednotificationDate = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(2000), 
                        lastDate: DateTime(3000));
                        if (selectednotificationDate != null){
                            setState(() {
                              notifyController.text = selectednotificationDate.toString();
                            });
                          }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the notification date';
                      }
                    },
                  ),
                // BillTextField(
                //     label: 'Frequency',
                //     controllerName: frequencyController,
                //     textInputAction: TextInputAction.next,
                //     hintText: '',
                //     isRequired: true,
                // ),
                // BillTextField(
                //     label: 'Start Date',
                //     controllerName: startdateController,
                //     textInputAction: TextInputAction.next,
                //     hintText: '',
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
                //     hintText: '',
                //     isRequired: true,
                // ),
                Container(
                  height: ph(context, 15),
                  child: BillNotesTextField(
                    label: 'Add Note',
                    controllerName: noteController,
                    textInputAction: TextInputAction.done,
                    hintText: '',
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
                            offset: Offset(0, 2), // changes position of shadow
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
      ),
    );
  }
}