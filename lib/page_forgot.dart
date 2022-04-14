import 'package:flutter/material.dart';
import 'page_sign_in.dart';
import 'page_chek_email.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // variables
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(color: Colors.lightBlue[50]),
        child: Center(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(color: Colors.black),
          ),
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
                      "Forgot Password",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        // decoration
                        decoration: InputDecoration(
                          // icon: Icon(Icons.email),
                          contentPadding: EdgeInsets.all(5),
                          label: Text("E-Mail"),
                          hintText: "user@mail.com",
                          prefixIcon: Icon(Icons.email),
                          prefixStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          fillColor: Colors.blue[50],
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
                    height: 35,
                    margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: RaisedButton(
                        color: Colors.blue,
                        hoverColor: Colors.blue[400],
                        child: Center(
                            child: Text(
                          "SEND VERIFICATION CODE",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CheckEmail();
                              },
                            ));
                          }
                          ;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Back to ",
                        style: TextStyle(fontSize: 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignIn();
                            },
                          ));
                        },
                        child: Text(
                          "Sign In",
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
