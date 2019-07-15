import 'package:flutter/material.dart';
import 'package:monthly_expense_calculator/src/calendar_app.dart';
import '../src/blocs/expenses_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  var _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Monthly Expense Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 40.0, left: 30.0),
                child: Text(
                  'Welcome Onboard!',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 40.0, left: 20.0),
                child: Text(
                  'Save money by keeping check on your monthly expenses',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  'Enter your name',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                ),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Center(
                child: Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Name field cannot be empty';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name. Eg.John Mayer',
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ))),
            Container(
              height: 20.0,
            ),
            Center(
              child: Container(
                child: Text(
                  'Enter your monthly income',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                ),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Monthly income value cannot be empty';
                      }
                      if (value.contains('-')) {
                        return 'Monthly income value cannot be negative';
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Monthly Income',
                        hintText: 'Enter your monthly income in Rupees',
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),
            ),
            Container(
              height: 20.0,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 6.0,
                    child: Text(
                      'Track Monthly Expense',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      bloc.registerUser(nameController.text);
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CalendarApp();
                          }));
                        }
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    super.dispose();
  }
}
