import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/expenses_model.dart';

class ExpensesBloc {
  final _repository = Repository();
  final _expensesFetcher = PublishSubject<ExpensesModel>();
  var _userName;

  Observable<ExpensesModel> get allExpenses => _expensesFetcher.stream;

  Future<Map<DateTime, List>> fetchAllExpenses() async {
    var model = await _repository.fetchAllExpenses(_userName);
    return model.expenseList();
  }

  registerUser(String userName) async {
    _userName = userName;
    await _repository.registerUser(userName);
  }

  addExpense(Expense expense) async {
    await _repository.addExpense(_userName, expense);
  }

  dispose() {
    _expensesFetcher.close();
  }
}

final bloc = ExpensesBloc();
