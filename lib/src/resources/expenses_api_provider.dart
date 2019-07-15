import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monthly_expense_calculator/src/models/expenses_model.dart';

class ExpensesApiProvider {
  Future<ExpensesModel> fetchAllExpenses(String userName) async {
    var doc = await Firestore.instance
        .collection("user_expenses")
        .document(userName)
        .collection("expenses")
        .getDocuments();
    List<Expense> expenses = List();
    Expense expense;
    doc.documents.forEach((document) =>
        {expense = Expense(document.data), expenses.add(expense)});
    return ExpensesModel(expenses);
  }

  Future registerUser(String userName) async {
    Firestore.instance
        .collection("user_expenses")
        .document(userName)
        .setData({}, merge: true);
  }

  Future addExpense(String userName, Expense expense) async {
    Firestore.instance
        .collection("user_expenses")
        .document(userName)
        .collection("expenses")
        .add({
      "amount": expense.amount,
      "date": expense.date,
      "category": expense.category
    });
  }
}
