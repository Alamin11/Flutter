import 'package:flutter/material.dart';
import 'package:shared_preference/pages/another_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();
  static const KEYNAME = "name";
  var nameValue = "No value saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared preference"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text("Name"),
                labelStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setString(KEYNAME, nameController.text.toString());
              },
              child: const Text("Save"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(nameValue),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_right),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnotherScreen(
                          nameFromHome: nameValue,
                        )));
          }),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);
    nameValue = getName ?? "No value saved";
    setState(() {});
    // prefs.getString()
  }
}
