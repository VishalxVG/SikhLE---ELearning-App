import 'package:flutter/material.dart';

class RecomemdedModel {
  String name;
  String iconpath;
  String level;
  String duration;
  bool viewIsSelected;

  RecomemdedModel({
    required this.name,
    required this.iconpath,
    required this.level,
    required this.duration,
    required this.viewIsSelected,
  });

  static List<RecomemdedModel> getRecomendation() {
    List<RecomemdedModel> models = [];

    models.add(RecomemdedModel(
        name: "Integration",
        iconpath: "assets/images/male.svg",
        level: "Beginer",
        duration: "10 Hours",
        viewIsSelected: true));

    models.add(RecomemdedModel(
        name: "Thermodynamics",
        iconpath: "assets/images/female.svg",
        level: "Intermediate",
        duration: "8 Hours",
        viewIsSelected: false));
    models.add(RecomemdedModel(
        name: "Mole Concept",
        iconpath: "assets/images/female.svg",
        level: "Intermediate",
        duration: "8 Hours",
        viewIsSelected: false));

    models.add(RecomemdedModel(
        name: "Python Development",
        iconpath: "assets/images/male.svg",
        level: "Intermediate",
        duration: "8 Hours",
        viewIsSelected: false));

    return models;
  }
}
