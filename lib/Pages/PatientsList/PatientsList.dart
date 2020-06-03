import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientinfo/Pages/PatientsList/ListItem.dart';
import 'package:patientinfo/Utils/AppColors.dart';
import 'package:patientinfo/Utils/Util.dart';
import 'package:patientinfo/bloc.dart';
import 'package:scoped_model/scoped_model.dart';


class PatientsList extends StatefulWidget {
  final Function(int index) onChoosePatient;

  const PatientsList({Key key, this.onChoosePatient}) : super(key: key);
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList>
    with AutomaticKeepAliveClientMixin {
  
  int selectedPatient = 0;
  AppBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ScopedModel.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
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
              width: 1000,
              height: 700,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Patients List",
                    style: GoogleFonts.montserrat(
                        color: AppColors.lightGrey,
                        fontSize: 40,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: Util.patients.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: index == selectedPatient ? AppColors.lightGrey.withOpacity(0.3) : Colors.transparent,
                                border: Border(top: BorderSide(width: 0.5, color: AppColors.borderGrey))
                            ),
                            child: PatientItem(patient: Util.patients[index], onTap: () {
                              setState(() {
                                selectedPatient = index;
                                widget.onChoosePatient(index);
                                bloc.patientObject.add(Util.patients[index]);
                              });
                            },),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
