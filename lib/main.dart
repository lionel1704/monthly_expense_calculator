import 'package:flutter/material.dart';
import 'package:monthly_expense_calculator/screens/login_screen.dart';
import 'package:monthly_expense_calculator/screens/total_expense.dart';
import 'package:monthly_expense_calculator/screens/logging_expenses.dart';
import 'package:monthly_expense_calculator/charts/chart.dart';
import 'package:monthly_expense_calculator/calendar/flutter_calendar_carousel.dart';

void main() {
  runApp(MyApp()
 );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monthly Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: Scaffold(
        body: HomePage(),
      )
    );
  }
}