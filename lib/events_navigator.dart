import 'package:eventsapp/events.dart';
import 'package:eventsapp/myevents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsNavigator extends StatefulWidget {
  const EventsNavigator({ super.key });
  @override
  State<EventsNavigator> createState() => _EventsNavigatorState();
}

class _EventsNavigatorState extends State<EventsNavigator> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        bottom: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          dividerColor: Theme.of(context).primaryColor,
          labelPadding: EdgeInsets.all(15),
          controller: _tabController,
          tabs: [
            Column(
              children: [
                Text("Upcoming"),
              ],
            ),
            Text("Your Events"),
          ],        ),
      ),
      body: TabBarView(

        controller: _tabController,
        children: [
          EventsPage(),
          MyEventsPage(controller: _tabController,)
        ]
      ),
    );
  }
}