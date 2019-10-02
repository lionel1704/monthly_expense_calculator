import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monthly_expense_calculator/src/models/expenses_model.dart';

class ExpensesApiProvider {
  Future<ExpensesModel> fetchAllExpenses(String userId) async {
    var doc = await Firestore.instance
        .collection("user_expenses")
        .document(userId)
        .collection("expenses")
        .getDocuments();
    List<Expense> expenses = List();
    Expense expense;
    doc.documents.forEach((document) => {
          expense = Expense(document.data, document.documentID),
          expenses.add(expense)
        });
    return ExpensesModel(expenses);
  }

  Future registerUser(String userId, String userName, String salary) async {
    Firestore.instance.collection("user_expenses").document(userId).setData({
      "name": userName,
      "salary": salary,
    }, merge: true);
  }

  Future addExpense(String userId, Expense expense) async {
    Firestore.instance
        .collection("user_expenses")
        .document(userId)
        .collection("expenses")
        .add({
      "amount": expense.amount,
      "date": expense.date,
      "category": expense.category
    });

    Firestore.instance
        .collection("user_expenses")
        .document(userId)
        .setData({}, merge: true);
  }

  Future updateExpense(String userName, Expense expense) async {
    Firestore.instance
        .collection("user_expenses")
        .document(userName)
        .collection("expenses")
        .document(expense.id)
        .setData({
      "amount": expense.amount,
      "date": expense.date,
      "category": expense.category
    });
  }
}
