import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Bloc/UserBloc.dart';
import 'package:school/screen/dashboard.dart';
import 'Bloc/BlocState.dart';
import 'module/extension.dart';
import 'module/widgets.dart';
import 'package:bloc/bloc.dart';

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

class Login extends StatelessWidget {
  final BlocState state;
  const Login({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _mobile = TextEditingController();
    TextEditingController _pass = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: context.width * .3 < 350 ? 350 : context.width * .3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(
            //   height: context.height * .15,
            // ),
            Lable(
              title: "School site",
              bold: true,
              color: Colors.grey,
              fontsize: 29,
            ).vMargin9,
            Edit(
              hint: "username",
              controller: _mobile,
              autofocus: true,
              password: false,
            ).margin9,
            Edit(
              hint: "password",
              password: true,
              autofocus: false,
              controller: _pass,
            ).margin9,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Button(
                        title: "register",
                        ontap: () => print("clicked!"),
                        icon: const Icon(
                          Icons.person_add_alt_1,
                        ),
                        color: Colors.green,
                        padding: const EdgeInsets.all(15))
                    .margin9,
                state is Loading ? CupertinoActivityIndicator() : Container(),
                Button(
                        title: "login",
                        ontap: () => context
                            .read<UserBloc>()
                            .autanticated(_mobile.text, _pass.text),
                        icon: const Icon(
                          Icons.vpn_key,
                        ),
                        color: Colors.blue,
                        padding: const EdgeInsets.all(15))
                    .margin9,
              ],
            ),
            state is Failed
                ? Container(
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      " ${(state as Failed).exception.toString()}",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container()
          ],
        ),
      ).padding9.card.center),
    );
  }
}
