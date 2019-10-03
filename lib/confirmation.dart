import 'package:devote_app/Project.dart';
import 'package:devote_app/candiate_grid.dart';
import 'package:devote_app/login_screen.dart';
import 'package:devote_app/main.dart';
import 'package:devote_app/services.dart';
import 'package:devote_app/services.dart' as prefix0;
import 'package:devote_app/user.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'card.dart';


String heroTag = "";


class ConfirmationScreen extends StatelessWidget {
  
  ConfirmationScreen({Key key, this.tag}) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    heroTag = tag;
    return Scaffold(
        backgroundColor: Color(0xFFF7F9FB),
        body: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation<double>   _frontScale;
  Animation<double>   _backScale;
  Animation<double> _slideOut;
  Animation<double> _shrink;
  Animation<double> _backgroudOpacity;
  Animation<double> _slideText;
  Animation<double> _trophyScale;
  Animation<double> _trophyTranslateX;
  Animation<double> _trophyTranslateY;
  double hide = 1.0;
  
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 0.075, curve: Curves.easeIn),
    ));

    _backScale = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.075, 0.15, curve: Curves.easeOut),
    );

    _slideOut = new Tween(
      begin: 0.0,
      end: 150.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.4, 0.5, curve: Curves.easeIn)
    ));

    _shrink = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 0.55, curve: Curves.easeIn),
    ));

    _backgroudOpacity = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.4, 0.5, curve: Curves.ease),
    );

    _slideText = new Tween(
      begin: -800.0,
      end: -350.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 0.6, curve: Curves.easeOut),
    ));

    _trophyScale = new Tween(
      begin: 30.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.9, 1.0),
    ));

    _trophyTranslateX = new Tween(
      begin: -225.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.995, 1.0),
    ));

    _trophyTranslateY = new Tween(
      begin: -355.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.995, 1.0),
    ));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[

          AnimatedBuilder(
            animation: _backgroudOpacity,
            builder: (context, snapshot) {
              return Transform(
                transform: Matrix4.identity()..scale(_trophyScale.value, _trophyScale.value, _trophyScale.value)..translate(_trophyTranslateX.value, _trophyTranslateY.value, 0.0),
                child: Opacity(
                  opacity: _backgroudOpacity.value,
                  child: Hero(
                    tag: "trophy",
                    child: SizedBox(
                          width: 900.0,
                          height: 750.0,
                          child: FlareActor(
                            'assets/final_trophy.flr',
                            fit: BoxFit.fitHeight,
                            animation: 'rotation',
                          ),
                        ),
                  ),
                ),
              );
            }
          ),

          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Stack(
                  children: <Widget>[  

                    // AnimatedBuilder(
                    //   animation: _backScale,
                    //   builder: (BuildContext context, Widget child) {
                    //     final Matrix4 transform = new Matrix4.identity()..scale(1.0, _backScale.value, 1.0);
                        
                    //     return new Transform(
                    //       transform: transform,
                    //       alignment: FractionalOffset.center,
                    //       child: child,
                    //     );
                    //   },
                    //   child: Container(
                    //     height: 650.0,
                    //     width: 500.0,
                    //     color: Colors.blue,
                    //   ),
                    // ),

                    AnimatedBuilder(
                      animation: _frontScale,
                      builder: (BuildContext context, Widget child) {
                        final Matrix4 transform = new Matrix4.identity()
                          ..scale(1.0, _frontScale.value, 1.0);
                        return new Transform(
                          transform: transform,
                          alignment: FractionalOffset.center,
                          child: child,
                        );},
                      child: Hero(
                        tag: heroTag,
                        child: CustomCard(
                          corner: Text(
                            projects[int.parse(heroTag)].id,
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
                                  projects[int.parse(heroTag)].projectTitle,
                                  style: TextStyle(
                                    color: Color(0xFF0A3A7F),
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'SUPERVISOR : ' + projects[int.parse(heroTag)].supervisorName,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),

                                    SizedBox(height: 10.0,),

                                    Text(
                                      'GROUP LEAD : ' + projects[int.parse(heroTag)].groupLeader,
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
                          height: 650.0,
                          width: 500.0,
                        ),
                      ),
                    ),

                    AnimatedBuilder(
                      animation: _backScale,
                      builder: (BuildContext context, Widget child) {
                        final Matrix4 transfrorm = new Matrix4.identity()..scale(1.0, _backScale.value, 1.0)..translate(0.0, _slideOut.value, 0.0)..scale(1.0, _shrink.value, 1.0);
                        return new Transform(
                          transform: transfrorm,
                          child: child,
                          alignment: _shrink.value < 1? FractionalOffset.bottomCenter : FractionalOffset.center,
                        );
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Center(
                            child: Text(
                              'THANKYOU FOR MAKING A DIFFERECE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0A3A7F),
                                fontSize: 72.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        height: 650.0,
                        width: 500.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x33000000),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                Column(
                  children: <Widget>[
                    Opacity(
                      opacity: hide,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                        'BACK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                      ),
                    ),

                    SizedBox(height: 50.0,),

                    Opacity(
                  opacity:hide,
                  child: RaisedButton(
                    onPressed: () {

                      setState(() {
                        _controller.forward();
                        hide = 0.0;
                        Vote vote = Vote(candidate: projects[int.parse(heroTag)].projectTitle);

                        prefix0.castVote(vote).then((response){
                            if(response.statusCode > 200){
                              print(response.body);
                            }
                            else {
                              print(response.statusCode);
                            }
                          }).catchError((error){
                            print('error: $error');
                          });

                          Future.delayed(Duration(seconds: 10), (){
                          //Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DevoteApp()));
                        });                  
                        
                      });
                    },
                    color: Color(0xFF0A3A7F),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                    'VOTE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                  ),
                ),
                  ],
                ),

                
              ],
            ),
          ),

          AnimatedBuilder(
            animation: _slideText,
            builder: (context, snapshot) {
              return Transform(
                transform: Matrix4.identity()..translate(0.0, _slideText.value, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Opacity(
                    opacity: _trophyScale.value < 30.0? 0.0 : 1.0,
                    child: Text(
                      "YOUR VOTE IS SECURE IN OUR BLOCKCHAIN",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 80.0,
                        color: Color(0xFF0A3A7F),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              );
            }
          ),

        ],
      ),
    );
  }
}