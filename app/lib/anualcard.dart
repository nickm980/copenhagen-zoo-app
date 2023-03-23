import 'package:eventsapp/widgets/zoocard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnualCard extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  AnualCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Annual Card",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              "Purchase an annual card to get free access to the zoo all year long, exclusive discounts & perks, and bring a friend for free",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(onPressed: () {
                  launchUrl(Uri.parse("https://www.zoo.dk/s/billetter/aarskort/?language=da"));
                }, child: Text("Buy Card")),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (context){
                      return Container
                        (padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Form(key: formKey, child:Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Code',
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'Enter your annual card claim code';
                              }
                              return  'Code not registered to an annual card';
                            },
                          ),
                          SizedBox(height: 10),
                          TextButton(onPressed: (){
                            formKey.currentState!.validate();
                          },
                              child: Text("Claim Code"),)
                        ],
                      ),));
                    });
                  },
                  child: Text(
                    "Claim a code",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                )
              ],
            ),
            SizedBox(height: 40),
            Text(
              "Your card",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            Expanded(child: Row(children: [
              ZooCard()
            ],))
           
          ],
        ));
  }
}
