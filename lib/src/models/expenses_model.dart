import 'package:flutter/foundation.dart';
import 'package:monthly_expense_calculator/src/blocs/expenses_bloc.dart';

class ExpensesModel {
  int _total_expenses;

  List<Expense> _expenses = [];

  ExpensesModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['expenses'].length);
    _total_expenses = parsedJson['expenses'].length;
    List<Expense> temp = new List();
    for (int i = 0; i < parsedJson['expenses'].length; i++) {
      Expense expense = Expense(parsedJson['expenses'][i]);
      temp.add(expense);
    }
    _expenses = temp;
  }

  ExpensesModel(List<Expense> expenses) {
    _expenses = expenses;
    _total_expenses = expenses.length;
  }

  List<Expense> get expenses => _expenses;

  Map<DateTime, List> expenseList() {
    Map<DateTime, List> temp = new Map();
    DateTime date;
    _expenses.forEach((expense) => {
          date = DateTime.parse(expense._date),
          if (temp.containsKey(date))
            {temp[date].add("Rs. ${expense._amount} - ${expense._category}")}
          else
            {temp[date] = ["Rs. ${expense._amount} - ${expense._category}"]}
        });
    return temp;
  }

  int get total_expenses => _total_expenses;
}

class Expense {
  String _category;
  String _date;
  int _amount;

  Expense.fromData(String category, String date, int amt) {
    _category = category;
    _date = date;
    _amount = amt;
  }

  Expense(expense) {
    _category = expense['category'];
    _date = expense['date'];
    _amount = expense['amount'];
  }

  String get category => _category;

  String get date => _date;

  int get amount => _amount;
}
