import 'package:flutter/material.dart';
import 'page_forgot.dart';
import 'page_sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // variables
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.deepPurple[100],
        decoration: BoxDecoration(),
        child: Center(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.58,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Card(
            elevation: 15,
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "Sign In Page",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        // decoration
                        decoration: InputDecoration(
                          // icon: Icon(Icons.email),
                          contentPadding: EdgeInsets.all(5),
                          label: Text("E-Mail"),
                          hintText: "user@mail.com",
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixStyle: TextStyle(color: Colors.deepPurple[100], fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.deepPurple[50],
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is Empty";
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        // decoration
                        decoration: InputDecoration(
                            // icon: Icon(Icons.email),
                            contentPadding: EdgeInsets.all(10),
                            label: Text("Password"),
                            hintText: "-----",
                            prefixIcon: Icon(Icons.lock_outline),
                            prefixStyle: TextStyle(color: Colors.transparent, fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Container(padding: EdgeInsets.only(right: 10), child: Icon(Icons.remove_red_eye_outlined)),
                            filled: true,
                            fillColor: Colors.deepPurple[100]),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Field is Empty";
                          } else if (value.length < 8) {
                            return "Password less than 8 Characters";
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (data) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ForgotPassword();
                            },
                          ));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 10),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    height: 35,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: RaisedButton(
                        color: Colors.deepPurple,
                        hoverColor: Colors.deepPurple[300],
                        child: Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) ;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Dont have an account? ",
                        style: TextStyle(fontSize: 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
