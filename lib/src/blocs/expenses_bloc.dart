import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/expenses_model.dart';

class ExpensesBloc {
  final _repository = Repository();
  final _expensesFetcher = PublishSubject<ExpensesModel>();
  var _userId;

  Observable<ExpensesModel> get allExpenses => _expensesFetcher.stream;

  Future<Map<DateTime, List>> fetchAllExpenses() async {
    var model = await _repository.fetchAllExpenses(_userId);
    return model.expenseList();
  }

  registerUser(String userId, String userName, String salary) async {
    _userId = userId;
    await _repository.registerUser(userId, userName, salary);
  }

  addExpense(Expense expense) async {
    await _repository.addExpense(_userId, expense);
  }

  updateExpense(Expense expense) async {
    await _repository.updateExpense(_userId, expense);
  }

  Future<Map<String, int>> fetchAllTotalExpenses() async {
    return await _repository.fetchAllTotalExpenses(_userId);
  }

  Future<int> getTotalSalary() async {
    return await _repository.getTotalSalary(_userId);
  }

  dispose() {
    _expensesFetcher.close();
  }
}

final bloc = ExpensesBloc();
