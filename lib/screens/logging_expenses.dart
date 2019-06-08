import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'dart:async';

class LoggingExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoggingExpenseState();
  }
}

class LoggingExpenseState extends State<LoggingExpense> {
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
    'Aut and Transport',
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

  DateTime date1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Logging Daily Expenses'),
        ),
        body: Padding(
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
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    Container(
                      width: 20.0,
                    ),
                    Expanded(
                        child: Container(
                      child: DateTimePickerFormField(
                        inputType: InputType.date,
                        format: DateFormat("MMMM d, yyyy (EEEE)"),
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
                          print('Selected date: $date1');
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
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Amount Spent',
                              hintText: 'Enter amount in Rs.',
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
                              'Save',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {}),
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
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
