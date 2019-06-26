import 'package:flutter/foundation.dart';

class ExpensesModel {
  int _total_expenses;

  List<_Expense> _expenses = [];

  ExpensesModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['expenses'].length);
    _total_expenses = parsedJson['expenses'].length;
    List<_Expense> temp = [];
    for (int i = 0; i < parsedJson['expenses'].length; i++) {
      _Expense expense = _Expense(parsedJson['expenses'][i]);
      temp.add(expense);
    }
    _expenses = temp;
  }

  List<_Expense> get expenses => _expenses;

  int get total_expenses => _total_expenses;
}

class _Expense {
  String _category;
  String _description;
  int _amount;

  _Expense(expense) {
    _category = expense['category'];
    _description = expense['description'];
    _amount = expense['amount'];
  }

  String get category => _category;

  String get description => _description;

  int get amount => _amount;
}