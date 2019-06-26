import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/expenses_model.dart';

class ExpensesBloc {
  final _repository = Repository();
  final _expensesFetcher = PublishSubject<ExpensesModel>();

  Observable<ExpensesModel> get allExpenses => _expensesFetcher.stream;

  fetchAllExpenses() async {
    ExpensesModel itemModel = await _repository.fetchAllExpenses();
    _expensesFetcher.sink.add(itemModel);
  }

  dispose() {
    _expensesFetcher.close();
  }
}

final bloc = ExpensesBloc();