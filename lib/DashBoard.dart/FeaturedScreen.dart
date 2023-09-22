import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sikhle/DashBoard.dart/account.dart';
import 'package:sikhle/DashBoard.dart/downloads.dart';
import 'package:sikhle/DashBoard.dart/library.dart';
import 'package:sikhle/DashBoard.dart/search.dart';
import 'package:sikhle/DashBoard.dart/test.dart';
import 'package:sikhle/Models/PopularModel.dart';
import 'package:sikhle/Models/RecomemnedModel.dart';
import 'package:sikhle/Models/categoryModel.dart';
import 'package:sikhle/pages/OnboardingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  List<CategoryModel> categories = [];
  List<RecomemdedModel> models = [];
  List<PopularModel> popular = [];

  int _currentPageIndex = 0;

  final List<Widget> _tabs = [
    const LibraryTab(),
    const TestTab(),
    SearchTab(),
    const DownloadTab(),
    const AccountTab(),
  ];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    models = RecomemdedModel.getRecomendation();
    popular = PopularModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      key: scaffoldkey,
      appBar: _Appbar(),
      backgroundColor: Colors.white,
      // body: _MainScrrenMethod(),

      drawer: _drawerMethod(context),
      // bottomNavigationBar: _bottomNavigationButton(),
      bottomNavigationBar: _NavigationBarMethod(),
      body: <Widget>[
        _MainScrrenMethod(),
        const TestTab(),
        DownloadTab(),
        AccountTab(),
      ][_currentPageIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _FloatingActionButton(context),
    );
  }

  NavigationBar _NavigationBarMethod() {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.star),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.amp_stories_rounded),
          label: 'Practice',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.star),
          icon: Icon(Icons.download_for_offline_rounded),
          label: 'Download',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.star),
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      onDestinationSelected: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      indicatorColor: const Color(0xff92A3FD),
      selectedIndex: _currentPageIndex,
    );
  }

  ListView _MainScrrenMethod() {
    return ListView(
      children: [
        _searchField(),
        const SizedBox(
          height: 10,
        ),
        _categoryModel(),
        const SizedBox(
          height: 10,
        ),
        _RecomemdedModel(),
        const SizedBox(
          height: 20,
        ),
        _PopularModel(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Drawer _drawerMethod(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xffC588F2).withOpacity(0.5),
              ),
              child: const Text(
                'SikhLe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('Carrier'),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const ListTile(
              leading: Icon(Icons.language),
              title: Text('Change Language'),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const ListTile(
              leading: Icon(Icons.person_pin),
              title: Text('Help and Support'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }

  Container _FloatingActionButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 20),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return LibraryTab();
              },
            ),
          );
        },
        child: const Icon(Icons.local_library),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationButton() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff92A3FD),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Home",
            backgroundColor: const Color(0xff92A3FD)),
        BottomNavigationBarItem(
            icon: Icon(Icons.amp_stories_rounded),
            label: "Practice",
            backgroundColor: const Color(0xff92A3FD)),
        BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_rounded),
            label: "Downloads",
            backgroundColor: const Color(0xff92A3FD)),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Account",
            backgroundColor: const Color(0xff92A3FD)),
      ],
      currentIndex: _currentPageIndex,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
    );
  }

  Column _PopularModel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Popular",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemBuilder: ((context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: popular[index].boxIsSelected
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: popular[index].boxIsSelected
                    ? [
                        BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.07),
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0)
                      ]
                    : [],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popular[index].iconpath,
                    height: 65,
                    width: 65,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popular[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        popular[index].level +
                            ' | ' +
                            popular[index].duration +
                            ' | ' +
                            popular[index].calorie,
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (() {}),
                    child: SvgPicture.asset(
                      'assets/images/button.svg',
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            );
          }),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 15,
              )),
          itemCount: popular.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20, right: 20),
        )
      ],
    );
  }

  Column _RecomemdedModel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recomended\nFor You",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: ((context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: categories[index].boxcolor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      models[index].iconpath,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      children: [
                        Text(
                          models[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          models[index].level + ' | ' + models[index].duration,
                          style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            models[index].viewIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            models[index].viewIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: models[index].viewIsSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 25,
                )),
            itemCount: models.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _categoryModel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
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
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: ((context, index) => const SizedBox(
                    width: 25,
                  )),
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: ((context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxcolor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconpath),
                        ),
                      ),
                      Text(
                        categories[index].name,
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

  AppBar _Appbar() {
    return AppBar(
        title: const Text(
          "SikhLe",
          style: TextStyle(
            color: const Color(0xff92A3FD),
            fontSize: 22,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          color: const Color(0xff92A3FD),
          icon: const Icon(Icons.arrow_right),
          iconSize: 40,
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
        ));
  }

  Container _searchField() {
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
