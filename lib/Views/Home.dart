import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientinfo/Models/Patient.dart';
import 'package:patientinfo/Pages/PatientsList/PatientsList.dart';
import 'package:patientinfo/Utils/AuthService.dart';
import 'package:patientinfo/Utils/Util.dart';
import 'package:patientinfo/Widgets/BaseStateWidget.dart';
import 'package:patientinfo/bloc.dart';
import 'package:patientinfo/pages/Another.dart';
import 'package:patientinfo/pages/PatientInfo.dart';
import 'package:patientinfo/utils/AppColors.dart';
import 'package:scaledownbutton/scaledownbutton.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  static Widget newInstance() {
    return ScopedModel<AppBloc>(
      model: AppBloc(),
      child: Home(),
    );
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  int _selectedIndex = 0;
  AppBloc bloc;

  final controller = PageController(initialPage: 0);


  Widget buildNavigationItem(IconData icon, String label, int index) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      constraints: BoxConstraints(minWidth: 270),
      decoration: BoxDecoration(
          color: index == _selectedIndex ? Color(0xff575757) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: index == _selectedIndex ? Colors.white : Colors.grey[800],
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color:
                    index == _selectedIndex ? Colors.white : Colors.grey[800],
                fontSize: 15),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc = ScopedModel.of<AppBloc>(context);
    bloc.init();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: AppColors.borderGrey, width: 2))),
            child: NavigationRail(
              leading: Container(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                width: 300,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: AppColors.borderGrey, width: 2))),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/doctorbackground.png",
                      width: 400,
                      fit: BoxFit.fitWidth,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Smart Care",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 18)),
                        SizedBox(
                          height: 100,
                        ),
                        Text("Good Morning",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w200,
                                color: Colors.blue[200],
                                fontSize: 25)),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Dr. John Doe",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[200],
                                fontSize: 25)),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //            backgroundColor: Color(0xff1B1B1B),
              groupAlignment: -1,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
                if (index == 4) {
//                  AuthService().signOut();
                Navigator.of(context).pop();
                } else {
                  controller.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);
                }
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: buildNavigationItem(Icons.face, "PatientsList", 0),
                  selectedIcon:
                  buildNavigationItem(Icons.face, "PatientsList", 0),
                  label: Container(),
                ),
                NavigationRailDestination(
                  icon: buildNavigationItem(
                      Icons.person_outline, "PatientInfo", 1),
                  selectedIcon:
                      buildNavigationItem(Icons.person, "PatientInfo", 1),
                  label: Container(),
                ),
                NavigationRailDestination(
                  icon: buildNavigationItem(Icons.star_border, "Another", 2),
                  selectedIcon: buildNavigationItem(Icons.star, "Another", 2),
                  label: Container(),
                ),
                NavigationRailDestination(
                  icon: buildNavigationItem(Icons.calendar_today, "Another", 3),
                  selectedIcon:
                      buildNavigationItem(Icons.calendar_today, "Another", 3),
                  label: Container(),
                ),
                NavigationRailDestination(
                  icon: buildNavigationItem(Icons.exit_to_app, "LogOut", 4),
                  selectedIcon:
                      buildNavigationItem(Icons.exit_to_app, "LogOut", 4),
                  label: Container(),
                ),
              ],
            ),
          ),
          // This is the main content.
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.borderGrey, width: 2))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey[700],
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Search patients here ..."),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: searchBarHeight,
                        child: ScaleDownButton(
                          child: Icon(
                            Icons.mail_outline,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: AppColors.borderGrey, width: 2),
                                right: BorderSide(
                                    color: AppColors.borderGrey, width: 2))),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 48,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Dr. John Doe",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[700],
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                )),
                Container(
                  height: screenHeight - searchBarHeight,
                  child: PageView(
                    physics: new NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      PatientsList(onChoosePatient: (i) {
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },),
                      PatientInfo(),
                      AnotherWidget(),
                      AnotherWidget(),
                      AnotherWidget(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
