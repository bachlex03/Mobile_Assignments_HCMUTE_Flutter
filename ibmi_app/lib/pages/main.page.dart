import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/pages/history.page.dart';
import 'package:ibmi_app/pages/ibmi.page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [IBMIPage(), HistoryPage()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("IBMI"),
        automaticBackgroundVisibility: false,
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon((CupertinoIcons.home)),
            ),
            BottomNavigationBarItem(
              label: "History",
              icon: Icon((CupertinoIcons.time)),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return _pages[index];
            },
          );
        },
      ),
    );
  }
}
