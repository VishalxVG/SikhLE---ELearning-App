import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sikhle/Models/LibraryModel.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({super.key});

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {
  List<LibraryModel> library = [];

  void _getInitialInfo() {
    library = LibraryModel.getLibrary();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff92A3FD),
        title: const Text(
          "Unlock the World of Knowledge ",
          style: TextStyle(),
        ),
      ),
      body: ListView(
        children: [
          SearchField(),
          const SizedBox(
            height: 15,
          ),
          _regionalContent(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column _regionalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 130),
          child: Text(
            "Regional Content",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
              itemCount: library.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: ((context, index) => const SizedBox(
                    width: 25,
                  )),
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: ((context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: library[index].boxcolor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container(
                      //   width: 50,
                      //   height: 50,
                      //   decoration: const BoxDecoration(
                      //     color: Colors.white,
                      //   ),
                      //   // child: Padding(
                      //   //   padding: const EdgeInsets.all(8.0),
                      //   //   child:
                      //   //       SvgPicture.asset(library[index].iconpath),
                      //   // ),
                      // ),
                      Text(
                        library[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }

  Container SearchField() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Courses',
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/images/Search.svg'),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset('assets/images/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
