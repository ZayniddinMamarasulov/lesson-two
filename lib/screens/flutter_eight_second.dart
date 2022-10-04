import 'package:flutter/material.dart';
import 'package:lesson_two/models/user_model.dart';
import 'package:lesson_two/screens/flutter_nine_second.dart';

class MyFormScreen extends StatefulWidget {
  const MyFormScreen({Key? key}) : super(key: key);

  @override
  State<MyFormScreen> createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  var formKey = GlobalKey<FormState>();

  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasDigit = false;

  UserModel currentUser = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onSaved: (value) {
                  currentUser.firstName = value;
                },
                validator: (value) {
                  if (value!.length < 3) return "Ismni to'liq kiriting";
                },
                decoration: const InputDecoration(
                  hintText: 'First name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                onSaved: (value) {
                  currentUser.lastName = value;
                },
                decoration: InputDecoration(
                  hintText: 'Last name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                onSaved: (value) {
                  currentUser.pass = value;
                },
                onChanged: (value) {
                  String patternUpperCase = r'^(?=.*?[A-Z]).*$';
                  RegExp regExp = RegExp(patternUpperCase);

                  String patternLowerCase = r'^(?=.*?[a-z]).*$';
                  RegExp regExp2 = RegExp(patternLowerCase);

                  String patternDigit = r'^(?=.*?[0-9]).*$';
                  RegExp regExp3 = RegExp(patternDigit);

                  setState(() {
                    hasUpperCase = regExp.hasMatch(value);
                    hasLowerCase = regExp2.hasMatch(value);
                    hasDigit = regExp3.hasMatch(value);
                  });
                },
                validator: (value) {
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
                  RegExp regExp = RegExp(pattern);
                  bool result = regExp.hasMatch(value ?? "");
                  if (!result) return "Parol 6 tadan kam bo'lmasin";
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Kamida bitta Katta harf",
                style: TextStyle(
                  fontSize: 24,
                  color: hasUpperCase ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Kamida bitta Kichkina harf",
                style: TextStyle(
                  fontSize: 24,
                  color: hasLowerCase ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Kamida bitta RAQAM",
                style: TextStyle(
                  fontSize: 24,
                  color: hasDigit ? Colors.green : Colors.red,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    bool? state = formKey.currentState?.validate();
                    if (state == true) {
                      formKey.currentState?.save();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MyPageViewPage(
                                  currentUser: currentUser,
                                )));
                  },
                  child: Text("SAVE"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
