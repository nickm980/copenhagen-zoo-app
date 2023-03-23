import 'package:eventsapp/services/service.dart';
import 'package:eventsapp/widgets/listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var events = EventsService();

class MyEventsPage extends StatelessWidget {
  final TabController controller;
  
  const MyEventsPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int eventLength = events.getMyEvents().length;

    Widget widget = eventLength != 0
        ?
   CustomScrollView(slivers: [SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Registered Events",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text("View all the events you registered for"),
            SizedBox(height: 20),
          ],
        )),
    SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                EventBox(event: events.getMyEvents().elementAt(index)),
                SizedBox(height: 10),
              ],
            );
          }, childCount: eventLength))])
        : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Opacity(child:  Icon(Icons.deck_outlined, size: 96, weight: .5,), opacity: .15,),
              SizedBox(height: 20,),
              Text("You are not registered for any events", textAlign: TextAlign.center,),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () => controller.animateTo(0),
                  child: Text("View upcoming events"))
            ],
          ));

    return Padding(
        padding: EdgeInsets.all(20),
        child: widget);
  }
}
