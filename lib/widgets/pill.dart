import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;
  final bool active;
  final Function onTap;

  const Pill({Key? key, required this.text, required this.active, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: !active ? Colors.transparent : Theme.of(context).primaryColor,
            border:
            Border.all(color: !active ? Color.fromRGBO(240, 240, 240, 1) : Theme.of(context).primaryColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            onTap: (){onTap.call();},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: !active ? Theme.of(context).textTheme.bodyMedium?.color : Colors.white),),
            )));
  }
}