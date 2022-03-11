import 'package:flutter/material.dart';
import 'package:app_spacex/core/manager/launch_manager.dart';
import 'package:app_spacex/core/manager/company_manager.dart';
import 'package:app_spacex/ui/pages/launch_list_page.dart';
import 'package:app_spacex/core/model/list_type.dart';
import 'package:app_spacex/ui/company_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: <Widget>[
                          IconButton(
                              onPressed: () async {
                                var company = await CompanyManager().getCompany();

                                if (company != null) {
                                await Navigator.of(context).pushNamed(
                                  CompanyDetail.route,
                                  arguments: CompanyDetailArguments(company: company));
                                }
                              },
                              icon: const Icon(Icons.home)
                            )
                        ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                label: "Upcomings",
                icon: Icon(Icons.list),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.red,
                )),
            BottomNavigationBarItem(
                label: "Previous",
                icon: Icon(Icons.list),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.red,
                )),
            BottomNavigationBarItem(
                label: "Favorites",
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
            _pageController.animateToPage(_currentIndex,
                duration: kThemeAnimationDuration, curve: Curves.ease);
          },
        ),
        body: FutureBuilder(
          future: LaunchManager().initData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView(
                controller: _pageController,
                children: const [
                  LaunchListPage(type: ListType.upcomings),
                  LaunchListPage(type: ListType.previous),
                  LaunchListPage(type: ListType.favorites)
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
