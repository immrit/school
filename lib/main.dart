import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/BlocState.dart';
import 'Bloc/UserBloc.dart';
import 'screen/Login.dart';
import 'screen/dashboard.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider<UserBloc>(create: (_) => UserBloc())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<UserBloc, BlocState>(builder: (context, state) {
        if (state is Autanticated) return Dashboard();
        return Login(
          state: state,
        );
      }),
    );
  }
}
