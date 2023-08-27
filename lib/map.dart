import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Zoo Map",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            Expanded(
              child: PinchZoom(
                child: Image.asset("assets/map.png"),
                resetDuration: const Duration(milliseconds: 100),
                maxScale: 2.5,
                onZoomStart: () {
                  print('Start zooming');
                },
                onZoomEnd: () {
                  print('Stop zooming');
                },
              ),
            ),
          ],
        ));
  }
}

class Newsletter extends StatelessWidget {
  final _controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Newsletter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Join the Free Newsletter",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    Text(
                        "Don't be left out! Get exclusive discounts, be the first to hear about events, and stay up to date with our news!"),
                    SizedBox(height: 20),
                    Form(
                      key: formKey,
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)){
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          controller: _controller,

                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Email"),
                        ),
                        SizedBox(height: 20),
                        TextButton(onPressed: () {
                          if(formKey.currentState!.validate()){
                            String email = _controller.text;
                            launchUrl(Uri.parse("https://imaginative-valkyrie-852af6.netlify.app/?email=$email"));
                          }
                        }, child: Text("Subscribe")),
                      ],
                    )),
                    SizedBox(height: 50),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Opacity(
                          child: Image.asset(
                            "assets/newsletter.png",
                            fit: BoxFit.scaleDown
                            ,
                          ),
                          opacity: 1,
                        ),
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
