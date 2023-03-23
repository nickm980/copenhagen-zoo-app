import 'dart:ui';

import 'package:eventsapp/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

var events = EventsService();

class Volunteer extends StatefulWidget {
  const Volunteer({Key? key}) : super(key: key);

  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    double titleButtonGap = 10;
    double sectionGap = 20;

    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer"),
        leading: BackButton(
            onPressed: () {
              context.go("/getinvolved");
            },
            color: Colors.black),
      ),
      body: Center(child: Container(constraints: BoxConstraints(maxWidth: 700),child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Volunteer At Copenhagen Zoo",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
                "Volunteering at the zoo is a fun way to earn community hours for school, make new friends, learn about the zoo, and make Copenhagen a better place. Volunteers may also earn group discounts when they bring friends and/or free admission to the zoo"),
            SizedBox(height: 10),
            Text(" • Earn community service hours for school"),
            Text(" • Group discount benefits"),
            Text(" • Make new friends"),

            SizedBox(height: 20),
            Row(
              children: [
               CircleAvatar(
                 backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                 radius: 48,
                 backgroundImage: AssetImage("assets/collegestudent.jpg"),
               ),
                SizedBox(width: 20,),
                Flexible(child: Column(
                  children: [
                    Text("Ella S.", style: Theme.of(context).textTheme.titleSmall,),
                    Text("\"I love hanging out at the zoo with my friends. Volunteering helps me get huge discounts.\""),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )),
              ],
            ),
            SizedBox(height: sectionGap),
            SizedBox(height: sectionGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () => launchUrl(Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLSeNiMn_EXfDtgK12EKkFBIqMWZDJw6eGLgI6yPEHccafgGzuw/viewform")), child: Text("Apply")),
                SizedBox(width: 10),
                TextButton(
                    onPressed: () => context.go("/events"),
                    child: Text("Browse Events"),
                    style: Theme.of(context).textButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(Colors.transparent), side: MaterialStateProperty.all(BorderSide(color: Theme.of(context).primaryColor)), foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)))
              ],
            )
          ],
        ),
      ),
    )));
  }
}
