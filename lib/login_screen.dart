import 'package:devote_app/services.dart';
import 'package:devote_app/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:devote_app/candiate_grid.dart';
import 'package:devote_app/card.dart';
import 'package:flutter/services.dart';

/// This class defines the custom cards to be displayed on the screen

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();

  final emailController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0, right: 00.0, left: 100.0, bottom: 20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomCard(
                      width: 500.0,
                      height: 600.0,
                      corner: Icon(
                            Icons.lock,
                            color: Colors.black,
                            size: 30.0,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(56.0),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text(
                              'VALIDATE YOURSELF',
                              style: TextStyle(
                                color: Color(0xFF0A3A7F),
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 80.0),

                            Column(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Text(
                                      'ROLL NO.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                      ),
                                    ),

                                    SizedBox(height: 4.0),

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                      ),
                                      child: TextField(
                                        controller: idController,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'eg. 16CS78',
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(height: 16.0,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Text(
                                      'EMAIL',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                      ),
                                    ),

                                    SizedBox(height: 4.0),

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: TextField(
                                        controller: emailController,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'eg. idrees@bookio.pk',
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 4.0),

                                    Text(
                                      "You'll be sent a private key for vote verification",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            RaisedButton( 
                                onPressed: () async {

                                  User chay = User(voter: idController.text);

                                  print(userToJson(chay));
                                  if (idController.text == "" || emailController.text == "")
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text("Kindly fill out the text fields correctly"),
                                      );
                                    },
                                  );
                                  else{
                                    SystemChrome.setEnabledSystemUIOverlays([]);
                                    
                                    createPost(chay).then((response){
                                      if(response.statusCode > 200){
                                        print(response.body);
                                      }
                                      else {
                                        print(response.statusCode);
                                      }
                                    }).catchError((error){
                                      print('error: $error');
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CandidateScreen()),
                                    );
                                  }
                                },
                                color: Color(0xFF0A3A7F),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                      'PROCEED',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Hero(
                      tag: "trophy",
                      child: SizedBox(
                        width: 900.0,
                        height: 750.0,
                        child: FlareActor(
                          'assets/final_trophy.flr',
                          animation: 'rotation',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 700.0,
                    //   height: 850.0,
                    //   child: FlareActor(
                    //     'assets/animate_trophy.flr',
                    //     animation: 'Untitled',
                    //     fit: BoxFit.none,
                    //   ),
                    // ),
//                  Container(
//                    height: 750.0,
//                    child: Image(
//                      image: AssetImage('assets/tropy.png'),
//                    ),
//                  ),
                  ],
                ),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'POWERED BY',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                  ),
                ),

                SizedBox(width: 20.0,),

                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image(
                      image: AssetImage('assets/devote_logo.png'),
                    ),
                  ),
                ),

                SizedBox(width: 100.0,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}