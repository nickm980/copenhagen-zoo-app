import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/service.dart';

class EventBox extends StatelessWidget {
  final EventListing event;

  const EventBox({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {context.go("/description", extra: event)},
        child: Column(children: [Container(
          decoration: BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(color: Color.fromRGBO(250, 250, 250, 1)))),
          child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: FittedBox(
                    child: Image.asset("assets/${event.thumbnail}"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(event.getFormattedDate(),
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 5),
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 5),
                    Text(overflow: TextOverflow.ellipsis, event.description, softWrap: true, maxLines: 2,)
                  ],
                )
                )],
            ),
          ),
        ]));
  }
}
