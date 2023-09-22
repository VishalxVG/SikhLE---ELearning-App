import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconpath;
  Color boxcolor;

  CategoryModel(
      {required this.name, required this.iconpath, required this.boxcolor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: "Math",
        iconpath: "assets/images/maths.svg",
        boxcolor: const Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Physics',
        iconpath: "assets/images/physics.svg",
        boxcolor: const Color(0xffC588F2),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Chemistry',
        iconpath: "assets/images/chem.svg",
        boxcolor: const Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Computer\nScience',
        iconpath: "assets/images/cs.svg",
        boxcolor: const Color(0xffC58BF2),
      ),
    );
    return categories;
  }
}
