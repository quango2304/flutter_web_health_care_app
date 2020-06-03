import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientinfo/Utils/AuthService.dart';
import 'package:patientinfo/Views/Home.dart';
import 'package:patientinfo/utils/AppColors.dart';
import 'package:scaledownbutton/scaledownbutton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        "assets/login.png",
                      ))),
              padding: EdgeInsets.all(20),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Smart Health",
                        style: GoogleFonts.montserrat(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F0F5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.person_outline,
                              color: Color(0xff858388),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  onChanged: (text) {
                                    email = text;
                                  },
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 20,
                                          bottom: 13,
                                          top: 11,
                                          right: 15),
                                      hintStyle: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff858388),
                                          fontSize: 12),
                                      hintText: "Email"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F0F5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.lock,
                              color: Color(0xff858388),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  onChanged: (text) {
                                    password = text;
                                  },
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 20,
                                          bottom: 13,
                                          top: 11,
                                          right: 15),
                                      hintStyle: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff858388),
                                          fontSize: 12),
                                      hintText: "Password"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ScaleDownButton(
                        onTap: () async {
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => Home.newInstance()));
//                          final result =
//                              await AuthService().signIn(email, password);
//                          if (result) {
//                            Scaffold.of(context).showSnackBar(SnackBar(
//                              backgroundColor: Colors.blue,
//                              content: Text(
//                                "Login Success",
//                                style: GoogleFonts.montserrat(
//                                    fontWeight: FontWeight.w300,
//                                    color: Colors.white,
//                                    fontSize: 20),
//                              ),
//                            ));
//                          } else {
//                            Scaffold.of(context).showSnackBar(SnackBar(
//                              backgroundColor: Colors.red,
//                              content: Text(
//                                "Wrong email or password!",
//                                style: GoogleFonts.montserrat(
//                                    fontWeight: FontWeight.w300,
//                                    color: Colors.white,
//                                    fontSize: 20),
//                              ),
//                            ));
//                          }
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
