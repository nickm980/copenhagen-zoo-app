import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0, toolbarHeight: 0),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover
              ,
              image: AssetImage("assets/pandabg.png")
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: FittedBox(
                child: Image.asset(
                    'assets/zoologo.png'),
                fit: BoxFit.contain,
              ),
            ),
            Expanded(child: Container()),
            TextButton(
                onPressed: () => {context.go('/signup')},
                child: Text("Sign up")),
            SizedBox(height: 10),
            TextButton(
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () => {context.go('/login')},
                child: Text("Log in")),

            SizedBox(height: 10),
            TextButton(
                style: Theme.of(context).textButtonTheme.style?.copyWith(backgroundColor: MaterialStateProperty.all(Colors.transparent), foregroundColor: MaterialStateProperty.all(Colors.grey)),
                onPressed: () => {context.go("/events")}, child: Text("Continue as guest"))
          ],
        ),
      ),
    );
  }
}
