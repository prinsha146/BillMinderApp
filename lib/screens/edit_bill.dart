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
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  TextEditingController notifyController = TextEditingController();
  TextEditingController noteController = TextEditingController();

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
                BillTextField(
                    label: 'Frequency',
                    controllerName: frequencyController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Weekly',
                    isRequired: true,
                ),
                BillTextField(
                    label: 'Start Date',
                    controllerName: startdateController,
                    textInputAction: TextInputAction.next,
                    hintText: '25/02/2024',
                    isRequired: true,
                ),
                BillTextField(
                    label: 'End Date',
                    controllerName: enddateController,
                    textInputAction: TextInputAction.next,
                    hintText: '',
                ),
                BillTextField(
                    label: 'Notify Me At',
                    controllerName: notifyController,
                    textInputAction: TextInputAction.next,
                    hintText: '24/05/2024',
                    isRequired: true,
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
      )
    );
  } 
}