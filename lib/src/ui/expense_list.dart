import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expenses_model.dart';
import '../blocs/expenses_bloc.dart';

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllExpenses();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lionel's Expenses"),
      ),
      body: StreamBuilder(
        stream: bloc.allExpenses,
        builder: (context, AsyncSnapshot<ExpensesModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ExpensesModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.expenses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(snapshot.data.expenses[index].category),
          subtitle: Text("Rs. ${snapshot.data.expenses[index].amount}"),
          trailing: Text("${snapshot.data.expenses[index].date}"),
        );
      },
    );
  }
}
