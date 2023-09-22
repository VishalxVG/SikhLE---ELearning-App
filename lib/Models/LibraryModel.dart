import 'package:flutter/material.dart';

class LibraryModel {
  String name;
  String iconpath;
  Color boxcolor;

  LibraryModel(
      {required this.name, required this.iconpath, required this.boxcolor});

  static List<LibraryModel> getLibrary() {
    List<LibraryModel> library = [];

    library
        .add(LibraryModel(name: "", iconpath: "", boxcolor: Color(0xff92A3FD)));

    library
        .add(LibraryModel(name: "", iconpath: "", boxcolor: Color(0xffC588F2)));
    library.add(LibraryModel(
        name: "", iconpath: "", boxcolor: Color.fromARGB(255, 114, 229, 166)));
    library.add(LibraryModel(
        name: "", iconpath: "", boxcolor: Color.fromARGB(255, 201, 230, 98)));
    library.add(LibraryModel(
        name: "", iconpath: "", boxcolor: Color.fromARGB(255, 231, 132, 219)));
    library.add(LibraryModel(
        name: "", iconpath: "", boxcolor: Color.fromARGB(255, 239, 163, 118)));

    return library;
  }
}
