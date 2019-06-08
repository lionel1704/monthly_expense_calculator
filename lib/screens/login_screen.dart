import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Monthly Expense Calculator'),
      ),
      body: Column(
        children: <Widget>[

          Container(
              padding: EdgeInsets.only(top: 40.0, left: 30.0),
              child: Text(
                'Welcome Onboard!',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
            ),

          Container(
              padding: EdgeInsets.only(top: 40.0, left: 20.0),
              child: Text(
                'Save money by keeping check on your monthly expenses',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),

          Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Text(
                'Enter your name',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),

          Container(height: 10.0,),

          Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name. Eg.John Mayer',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                )),


          Container(height: 20.0,),

          Container(
              child: Text(
                'Enter your monthly income',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),


          Container(height: 10.0,),

          Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Monthly Income',
                        hintText: 'Enter your monthly income in Rupees',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),


          Container(height: 20.0,),

          Padding(
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
                ), onPressed: () {
            }),
          ),
        ],
      ),
    );
  }
}
