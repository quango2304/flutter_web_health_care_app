import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientinfo/Models/Patient.dart';
import 'package:patientinfo/Utils/AppColors.dart';

class PatientItem extends StatefulWidget {
  final Patient patient;
  final Function onTap;

  const PatientItem({Key key, this.patient, this.onTap}) : super(key: key);

  @override
  _PatientItemState createState() => _PatientItemState();
}

class _PatientItemState extends State<PatientItem> {
  DecorationImage image;


  @override
  void initState() {
    super.initState();
    image = DecorationImage(
        fit: BoxFit.cover,
        image: MemoryImage(
          base64Decode(widget.patient.emotions[0].imageBase64),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Emotion firstEmotion = widget.patient.emotions[0];
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 30),
        child: Row(
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: image),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(firstEmotion.userName, style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black.withOpacity(0.7)),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("lastest emotion: ", style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black.withOpacity(0.5))),
                    Text(firstEmotion.emotion, style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.lightGrey)),
                    SizedBox(width: 20,),
                    Text("gender: ", style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black.withOpacity(0.5))),
                    Text("male", style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.lightGrey)),
                    SizedBox(width: 20,),Text("age: ", style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black.withOpacity(0.5))),
                    Text("44", style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.lightGrey)),
                    SizedBox(width: 20,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
