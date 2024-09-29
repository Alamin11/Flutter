import 'package:flutter/material.dart';
import 'package:test_app/utills/extensions.dart';
import 'package:test_app/widgets/custom_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String? userName, email, phone, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration form"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormField(
                  hintText: "Username",
                  validator: (val) {
                    if (!val!.isValidUsername) {
                      return 'Enter valid user name';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      userName = val;
                    });
                  },
                ),
                CustomFormField(
                  hintText: "Email",
                  validator: (val) {
                    if (!val!.isValidEmail) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                CustomFormField(
                  hintText: "Phone",
                  validator: (val) {
                    if (!val!.isValidPhone) {
                      return 'Enter valid number ';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      phone = val;
                    });
                  },
                ),
                CustomFormField(
                  hintText: "Password",
                  obsCureText: true,
                  validator: (val) {
                    if (!val!.isValidPassword) {
                      return 'Enter valid password';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // print("userName = $userName\n email = $email ");
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text("Register!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
