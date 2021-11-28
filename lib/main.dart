import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:masbank/form_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mas BANK',
      debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset(
              'assets/bank1.png',
          ),
          nextScreen: MyHomePage(title: '',),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.orange.shade50,
          duration: 4000,
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String value;

  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;
    bool _flag = true;
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: size.height * .4,

            decoration: BoxDecoration(
              color: Colors.orange[200],borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
              bottom: Radius.circular(30),
            ),
              /*image: DecorationImage(
                alignment: Alignment.topCenter,
                  image: AssetImage('orange.png')
              ),*/
            ),

          ),
           Column(
             children: <Widget>[
               Container(
                 height: 64,
                 child: Row(
                   children: <Widget>[
                     CircleAvatar(
                       radius: 27,
                       backgroundImage: NetworkImage('https://p7.hiclipart.com/preview/19/546/564/online-banking-finance-icon-white-bank-building.jpg'),
                       backgroundColor: Colors.transparent,
                     )
                   ],
                 ),
               ),
             ],
           ),
           /*Text(
              'MAS BANK',
              textAlign: TextAlign.center,
              style:TextStyle(
                color:Colors.black,
                fontSize: 29,
                fontWeight: FontWeight.w400,
              )
          ),*/
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Center(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.orange[50],borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.all(15),
                      width: 320.0,
                      height: 300,
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "LOGIN",
                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onChanged: (text){
                              value = text;
                            },
                            validator: (value) {
                              if (value== null || value.isEmpty) {
                                return 'Veuillez saisir un login';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "MOT DE PASSE",
                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            validator: (value) {
                              if (value== null || value.isEmpty) {
                                return 'Veuillez saisir un mot de passe';
                              }
                              return null;
                            },
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _flag ? Colors.orange[200] :Colors.orange[100],
                            ),

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FormScreen()),
                              );
                              var _formKey;
                              if (!_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              }
                            },
                            child: const Text('VALIDER'),

                          ),
                        ),
                      ],
                      ),

                    )
                ),


              ],

          ),
        ],
      ),
    );
  }
}

