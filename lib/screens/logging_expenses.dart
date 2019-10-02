import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../src/models/expenses_model.dart';
import '../src/blocs/expenses_bloc.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:monthly_expense_calculator/screens/total_expense.dart';
import 'dart:async';
import 'package:monthly_expense_calculator/src/calendar_app.dart';

class LoggingExpense extends StatefulWidget {
  final Expense userExpense;

  LoggingExpense({this.userExpense});

  @override
  State<StatefulWidget> createState() {
    return LoggingExpenseState();
  }
}

double totalAmount = 0;

class LoggingExpenseState extends State<LoggingExpense> {
  var _formKey = GlobalKey<FormState>();
  final amtController = TextEditingController();

  var _expenseType = [
    'Entertainment',
    'Education',
    'Personal Care',
    'Health',
    'Fitness',
    'Kids',
    'Food & Dining',
    'Gifts & Donations',
    'Investment',
    'Bills & Utilities',
    'Auto and Transport',
    'Taxes',
    'Travel',
    'Clothing',
    'Miscellaneous',
    'Household',
    'Groceries',
    'Bill Payments',
    'Electronics',
    'Shopping',
    'Vacations',
    'Loan',
    'EMI',
    'Others'
  ];
  var _currentItemSelected = 'Others';
  var buttonText = 'Save';

  DateTime date1;

  @override
  Widget build(BuildContext context) {
    var amt = widget.userExpense?.amount ?? -1;
    if (amt > 0) {
      amtController.text = "$amt";
      _currentItemSelected = widget.userExpense.category;
      date1 = DateTime.parse(widget.userExpense.date);
      buttonText = 'Update';
    }
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text('Logging Daily Expenses'),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              'Expense Type : ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: _expenseType.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            // Your code to execute, when a menu item is selected from drop down
                            _onDropDownItemSelected(newValueSelected);
                          },
                          value: _currentItemSelected,
                        ))
                      ],
                    ),
                    Container(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Date : ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ),
                        Container(
                          width: 20.0,
                        ),
                        Expanded(
                            child: Container(
                          child: DateTimePickerFormField(
                            initialValue: date1,
                            inputType: InputType.date,
                            format: DateFormat("dd-MM-yyyy"),
                            editable: false,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.blue,
                                  size: 28.0,
                                ),
                                suffixIcon: Icon(
                                  Icons.calendar_view_day,
                                  color: Colors.blue,
                                  size: 28.0,
                                ),
                                labelText: 'Select the Date',
                                hasFloatingPlaceholder: false),
                            onChanged: (dt) {
                              setState(() => date1 = dt);
                            },
                          ),
                        ))
                      ],
                    ),
                    Container(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              'Amount Spent : ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              controller: amtController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Amount cannot be 0';
                                }
                                if (value.contains('-')) {
                                  return 'Amount cannot be negative';
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Amount Spent',
                                  hintText: 'Enter amount in Rs.',
                                  errorStyle: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: RaisedButton(
                                color: Colors.deepPurple,
                                elevation: 6.0,
                                child: Text(
                                  buttonText,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   calculateTotalAmountSpent();
                                  // });
                                  if (_formKey.currentState.validate()) {
                                    var expense = Expense.fromData(
                                        _currentItemSelected,
                                        new DateFormat("yyyyMMdd")
                                            .format(date1),
                                        int.parse(amtController.text));
                                    if (amt < 0) {
                                      bloc.addExpense(expense);
                                    } else {
                                      var updatedExpense = Expense.newExpense(
                                          expense, widget.userExpense.id);
                                      bloc.updateExpense(updatedExpense);
                                    }
                                    Navigator.pop(context);
                                  }
                                }),
                          ),
                        ),
                        Container(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            child: RaisedButton(
                                color: Colors.deepPurple,
                                elevation: 6.0,
                                child: Text(
                                  'Discard',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String calculateTotalAmountSpent() {
    double amount = double.parse(amtController.text);
    totalAmount = totalAmount + amount;
    debugPrint("The total amount spent is $totalAmount");
    return '$totalAmount';
  }
}
