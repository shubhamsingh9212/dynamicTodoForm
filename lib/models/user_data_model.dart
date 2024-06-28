import 'dart:convert';

import 'package:flutter/material.dart';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  List<Datum>? data;
  String? userName;

  UserData({
    this.data,
    this.userName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "user_name": userName,
      };
}

class Datum {
  String? fieldType;
  String? fieldTitle;
  String? placeHolder;
  TextEditingController? controller;

  Datum({
    this.fieldType,
    this.fieldTitle,
    this.placeHolder,
    this.controller,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fieldType: json["field_type"],
        fieldTitle: json["field_title"],
        placeHolder: json["place_holder"],
        controller: TextEditingController(),
      );

  Map<String, dynamic> toJson() => {
        "field_type": fieldType,
        "field_title": fieldTitle,
        "place_holder": placeHolder,
        "controller": controller,
      };
}
