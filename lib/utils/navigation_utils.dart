import 'package:flutter/material.dart';

openScreen(BuildContext context, Widget screen) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
void navigationPop(BuildContext context) async {
  Navigator.pop(context);
}