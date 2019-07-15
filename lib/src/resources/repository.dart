import 'dart:async';
import 'expenses_api_provider.dart';
import '../models/expenses_model.dart';

class Repository {
  final expensesApiProvider = ExpensesApiProvider();

  Future<ExpensesModel> fetchAllExpenses(String userName) =>
      expensesApiProvider.fetchAllExpenses(userName);

  Future registerUser(String userName) =>
      expensesApiProvider.registerUser(userName);

  Future addExpense(String userName, Expense expense) =>
      expensesApiProvider.addExpense(userName, expense);
}
