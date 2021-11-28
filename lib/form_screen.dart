import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masbank/credit.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String dropdownValue = 'Maitre';  //grade
  late String _name;
  late String _prenom;
  late String _cin;
  late String _date;
  late String _email;
  late String _salaire;
  late String _url;
  late String _phoneNumber;
  late String _Experience;
  late String value;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: date,
        firstDate: DateTime(1920),
        lastDate: DateTime(2030),
    );
    if (picked != null && picked != date){
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nom'),
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre Nom ';
        }

        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }
  Widget _buildPrenom() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Prénom'),
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre Prénom ';
        }

        return null;
      },
      onSaved: (value) {
        _prenom = value!;
      },
    );
  }
  Widget _buildCin() {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(labelText: 'CIN'),
      maxLength: 8,
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre CIN  ';
        }else if(value.length<8){
          return 'Veuillez saisir un CIN valide';
        }

        return null;
      },
      onSaved: (value) {
        _cin= value!;
      },
    );
  }/*
  Widget _buildDate() {
    return TextFormField(
        child: ElevatedButton(
          child: Text("show"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => date()),
            );
          },

        ),


    );
  }*/

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: ( value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre E-mail';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Veuillez saisir un adresse valide';
        }

        return null;
      },
     /* onSaved: ( value) {
        _email = value;
      },*/
    );
  }

  Widget _buildSalaire() {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(labelText: 'Salaire'),
      keyboardType: TextInputType.number,
      maxLength: 4,
      onChanged: (text){
        value = text;
      },
      validator: ( value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre Salaire ';
        }else if(int.parse(value)> 3000){
          return 'Veuillez saisir un Numéro de Téléphone valide';
        }

        return null;
      },
     /* onSaved: (String value) {
        _password = value;
      },*/
    );
  }
/*
  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: ( value) {
        if (value== null || value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }*/

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 8,
      validator: ( value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre Numéro de Téléphone';
        }else if(value.length<8){
          return 'Veuillez saisir un Numéro de Téléphone valide';
        }

        return null;
      },
      onSaved: (value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildExperience() {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(labelText: 'Année d`expérience'),
      keyboardType: TextInputType.number,
      maxLength: 2,
      validator: ( value) {
        if (value== null || value.isEmpty) {
          return 'Veuillez saisir votre Année d`expérience';
        }

        return null;
      },
      /* onSaved: (String value) {
        _password = value;
      },*/
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
          title: Text("Inscription",
            style: TextStyle(
            color: Colors.black,
          ),),
        backgroundColor: Colors.orange[200],
      ),
      body: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildPrenom(),
                _buildCin(),
                RaisedButton(color: Colors.orange[50],
                  onPressed: () {
                    selectTimePicker(context);
                },
                  child: Text("Date de Naissance"),),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
               Text(date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString()),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                Text('Grade  :',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 20,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                  height: 3,
                  color: Colors.orange[200],
                  ),
                  onChanged: (String? newValue) {
                  setState(() {
                  dropdownValue = newValue!;
                  });
                  },
                  items: <String>['Maitre', 'Ingenitre', 'Technicien']
                      .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
                  }).toList(),
                  ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                _buildEmail(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                _buildPhoneNumber(),
                _buildSalaire(),
                _buildExperience(),
               //_builURL(),

              //  _buildCalories(),
                SizedBox(height: 50),
                RaisedButton(
                  color: Colors.orange[200],
                  child: Text(
                    'Inscrir',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }else Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => credit(value: value)),
                    );


                    _formKey.currentState!.save();

                    print(_name);
                    print(_prenom);
                    print(_cin);
                    print(_date);
                    print(_email);
                    print(_phoneNumber);
                    print(_url);
                    print(_salaire);
                    print(_Experience);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}