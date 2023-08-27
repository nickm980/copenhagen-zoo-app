import 'package:eventsapp/anualcard.dart';
import 'package:eventsapp/description.dart';
import 'package:eventsapp/services/service.dart';
import 'package:eventsapp/volunteer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth.dart';
import 'getinvolved.dart';
import 'home.dart';
import 'map.dart';
import 'events_navigator.dart';

void main() {
  runApp(const MyApp());
}

final paths = [
  "/map",
  "/anualcard",
  "/events",
  "/newsletter",
  "/getinvolved"
];
var globalIndex = 2;

final GoRouter _router = GoRouter(

  routes: [

    GoRoute(
      path: "/",
      pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: "/volunteer",
      pageBuilder: (context, state) => NoTransitionPage(child: Volunteer()),
    ),
    GoRoute(
      path: "/description",
      pageBuilder: (context, state) {
        var event;

        if (state.extra == null){
          event = EventsService().getEvents().first;
        }
        else {
          event = state.extra as EventListing;
        }

        return NoTransitionPage(child: Description(key: GlobalKey(), event: event));
      },
    ),
    ShellRoute(
        builder: (context, state, widget) {
          return Scaffold(
             appBar: AppBar(elevation: 0,),
              body: Center(
                child:
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 700
                  ),
                  child: widget
                ),
              ));
        },
        routes: [
          GoRoute(
            path: "/login",
            pageBuilder: (context, state) => NoTransitionPage(child: Login()),
          ),
          GoRoute(
            path: "/signup",
            pageBuilder: (context, state) => NoTransitionPage(child: Signup()),
          ),
        ]),
    ShellRoute(
        builder: (context, state, child) {
          int index = paths.indexOf(state.location);

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Theme.of(context).primaryColor,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              currentIndex: index == -1 ? 3 : index,
              onTap: (index) {
                globalIndex = index;
                context.go(paths[index]);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
                BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
                BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
                BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Newsletter'),
                BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism_outlined), label: 'Get Involved'),

              ],
            ),
            appBar: AppBar(title: Text("Copenhagen Zoo",
                style: Theme.of(context).appBarTheme.titleTextStyle),
            actions: [
              IconButton(onPressed: (){
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(title: Text("Sign Out"),content: Text("Are you sure you want to sign out?"), actions: [
                    TextButton(onPressed: (){context.pop();}, child: Text("Go Back")),
                    TextButton(onPressed: (){context.go("/");}, child: Text("Yes, sign me out"))
                  ],);
                });
              },
              icon: Icon(Icons.person),)
            ],
            ),
            body: Center(child:Container(
              constraints: BoxConstraints(
                maxWidth: 700
              ),
              child: child,
            ),
            )
          );
        },
        routes: [
          GoRoute(
            path: "/events",
            pageBuilder: (context, state) => NoTransitionPage(child: EventsNavigator()),
          ),
          GoRoute(
            path: "/anualcard",
            pageBuilder: (context, state) => NoTransitionPage(child: AnualCard()),
          ),
          GoRoute(
            path: "/map",
            pageBuilder: (context, state) => NoTransitionPage(child: MapPage()),
          ),
          GoRoute(
            path: "/test",
            pageBuilder: (context, state) => NoTransitionPage(child: MapPage()),
          ),
          GoRoute(
            path: "/newsletter",
            pageBuilder: (context, state) => NoTransitionPage(child: Newsletter()),
          ),
          GoRoute(
            path: "/getinvolved",
            pageBuilder: (context, state) => NoTransitionPage(child: GetInvolved()),
          ),
        ])
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var primary = Color.fromRGBO(15, 106, 88, 1);
    var black = Colors.black;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: _router,
      title: "Copenhagen Zoo",
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          labelColor: Color.fromRGBO(151, 151, 151, 1)
        ),
          visualDensity: VisualDensity(horizontal: 0, vertical: 0),
          primaryColor: primary,
          fontFamily: GoogleFonts.inter().fontFamily,
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
            textStyle: MaterialStateProperty.all(const TextStyle(
              letterSpacing: .5,
                fontWeight: FontWeight.w600)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(15, 106, 88, 1)),
          )),
          scaffoldBackgroundColor: Colors.white,
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Color.fromRGBO(41, 204, 172, 1))
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: black,
            cursorColor: black,
            selectionHandleColor: black,
          ),
          appBarTheme:
              const AppBarTheme(
                 centerTitle: true,
                  foregroundColor: Colors.black26,
                  color: Colors.white, shadowColor: Color.fromRGBO(250, 250, 250, 1), toolbarHeight: 60, elevation: 0,  titleTextStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .5), fontWeight: FontWeight.bold)),
          inputDecorationTheme: InputDecorationTheme(

              filled: true,
              labelStyle: TextStyle(fontWeight: FontWeight.normal),
              helperStyle: TextStyle(fontWeight: FontWeight.normal),
              prefixStyle: TextStyle(fontWeight: FontWeight.normal),
              hintStyle: TextStyle(fontWeight: FontWeight.normal),
              fillColor: Color.fromRGBO(250, 250, 250, 1),
              outlineBorder: BorderSide(color: Colors.grey), ),
          textTheme: TextTheme(
              titleSmall: TextStyle(

                  fontWeight: FontWeight.bold, color: Colors.black),
              titleLarge: TextStyle(

                      fontWeight: FontWeight.bold, color: Colors.black),
              bodyMedium: TextStyle(color: Color.fromRGBO(151, 151, 151, 1), height: 1.5))),
    );
  }
}
