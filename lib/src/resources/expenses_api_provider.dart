import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monthly_expense_calculator/src/models/expenses_model.dart';

class ExpensesApiProvider {
  Future<ExpensesModel> fetchAllExpenses() async {
    var doc = await Firestore.instance.collection("user_expenses").document("lionelfaber").get();
    return ExpensesModel.fromJson(doc.data);
  }
}