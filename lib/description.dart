import 'dart:ui';

import 'package:eventsapp/services/service.dart';
import 'package:eventsapp/widgets/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var events = EventsService();

class Description extends StatefulWidget {
  final EventListing event;

  const Description({Key? key, required this.event}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool enabled = true;

  @override
  void initState() {
    if (!widget.event.isRegistered) {
      setState(() {
        enabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pills = [];
    for (String tag in widget.event.tags){
      pills.add(Pill(text: tag, active: false, onTap: (){}));
    }
    var actionText = widget.event.isFree() ? "Register For Free" : "Reserve A Spot";

    if (widget.event.isRegistered) {
      actionText = "Cancel Reservation";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Event Description"),
          leading: BackButton(
              onPressed: () {
                context.go("/events");
              },
              color: Colors.black),
        ),
        body: Center(child: Container(constraints: BoxConstraints(maxWidth: 700),child: Column(children: [

          Expanded(
            flex: 10,
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Container(
                  height: 300,
                    child: _GradientImage(
                        thumbnail: widget.event.thumbnail,
                        title: widget.event.title,
                        subtitle: widget.event.getFormattedDate())),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _MetaBox(title: widget.event.ages, desc: "Rec. Age"),
                    _MetaBox(title: "6", desc: "Attendees"),
                    _MetaBox(
                        title: "Free",
                        desc: "With Ticket"),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: pills,
                ),
                SizedBox(height: 20),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 5),
                Text(widget.event.description),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => context.go("/map"),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      ),
                      SizedBox(width: 2),
                      Text(
                        widget.event.location,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            color: Color.fromRGBO(250, 250, 250, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: TextButton(
                        style: Theme.of(context)
                            .textButtonTheme
                            .style
                            ?.copyWith(
                                backgroundColor: !widget.event.isRegistered
                                    ? Theme.of(context)
                                        .textButtonTheme
                                        .style
                                        ?.backgroundColor
                                    : MaterialStateProperty.all(Colors.grey)),
                        onPressed:  () {
                                events.register(widget.event.id);
                                print("$enabled");
                                setState(() {
                                  enabled = !enabled;
                                });
                                setState(() {

                                });
                                print("finished");
                                print("${widget.event.price}");

                        },
                        child: Text(actionText)))
              ],
            ),
          )
        ]))));
  }
}

class _MetaBox extends StatelessWidget {
  final String title;
  final String desc;

  const _MetaBox({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(),
        ),
        SizedBox(width: 5),
        Text(desc,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                ))
      ],
    );
  }
}

class _GradientImage extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String subtitle;

  const _GradientImage(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child:Stack(

        children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(250, 250, 250, 1),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/$thumbnail',
            ),
          ),
        ),
        height: 1000.0,
      ),
      Container(
        height: 1000.0,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [
                  0.0,
                  1.0
                ])),
      ),
      Column(
        children: [
          Expanded(child: Container()),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10)
        ],
      )
    ]));
  }
}
