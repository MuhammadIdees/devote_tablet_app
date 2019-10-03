
import 'package:devote_app/Project.dart';
import 'package:devote_app/card.dart';
import 'package:devote_app/confirmation.dart';
import 'package:flutter/material.dart';


class CandidateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F9FB),
        body: Screen(),
    );
  }
}
class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:50.0, right: 50.0, left: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Text(
                    'SELECT A PROJECT',
                    style: TextStyle(
                      color: Color(0xFF0A3A7F),
                      fontSize: 64.0,
                      fontWeight: FontWeight.w700,
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
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
              child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(projects.length, (index) {
                      print(projects.length);
                      Project item = projects[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConfirmationScreen(tag: "$index")),
                          );
                        },
                        child: Hero(
                          tag: "$index",
                          child: CustomCard(
                            corner: Text(
                              "${item.id}",
                              style: TextStyle(
                                color: Color(0xFF0A3A7F),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(56.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.projectTitle,
                                    style: TextStyle(
                                      color: Color(0xFF0A3A7F),
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'SUPERVISOR : ' + item.supervisorName,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),

                                      SizedBox(height: 10.0,),

                                      Text(
                                        'GROUP LEAD : ' + item.groupLeader,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                            height: 450.0,
                            width: 500.0,
                          ),
                        ),
                      );
                    }),
                    )
                
            ),
          ),
        
        ],
      ),
    );
  }
}
