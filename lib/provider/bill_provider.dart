import 'package:flutter/material.dart';

class BillProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _bills = [];

  List<Map<String, dynamic>> get bills => _bills;

  void addBill(Map<String, dynamic> bill) {
    _bills.add(bill);
    notifyListeners();
  }
}
