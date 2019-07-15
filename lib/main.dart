import 'package:flutter/material.dart';
import 'package:monthly_expense_calculator/src/calendar_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:monthly_expense_calculator/src/resources/repository.dart';
import 'package:monthly_expense_calculator/screens/login_screen.dart';
import 'package:monthly_expense_calculator/screens/total_expense.dart';
import 'package:monthly_expense_calculator/screens/logging_expenses.dart';
import 'package:monthly_expense_calculator/charts/chart.dart';
import 'src/app.dart';

void main() {
//  initializeDateFormatting().then((_) => runApp(CalendarApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Monthly Expense Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
          body: WelcomeScreen(),
        ));
  }
}
