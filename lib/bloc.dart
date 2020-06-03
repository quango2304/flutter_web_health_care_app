import 'package:patientinfo/Models/Patient.dart';
import 'package:patientinfo/Utils/Util.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scoped_model/scoped_model.dart';

class AppBloc extends Model{
  BehaviorSubject patientObject = BehaviorSubject<Patient>();
  ValueStream<Patient> get patientStream =>
      patientObject.stream;

  void init() {
    patientObject.add(Util.patients[0]);
  }

  void dispose() {
    patientObject.close();
  }
}