import 'package:flutter/material.dart';
import '../Bloc/UserBloc.dart';
import '../module/widgets.dart';
import '../module/extension.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lable(
              title:
                  "Hello ${context.read<UserBloc>().user!.name} ${context.read<UserBloc>().user!.family} \n your phone number: ${context.read<UserBloc>().user!.mobile}"),
          Button(
            title: "Log Out",
            color: Colors.red[400],
            ontap: () => context.userBloc.SignOut(),
          )
        ],
      ).center),
    );
  }
}
