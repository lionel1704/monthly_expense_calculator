import 'package:flutter/material.dart';

class TotalExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    left: 80.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                  )),
              Container(
                padding: EdgeInsets.only(top: 40.0, left: 30.0),
                child: Text(
                  'Total amount spent so far this month: ',
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
