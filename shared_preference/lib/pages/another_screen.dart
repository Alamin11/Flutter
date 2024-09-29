import 'package:flutter/material.dart';
import 'package:shared_preference/pages/home_page.dart';

// ignore: must_be_immutable
class AnotherScreen extends StatefulWidget {
  String nameFromHome;
  AnotherScreen({super.key, required this.nameFromHome});

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  var values = RangeValues(0, 1);

  @override
  Widget build(BuildContext context) {
    var lavels = RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Mr. ${widget.nameFromHome} to another screen",
                style: TextStyle(fontSize: values.end),
              ),
              const SizedBox(
                height: 60,
              ),
              RangeSlider(
                  values: values,
                  labels: lavels,
                  divisions: 48,
                  min: 0,
                  max: 48,
                  onChanged: (newValue) {
                    values = newValue;

                    // print('${newValue.start}, ${newValue.end}');
                    setState(() {});
                  }),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text("Go back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
