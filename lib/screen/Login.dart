import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../Bloc/BlocState.dart';
import '../Bloc/UserBloc.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();

class Login extends StatelessWidget {
  final BlocState state;
  const Login({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: context.width * .3 < 350 ? 350 : context.width * .3,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(
              //   height: context.height * .15,
              // ),
              const Lable(
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
                notempty: true,
              ).margin9,
              Edit(
                hint: "password",
                password: true,
                autofocus: false,
                controller: _pass,
                notempty: true,
              ).margin9,
              AbsorbPointer(
                absorbing: state is Loading,
                child: Row(
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
                    state is Loading
                        ? CupertinoActivityIndicator()
                        : Container(),
                    Button(
                            title: "login",
                            ontap: () {
                              if (_formkey.currentState!.validate())
                                context
                                    .read<UserBloc>()
                                    .autanticated(_mobile.text, _pass.text);
                            },
                            icon: const Icon(
                              Icons.vpn_key,
                            ),
                            color: Colors.blue,
                            padding: const EdgeInsets.all(15))
                        .margin9,
                  ],
                ),
              ),
              state is Failed
                  ? Container(
                      margin: EdgeInsets.all(25),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(18)),
                      child: Text(
                        " ${(state as Failed).exception.toString()}"
                            .replaceAll("Exception:", "Warning:"),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ).padding9.card.center),
    );
  }
}
