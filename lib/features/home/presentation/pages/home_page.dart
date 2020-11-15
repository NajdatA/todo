import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/util/generate_screen.dart';
import 'package:flutter_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import 'add_page.dart';
// import 'file:///C:/Users/ASUS/AndroidStudioProjects/flutter_app/lib/features/home/presentation/pages/add_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool done = false;
  bool addContainer = false;
  Timer timer;
  final _bloc = sl<HomeBloc>();

  @override
  void initState() {
    _bloc.todos();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      // print('tik');
      setState(() {
        addContainer = !addContainer;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, HomeState state) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.lightBlueAccent, Colors.blue]
                  )
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'To-Do List',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'InternetFriends', fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.todos.length + 1,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == state.todos.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 10),
                        child: Center(
                            child: GestureDetector(
                              onTap: () {
                                // print('double ${dragUpdateDetails.primaryVelocity}');
                                // print('double ${dragUpdateDetails.velocity}');
                                // if (dragUpdateDetails.primaryVelocity == 0)
                                //   Navigator.pushNamed(context, NameScreen.ADD_SCREEN);
                                Navigator.of(context).push(AddPageRoute());
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: 40,
                                width: addContainer ? 140 : 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [Colors.lightBlueAccent, Colors.blue]
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                        'Click me to add!',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.lightBlueAccent, Colors.blue],
                            ),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 12),
                                  child: Text('${state.todos[index].id}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InternetFriends'
                                    ),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 40, right: 8),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.todos[index].task, style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'InternetFriends',
                                  ),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 8),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('${state.todos[index].date}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InternetFriends'
                                    ),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('done?', style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InternetFriends'
                                    ),),
                                    Checkbox(
                                      value: state.todos[index].isFinished,
                                      onChanged: (bool x) {
                                        _bloc.update(state.todos[index].id,
                                            !state.todos[index].isFinished,
                                            index);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }
      )
    );
  }
}
