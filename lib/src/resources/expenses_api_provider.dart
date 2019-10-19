import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monthly_expense_calculator/src/models/expenses_model.dart';
// import 'package:date_utils/date_utils.dart';

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
    await Firestore.instance.collection("user_expenses").document(userId).setData({
      "name": userName,
      "salary": salary,
    }, merge: true);
  }

  Future addExpense(String userId, Expense expense) async {
    await Firestore.instance
        .collection("user_expenses")
        .document(userId)
        .collection("expenses")
        .add({
      "amount": expense.amount,
      "date": expense.date,
      "category": expense.category
    });

    var expenseDate = DateTime.parse(expense.date);
    var monthId = "${expenseDate.month}-${expenseDate.year}";

    var monthsExpense = await Firestore.instance
        .collection("user_expenses")
        .document(userId)
        .collection("monthlyTotal")
        .document(monthId).get();

    var data = monthsExpense.data ?? { "total_expense" : 0 } ;
    var new_total = data["total_expense"] + expense.amount;


    await Firestore.instance.collection("user_expenses").document(userId).collection("monthlyTotal").document(monthId).setData({
      "total_expense": new_total
    }, merge: true);
    
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

  Future<Map<String,int>> fetchAllTotalExpenses(String userName) async {
    var documents = await Firestore.instance
      .collection("user_expenses")
      .document(userName)
      .collection("monthlyTotal")
      .getDocuments();

    var monthlyTotals = Map<String, int>();

    documents.documents.forEach((document) => {
      monthlyTotals[document.documentID] = document.data["total_expense"]
    });

    print("Totals: $monthlyTotals");

    return monthlyTotals;
      
  }

  Future<int> getTotalSalary(String userName) async {
    var document = await Firestore.instance
        .collection("user_expenses")
        .document(userName)
        .get();
    return int.parse(document.data["salary"]);
  }
}
