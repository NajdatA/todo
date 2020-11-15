import 'package:flutter/material.dart';
import 'package:flutter_app/core/util/generate_screen.dart';
import 'package:flutter_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_app/features/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../injection.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final _bloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, LoginState state) {
          if (state.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, NameScreen.HOME_SCREEN);
            });
          }
          if (state.error != '') {
            wrong();
            _bloc.clear();
          }
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.lightBlueAccent, Colors.blue]
                )
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/login.png')
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Kindly verify your identity',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'InternetFriends'
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 8, right: 8),
                  child: TextField(
                    controller: usernameController,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'InternetFriends',
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white,),
                      labelText: "Username",
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'InternetFriends',
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white,),
                      labelText: "Password",
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 8, right: 8, bottom: 25),
                  child: GestureDetector(
                    onTap: () {
                      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                        fill();
                      } else {
                        _bloc.login(
                            usernameController.text, passwordController.text);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10)
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
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  void fill() {
    Fluttertoast.showToast(
        msg: "Username and password are required!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
//        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  void wrong() {
    Fluttertoast.showToast(
        msg: "Wrong username or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
//        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
