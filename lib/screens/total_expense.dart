import 'package:flutter/material.dart';
import '../src/blocs/expenses_bloc.dart';

class TotalExpense extends StatefulWidget {

  @override State<StatefulWidget> createState() => _TotalExpenseState();
  
}

class _TotalExpenseState extends State<TotalExpense> {

  var _selectedMonth;
  var _totalSalary;
  var totalSalaryController = TextEditingController();
  var amountSpentController = TextEditingController();
  var balanceController = TextEditingController();
  Map<String, int> _expensesList = new Map();

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllTotalExpenses().then((totalExpenses) => {
      setState(() {
        _expensesList = totalExpenses;
        print(_expensesList);
      })
    });
    bloc.getTotalSalary().then((salary) => {
      setState(() {
        totalSalaryController.text = "$salary";
        _totalSalary = salary;
      })
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Total Expense Incurred'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40.0, left: 30.0),
                child: Text(
                  'Your salary: ',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Container(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 65.0,
                    right: 65.0,
                  ),
                  child: TextField(
                    enabled: false,
                    controller: totalSalaryController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                  )),
              Container(
                padding: EdgeInsets.only(top: 40.0, left: 30.0),
                child: Text(
                  'Total amount spent in:',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 65.0, right: 65.0),
                child: DropdownButton<String>(
                  value: _selectedMonth,
                  items: _expensesList.keys.toList().map((String month) {
                    return new DropdownMenuItem<String>(
                      value: month,
                      child: new Text(month)
                    );
                  }).toList(),
                  hint: Text('Choose month and year'),
                  onChanged: (String value) {
                    setState(() {
                      _selectedMonth = value;
                      amountSpentController.text = "${_expensesList[_selectedMonth]}";
                      balanceController.text = '${_totalSalary - _expensesList[_selectedMonth]}';
                    });
                  },
                  )
              ),
              Container(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 80.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    enabled: false,
                    controller: amountSpentController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                  )),
              Container(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 40.0, left: 30.0),
                child: Text(
                  'Balance Left: ',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Container(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 80.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    enabled: false,
                    controller: balanceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                  )),
            ],
          ),
        ));
  }
}
