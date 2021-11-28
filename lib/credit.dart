import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masbank/main.dart';
import 'package:masbank/resultat.dart';
import 'dart:math';

import 'package:masbank/resultatEchec.dart';
class credit extends StatefulWidget {
String value;

credit({required this.value});
  @override
  _creditState createState() => _creditState(value);
}

class _creditState extends State<credit> {
 late String Apportvaluee;
 late String dureeValuee;
 late String _Apportvalue;
 late String _dureeValue;
  late String _prixTotal;
 /* late String _Apportvalue;
  late String _dureeValue;*/
  String value;
  String dropdownValue = '12Mois';
  String dropdownValueCredit = 'Maison';
  String dropdownValueApport = '5%';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _creditState(this.value);
  @override
  Widget build(BuildContext context) {
    String Total;
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
        title: Text("Demande de Crédit",
        style: TextStyle(
        color: Colors.black,
    ),),
    backgroundColor: Colors.orange[200],
    ),
     body: SingleChildScrollView(
       child: Container(
      /* Text(
         "Hi",
         textAlign: TextAlign.center,
         textScaleFactor: 4.0,
       ),*/
       child:Column(
         children: <Widget>[
           const Padding(
             padding: EdgeInsets.symmetric(vertical: 20.0),
           ),
       Text('Votre Salaire :  '+value+"DT",
         textAlign: TextAlign.center,
         style: TextStyle(fontSize: 20),
       ),
           const Padding(
             padding: EdgeInsets.symmetric(vertical: 20.0),
           ),
           Text('Type Crédit  :',
             style: TextStyle(fontWeight: FontWeight.bold),),
           DropdownButton<String>(
             value: dropdownValueCredit,
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
                 dropdownValueCredit = newValue!;
               });
             },
             items: <String>['Maison', 'Voiture']
                 .map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value),
               );
             }).toList(),
           ),
           const Padding(
             padding: EdgeInsets.symmetric(vertical: 20.0),
           ),

           Text('Duré de remboursement  :',
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
    items: <String>['12Mois', '24Mois', '38Mois', '48Mois','92Mois']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    ),
           ///////////////////////////////////////////////////////////////////////
           TextFormField(
             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
             decoration: InputDecoration(labelText: 'la duréé en mois :'),
             keyboardType: TextInputType.number,
             maxLength: 3,
             onChanged: (text){
               dureeValuee = text;
             },
             validator: ( value) {
               if (value== null || value.isEmpty) {
                 return 'Veuillez saisir la durée';
               }

               return null;
             },
             /*onSaved: (String value) {
            _prix = value;
          },*/
           ),
//////////////////////////////////////////////////////////////////////////////////////
           TextFormField(
             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
             decoration: InputDecoration(labelText: 'TOTAL PRIX'),
             keyboardType: TextInputType.number,
             maxLength: 6,
             onChanged: (text){
               value = text;
             },
             validator: ( value) {
               if (value== null || value.isEmpty) {
                 return 'Veuillez saisir le Prix total';
               }

               return null;
             },
              /*onSaved: (String value) {
            _prix = value;
          },*/
           ),
           Text('Apport  :',
             style: TextStyle(fontWeight: FontWeight.bold),),
           DropdownButton<String>(  //Apport
             value: dropdownValueApport,
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
                 dropdownValueApport = newValue!;
               });
             },
             items: <String>['5%', '7%', '9%', '12%','15%']
                 .map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value),
               );
             }).toList(),
           ),
           /////////////////////////////////////////////////////////////////////
           TextFormField(
             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
             decoration: InputDecoration(labelText: 'Apport'),
             keyboardType: TextInputType.number,
             maxLength: 2,
             onChanged: (text){
               Apportvaluee = text;
             },
             validator: ( value) {
               if (value== null || value.isEmpty) {
                 return 'Veuillez saisir le apport';
               }else if(int.parse(value)>15 ){
                 return 'l`apport maximale est 15%';
               }else if(int.parse(value)<5 ){
                 return 'l`apport minimale est 5%';
               }

               return null;
             },
             /*onSaved: (String value) {
            _prix = value;
          },*/
           ),
          ////////////////////////////////////////////////////////////////////////////
          /* Text('la somme :'++'',
             style: TextStyle(fontWeight: FontWeight.bold),),*/
           const Padding(
             padding: EdgeInsets.symmetric(vertical: 20.0),
           ),
           RaisedButton(
             color: Colors.orange[200],
             child: Text(
               'Calculer',
               style: TextStyle(color: Colors.black, fontSize: 16),
             ),
             onPressed: () {
               double res = (double.parse(value)-(double.parse(Apportvaluee)/100))/double.parse(dureeValuee);
               if(res <2000){
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => resultat(Total: value, dureeValuee: dureeValuee, Apportvaluee: Apportvaluee,)),
               );
               }else{
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => resultatEchec(Total: value, dureeValuee: dureeValuee, Apportvaluee: Apportvaluee,)),
                 );
               }

             /*  );
 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => resultat(Total: value, dureeValuee: dureeValuee, Apportvaluee: Apportvaluee,)),
               );*/
               _formKey.currentState!.save();
               print(_prixTotal);
               print(_Apportvalue);
               print(_dureeValue);
               //Send to API
             },
           )
         ],
       ),
    ),
     ),
    );
  }
}
