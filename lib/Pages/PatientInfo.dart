import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientinfo/Models/Patient.dart';
import 'package:patientinfo/Utils/Util.dart';
import 'package:patientinfo/Utils/Extensions.dart';
import 'package:patientinfo/Widgets/BaseStateWidget.dart';
import 'package:patientinfo/bloc.dart';
import 'package:patientinfo/utils/AppColors.dart';
import 'package:scaledownbutton/scaledownbutton.dart';
import 'package:scoped_model/scoped_model.dart';

class PatientInfo extends StatefulWidget {
  const PatientInfo({Key key}) : super(key: key);
  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends BaseState<PatientInfo>
    with AutomaticKeepAliveClientMixin {
  AppBloc bloc;
  var data = [
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0
  ];
  int selectedEmotion = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: bloc.patientStream,
      builder: (context, snapshot) {
        final Patient patient = snapshot.data ?? Util.patients[0];
        return Container(
            padding: EdgeInsets.only(left: 60),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFlexible0(patient),
                buildFlexible1(patient),
                buildFlexible2(patient),
                buildFlexible3(patient)
              ],
            ));
      },
    );
  }

  Container buildFlexible0(Patient patient) {
    return Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Patients",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black)),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text("Mr. ${patient.emotions[0].userName}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey)),
              ],
            ),
          );
  }

  Flexible buildFlexible3(Patient patient) {
    return Flexible(
        flex: 4,
        child: Container(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "ECG Data",
                    style: GoogleFonts.montserrat(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    height: 80.0,
                    width: screenWidth - 600,
                    child: Sparkline(
                      pointsMode: PointsMode.last,
                      lineColor: Colors.pink,
                      data: data,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Flexible buildFlexible2(Patient patient) {
    return Flexible(
        flex: 4,
        child: Container(
          height: (screenHeight - searchBarHeight) * 0.4,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScaleDownButton(
                scale: 0.05,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(15)),
                  width: 200,
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Pulse",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent,
                            size: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("122",
                              style: GoogleFonts.montserrat(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("BPM",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w200)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/coronavirus.png",
                        width: 150,
                        height: 100,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              ScaleDownButton(
                scale: 0.05,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: AppColors.lightGrey.withOpacity(0.5),
                          width: 1.5),
                      borderRadius: BorderRadius.circular(15)),
                  width: 200,
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Weight",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Icon(
                            Icons.adjust,
                            color: Colors.redAccent,
                            size: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("65",
                              style: GoogleFonts.montserrat(
                                  fontSize: 40,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w200)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("kgs",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w200)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/linechart.png",
                        width: 150,
                        height: 100,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightGrey, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                width: 600,
                height: 300,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Emotions",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                        Spacer(),
                        Icon(
                          Icons.tag_faces,
                          color: Colors.redAccent,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 2),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: MemoryImage(
                                        base64Decode(patient.emotions[0].imageBase64)
                                      ))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              patient.emotions[selectedEmotion].emotion.capitalize(),
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 300,
                          height: 200,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColors.lightGrey.withOpacity(0.5),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListView.builder(
                            itemCount: patient.emotions.length,
                              itemBuilder: (context, index) {
                            return Container(
                              color: index == selectedEmotion ? AppColors.lightGrey.withOpacity(0.3) : Colors.transparent,
                              child: ListTile(
                                onTap: () {
                                    setState(() {
                                      selectedEmotion = index;
                                    });
                                },
                                selected: index == selectedEmotion,
                                title: Text(patient.emotions[index].emotion.capitalize(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 15,  color: AppColors.black),),
                                subtitle: Text(DateTime.now().toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontSize: 12,  color: AppColors.lightGrey)),
                                trailing: Image.asset("assets/${patient.emotions[index].emotion}.png", width: 20, height: 20,),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ));
  }

  Flexible buildFlexible1(Patient patient) {
    return Flexible(
        flex: 4,
        child: Container(
//              height: (screenHeight - searchBarHeight) / 3,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.5), width: 5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: MemoryImage(
                          base64Decode(patient.emotions[0].imageBase64)
                        ))),
              ),
              SizedBox(
                width: 45,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Patient",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Mr. ${patient.emotions[0].userName}",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 33,
                          color: AppColors.black.withOpacity(0.5))),
                  SizedBox(
                    height: 20,
                  ),
                  ScaleDownButton(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "VIEW PROFILE",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800]),
                      ),
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sex:",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Text(
                        "Age:",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "32",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Text(
                        "Blood:",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "B+",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 1,
                color: Colors.grey[100],
                height: 80,
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Check-in:",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "24 Feb, 2020",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dept:",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Cardiology",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Text(
                        "Bed #:",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "0747",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 150,
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    bloc = ScopedModel.of<AppBloc>(context);
  }

  @override
  bool get wantKeepAlive => true;
}
