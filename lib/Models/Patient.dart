// To parse this JSON data, do
//
//     final patients = patientsFromJson(jsonString);

import 'dart:convert';

List<Patient> patientsFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromMap(x)));

String patientsToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Patient {
  final List<Emotion> emotions;

  Patient({
    this.emotions,
  });

  factory Patient.fromMap(Map<String, dynamic> json) => Patient(
    emotions: json["dates"] == null
        ? null
        : List<Emotion>.from(json["dates"].map((x) => Emotion.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "dates": emotions == null
        ? null
        : List<dynamic>.from(emotions.map((x) => x.toMap())),
  };
}

class Emotion {
  final String imageBase64;
  final String userName;
  final String emotion;
  final String date;

  Emotion({
    this.imageBase64,
    this.userName,
    this.emotion,
    this.date,
  });

  factory Emotion.fromMap(Map<String, dynamic> json) => Emotion(
    imageBase64: json["imageBase64"] == null ? null : json["imageBase64"],
    userName: json["userName"] == null ? null : json["userName"],
    emotion: json["emotion"] == null ? null : json["emotion"],
    date: json["date"] == null ? null : json["date"],
  );

  Map<String, dynamic> toMap() => {
    "imageBase64": imageBase64 == null ? null : imageBase64,
    "userName": userName == null ? null : userName,
    "emotion": emotion == null ? null : emotion,
    "date": date == null ? null : date,
  };
}