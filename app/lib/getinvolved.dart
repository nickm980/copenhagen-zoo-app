import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInvolved extends StatelessWidget {
  GetInvolved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(child: _Card(
                  title: "Social Media",
                  description:
                  "Visit our instagram account",
                  icon: Icons.tv,
                  color: Color.fromRGBO(103, 183, 146, 1), onTap: (){launchUrl(Uri.parse("https://www.instagram.com/copenhagen_zoo/"));},
                  extra: TextButton(onPressed: (){launchUrl(Uri.parse("https://www.instagram.com/copenhagen_zoo/"));},
                  child: Text("Visit our instagram"),),
                ),),
                SizedBox(width: 10),

                Expanded(child: _Card(
                  onTap: (){
                    context.go("/volunteer");
                  },
                  color: Color.fromRGBO(22, 153, 111, 1),
                  title: "Volunteer",
                  extra: TextButton(
                    onPressed: (){
                      context.go("/volunteer");
                    },
                    child: Text("Volunteer"),
                  ),
                  description: "Volunteer for group discounts and school hours",
                  icon: Icons.volunteer_activism_outlined,
                ),),
              ],
            )),
            const SizedBox(height: 20),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: _Card(
                      onTap: (){context.go("/newsletter");},
                      color: Color.fromRGBO(19, 64, 61, 1),
                      title: "Join Our Newsletter",
                      description:
                      "Sign up for the mailing list to receive exclusive discounts and reminders about events",
                      icon: Icons.mail_outline,
                      extra: TextButton(onPressed: () { context.go("/newsletter"); },
                      child: const Text("Learn more"),)
                    ),),
                  ],
                )),
          ],
        ));
  }
}

class _Card extends StatelessWidget {
  final IconData icon;
  final String title, description;
  final Color color;
final Widget? extra;
  final Function onTap;

  const _Card(
      {Key? key,
        required this.color,
      required this.title,
      required this.description,
      required this.icon, this.extra,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget extraWidget = extra != null ? extra! : Container();
    return InkWell(
      onTap: () {
        onTap();
        print("hello");
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          border: Border(
            bottom: BorderSide(width: 5, color: color),
          ),
        ),
        child: Center(child: ListView(
          children: [
            Center(child:
            Opacity(
                child: Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
                opacity: .25)),
            SizedBox(height: 10),
            Center(child:Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
            )),
            SizedBox(height: 10),

            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
            SizedBox(height: 20),
            extraWidget,
          ],
        ),
      )),
    );
  }
}
