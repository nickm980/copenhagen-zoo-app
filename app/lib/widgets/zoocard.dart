import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZooCard extends StatelessWidget {
  const ZooCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AspectRatio(
      aspectRatio: 1,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      border: Border(
                        top: BorderSide(color: Theme.of(context).primaryColor),
                        bottom: BorderSide(color: Theme.of(context).primaryColor),
                        left: BorderSide(color: Theme.of(context).primaryColor),
                        right: BorderSide(color: Theme.of(context).primaryColor),
                      )),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    "Zoo Scannable Ticket (non-member)",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Scan this ticket to enter the zoo and join events",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ],
              )

            )),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  child: BarcodeWidget(
                    barcode: Barcode.code39(),
                    data: "89495940",
                  ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  border: Border(
                    top: BorderSide(color: Theme.of(context).primaryColor),
                    bottom: BorderSide(color: Theme.of(context).primaryColor),
                    left: BorderSide(color: Theme.of(context).primaryColor),
                    right: BorderSide(color: Theme.of(context).primaryColor),
                  )),
            ))
          ],
        ),
      ),
    ));
  }
}
