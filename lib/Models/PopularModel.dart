import 'package:flutter/material.dart';

class PopularModel {
  String name;
  String iconpath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularModel(
      {required this.name,
      required this.iconpath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxIsSelected});

  static List<PopularModel> getPopularDiets() {
    List<PopularModel> popularDiets = [];

    popularDiets.add(
      PopularModel(
        name: "Backend Development",
        iconpath: "assets/images/backend.svg",
        level: "Medium",
        duration: "15 Hours",
        calorie: "1K Student Enrolled",
        boxIsSelected: true,
      ),
    );
    popularDiets.add(
      PopularModel(
        name: "Statistics",
        iconpath: "assets/images/statistics.svg",
        level: "Medium",
        duration: "10 Hours",
        calorie: "2K Student Enrolled",
        boxIsSelected: false,
      ),
    );
    popularDiets.add(
      PopularModel(
        name: "Flutter Development",
        iconpath: "assets/images/flutter.svg",
        level: "Medium",
        duration: "10 Hours",
        calorie: "2K Student Enrolled",
        boxIsSelected: false,
      ),
    );
    popularDiets.add(
      PopularModel(
        name: "Permutation",
        iconpath: "assets/images/integration.svg",
        level: "Medium",
        duration: "10 Hours",
        calorie: "3K Student Enrolled",
        boxIsSelected: false,
      ),
    );

    return popularDiets;
  }
}
