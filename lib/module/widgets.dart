import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final Icon? icon;
  final Color? color;
  final Color? color_txt;
  final EdgeInsets? padding;
  const Button({
    Key? key,
    required this.title,
    required this.ontap,
    this.icon,
    this.color,
    this.color_txt,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(padding)),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 5),
                  Lable(
                    title: title,
                    color: color_txt,
                  )
                ],
              )
            : Lable(
                title: title,
              ));
  }
}

class Lable extends StatelessWidget {
  final String title;
  final double? fontsize;
  final Color? color;
  final bool? bold;
  const Lable({
    Key? key,
    required this.title,
    this.fontsize,
    this.color,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: bold! ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class Edit extends StatelessWidget {
  final String hint;
  final Function(String)? onchange;
  final bool autofocus;
  final bool password;
  final TextEditingController? controller;

  const Edit({
    Key? key,
    required this.hint,
    this.onchange,
    required this.autofocus,
    required this.password,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), gapPadding: 20),
          labelText: hint,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
      obscureText: password,
      controller: controller,
      onChanged: onchange,
    );
  }
}
