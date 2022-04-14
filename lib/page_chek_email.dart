import 'package:flutter/material.dart';
import 'page_reset_password.dart';
import 'page_sign_in.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
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
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            elevation: 2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Check Your Email!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    "Verification Code Has Been Send",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image.asset(
                    "assets/images/checking_email.jpg",
                    width: 180,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Text(
                    "Go to continue for setting new password\nto your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: RaisedButton(
                      color: Colors.blue,
                      hoverColor: Colors.blue[400],
                      child: Center(
                          child: Text(
                        "CONTINUE",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ResetPassword();
                        }));
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
        )),
      ),
    );
  }
}
