import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Log in",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 30),
                    const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      child: Text("Log in"),
                      onPressed: () => {context.go("/events")},
                    ),
                    Expanded(child: Container()),
                  ],
                ))),

        Container(
          padding: EdgeInsets.all(25),
          color: Color.fromRGBO(250, 250, 250, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: Theme.of(context).textTheme.bodyMedium,),
              GestureDetector(
                onTap: () => context.go("/signup"),
                child: Text(
                  "Sign up instead",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),


            ],
          ),
        )
      ],
    );
  }
}

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Sign up",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 30),
                    const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                      child: Text("Sign up"),
                      onPressed: () => {context.go("/events")},
                    ),
                    Expanded(child: Container()),
                    Text("By creating an account you agree to our Terms of Service and acknowledge that you have read our Privacy Policy.", textAlign: TextAlign.center,),

                  ],
                ))),
        Container(
          padding: EdgeInsets.all(25),
          color: Color.fromRGBO(250, 250, 250, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ", style: Theme.of(context).textTheme.bodyMedium,),
              GestureDetector(
                onTap: () => context.go("/login"),
                child: Text(
                  "Log in",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),


            ],
          ),
        )
      ],
    );
  }
}
