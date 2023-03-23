import 'package:eventsapp/services/service.dart';
import 'package:eventsapp/widgets/listing.dart';
import 'package:eventsapp/widgets/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var events = EventsService();

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<String> filters = [];

  void toggleFilter(String tag) {
    setState(() {
      if (filters.contains(tag)) {
        filters.remove(tag);
      } else {
        filters.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Events",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text(
                  "View and register for all of our upcoming events for the week"),
              SizedBox(height: 20),
              Container(height: 35, child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Pill(
                      active: filters.contains("Night Time"),
                      text: "Night Time",
                      onTap: () {
                        toggleFilter("Night Time");
                      }),
                  Pill(
                      active: filters.contains("Family"),
                      text: "Family",
                      onTap: () {
                        toggleFilter("Family");
                      }),
                  Pill(
                      active: filters.contains("Volunteer"),
                      text: "Volunteer",
                      onTap: () {
                        toggleFilter("Volunteer");
                      }),
                ],
              )),
              SizedBox(height: 20),
              Text(events.getFilteredEvents(filters).length.toString() + " results"),
              SizedBox(height: 15),
            ],
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                EventBox(key: GlobalKey(), event: events.getFilteredEvents(filters).elementAt(index)),
                SizedBox(height: 10),
              ],
            );
          }, childCount: events.getFilteredEvents(filters).length)),
        ]));
  }
}