import 'package:flutter/material.dart';

class date extends StatefulWidget {
  const date({Key? key}) : super(key: key);

  @override
  _dateState createState() => _dateState();
}

class _dateState extends State<date> {
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: date,
        firstDate: DateTime(1920),
        lastDate: DateTime(2030));
    if (picked != null && picked != date){
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Inscription",
            style: TextStyle(
              color: Colors.black,
            ),),
          backgroundColor: Colors.orange[200],
        ),
        body: Center(
          child: Column(
            children: [
              FlatButton(
                child: Text("show"),
                color: Colors.orange,
                onPressed: () {
                  selectTimePicker(context);
                },

              ),
              Text(date.day.toString()),Text(date.month.toString()), Text(date.year.toString())
            ],
          ),
        ),

      );

  }
}
