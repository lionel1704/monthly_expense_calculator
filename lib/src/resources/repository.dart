import 'dart:async';
import 'expenses_api_provider.dart';
import '../models/expenses_model.dart';

class Repository {
  final expensesApiProvider = ExpensesApiProvider();

  Future<ExpensesModel> fetchAllExpenses() => expensesApiProvider.fetchAllExpenses();
}