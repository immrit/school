import 'package:flutter/material.dart';
import 'package:school/module/extension.dart';
import 'package:school/module/widgets.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Lable(
              title: "School site",
              bold: true,
              color: Colors.grey,
              fontsize: 29,
            ).vMargin9,
            const Edit(
              hint: "username",
              autofocus: true,
              password: false,
            ).margin9,
            const Edit(
              hint: "password",
              password: true,
              autofocus: false,
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
                Button(
                        title: "login",
                        ontap: () => print("clicked!"),
                        icon: const Icon(
                          Icons.vpn_key,
                        ),
                        color: Colors.blue,
                        padding: const EdgeInsets.all(15))
                    .margin9,
              ],
            ),
          ],
        ),
      ).padding9.card.center),
    );
  }
}
