import 'package:flutter/material.dart';
import 'success_reset.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //variables
  final _formKey = GlobalKey<FormState>();

  // controller
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(),
        child: Center(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.54,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            elevation: 2,
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          label: Text("New Password"),
                          hintText: "-----",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Container(padding: EdgeInsets.only(right: 10), child: Icon(Icons.remove_red_eye_outlined)),
                          prefixStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        controller: _pass,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Field is Empty";
                          } else if (value.length < 8) {
                            return "Password less than 8 Characters";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
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
                          label: Text("Confirm Password"),
                          hintText: "-----",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Container(padding: EdgeInsets.only(right: 10), child: Icon(Icons.remove_red_eye_outlined)),
                          prefixStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        controller: _confirmPass,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Field is Empty";
                          } else if (value.length < 8) {
                            return "Password less than 8 Characters";
                          } else if (value != _pass.text) {
                            return "Password and New Password Must be Match";
                          }
                          return null;
                        },
                        obscureText: true,
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
                                return SuccessResetPassword();
                              },
                            ));
                          }
                          ;
                        }),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
