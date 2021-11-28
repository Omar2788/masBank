import 'package:flutter/material.dart';
class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  _inscriptionState createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  late String value;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[50],
        body: Stack(
            children: <Widget>[
              Container(
                height: size.height * .2,
                decoration: BoxDecoration(
                  color: Colors.orange[200],borderRadius: BorderRadius.vertical(
                  top: Radius.circular(0),
                  bottom: Radius.circular(30),
                ),
                ),

                child: Form(
                  key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Inscription',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "NOM",
                    ),
                    onChanged: (text){
                      value = text;
                    },
                    validator: ( value) {
                      if (value== null || value.isEmpty) {
                        return 'Veuillez saisir votre login';
                      }
                      return null;
                    },
                  ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "PRENOM",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir votre prenom';
                        }
                        return null;
                      },
                    ),

                  ],
                ),
              ),
              ),
            ]
        ),


    );
  }
}
