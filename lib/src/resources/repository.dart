import 'dart:async';
import 'expenses_api_provider.dart';
import '../models/expenses_model.dart';

class Repository {
  final expensesApiProvider = ExpensesApiProvider();

  Future<ExpensesModel> fetchAllExpenses(String userName) =>
      expensesApiProvider.fetchAllExpenses(userName);

  Future registerUser(String userId, String userName, String salary) =>
      expensesApiProvider.registerUser(userId, userName, salary);

  Future addExpense(String userName, Expense expense) =>
      expensesApiProvider.addExpense(userName, expense);

  Future updateExpense(String userName, Expense expense) =>
      expensesApiProvider.updateExpense(userName, expense);

  Future<Map<String, int>> fetchAllTotalExpenses(String userName) =>
      expensesApiProvider.fetchAllTotalExpenses(userName);
    
  Future<int> getTotalSalary(String userName) =>
      expensesApiProvider.getTotalSalary(userName);
}
