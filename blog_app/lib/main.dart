import 'package:flutter/material.dart';
import 'features/profile/profile_index.dart';

// import 'drawer_header.dart';
// import 'pages/articles_page.dart';
// import 'pages/profile_page.dart';
// import 'pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.profile;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.profile) {
      container = const ProfilePage();
    } else if (currentPage == DrawerSections.settings) {
      container = const SettingsPage();
    } else if (currentPage == DrawerSections.articles) {
      container = const ArticlePage();
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 99),
            child: IconButton(
              icon:  Icon(
                Icons.more_horiz,
                color: Colors.black,
                
              ),
              onPressed: () {},
              
            ),
          )
        ],
      ),
      drawer: Drawer(
        width: 270.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MyDrawerHeader(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
      body: container,
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      height: MediaQuery.of(context).size.height - 270,
      color: const Color.fromRGBO(68, 76, 91, 1),
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              menuItem(1, "Profile", Icons.person_outline,
                  currentPage == DrawerSections.profile ? true : false),
                  
              menuItem(2, "Settings", Icons.settings_outlined,
                  currentPage == DrawerSections.settings ? true : false),
              const Divider(
                color: Colors.white,
              ),
              menuItem(3, "Articles", Icons.article_outlined,
                  currentPage == DrawerSections.articles ? true : false),
            ],
          ),
          // const SizedBox(
          //   height: 100,
          // ),

          Column(
            children: [
              const Divider(
                color: Colors.white,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Icon(
                          Icons.exit_to_app,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Log out",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Color.fromARGB(167, 101, 97, 97) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.profile;
            } else if (id == 2) {
              currentPage = DrawerSections.settings;
            } else if (id == 3) {
              currentPage = DrawerSections.articles;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                  width: 15,
                ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  profile,
  settings,
  articles,
}
