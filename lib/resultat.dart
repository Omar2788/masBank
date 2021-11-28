import 'package:flutter/material.dart';

class resultat extends StatefulWidget {
  String Total;
  String dureeValuee;
  String Apportvaluee;
  resultat({required this.Total,required this.dureeValuee,required this.Apportvaluee});

  @override
  _resultatState createState() => _resultatState(Total,dureeValuee,Apportvaluee);
}

class _resultatState extends State<resultat> {
  String Total;
  String dureeValuee;
  String Apportvaluee;

  
  _resultatState(this.Total,this.dureeValuee,this.Apportvaluee);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
        title: Text("Résultat",
        style: TextStyle(
        color: Colors.black,
    ),),
    backgroundColor: Colors.orange[200],
    ),
    body: SingleChildScrollView(
    child: Container(
    /* Text(
         "total",
         textAlign: TextAlign.center,
         textScaleFactor: 4.0,
       ),*/
    child:Column(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    ),
      Text(
        "Le Total prix est " +Total+ "DT" "  et le Apport est : " +Apportvaluee+"%""  et la durée est :" +dureeValuee+ "mois",

        textAlign: TextAlign.center,
        textScaleFactor: 2.5,
      ),
      Image(
        image: AssetImage('assets/valide.png'),
      )


    ]
    ),
    ),
    ),
    );
  }
}
