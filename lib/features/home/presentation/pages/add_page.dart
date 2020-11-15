import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/util/generate_screen.dart';
import 'package:flutter_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../injection.dart';

class AddPageRoute extends CupertinoPageRoute {
  AddPageRoute()
      : super(builder: (BuildContext context) => new AddPage());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new ScaleTransition(scale: animation, child: new AddPage());
  }
}

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController textEditingController = TextEditingController();
  final _bloc = sl<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, NameScreen.HOME_SCREEN);
        return false;
      },
      child: Scaffold(
        body: BlocBuilder(
          bloc: _bloc,
          builder: (context, HomeState state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.lightBlueAccent, Colors.blue]
                      ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "What are you afraid to forget again? 🤔",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'InternetFriends',
                            fontSize: 60
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: textEditingController,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'InternetFriends',
                          ),
                          decoration: InputDecoration(
                            labelText: "Let's help you remember!",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'InternetFriends',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 6
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3
                              ),
                            ),
                          ),
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'InternetFriends',
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (textEditingController.text.isEmpty) {
                                fill();
                              } else {
                                _bloc.add(textEditingController.text);
                                Navigator.pushReplacementNamed(context, NameScreen.HOME_SCREEN);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InternetFriends',
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            );
          }
        ),
      ),
    );
  }
  void fill() {
    Fluttertoast.showToast(
        msg: "Fill your task to continue!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
//        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
