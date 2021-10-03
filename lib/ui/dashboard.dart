import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_benefits/model/provider/screens.dart';
import 'package:strive_benefits/ui/common_widgets/base_common_widgets.dart';
import 'package:strive_benefits/utils/app_constant.dart';
import 'package:strive_benefits/utils/size_config.dart';

import 'drawer_pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with BaseCommonWidgets {
  @override
  void initState() {
    Provider.of<Screens>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          SizeConfig().init(ctx, constraints);
          return _getBody();
        },
      ),
    );
  }

  Widget _getBody() {
    return Scaffold(
      appBar: AppBar(),
      drawer: _drawer(),
      body: Consumer<Screens>(builder: (context, value, child) {
        return value.currentScreen;
      }),
      bottomNavigationBar: Consumer<Screens>(builder: (context, value, child) {
        return _bottomNavigationBar(value);
      }),
    );
  }

  Widget _bottomNavigationBar(Screens value) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppConstant.bottomBarBackgroundColor,
      selectedItemColor: AppConstant.bottomBarSelectedItemColor,
      unselectedItemColor: AppConstant.bottomBarUnselectedItemColor,
      currentIndex: value.currentIndex,
      onTap: (index) {
        Provider.of<Screens>(context, listen: false).updateIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: AppConstant.home),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: AppConstant.feed),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: AppConstant.settings),
        BottomNavigationBarItem(
            icon: Icon(Icons.face), label: AppConstant.profile),
      ],
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView.builder(
          itemCount: AppConstant.drawerMenuCount,
          itemBuilder: (context, index) {
            return _listItem("${AppConstant.view}${index + 1}");
          }),
    );
  }

  Widget _listItem(String item) {
    return ListTile(
      title: Text(
        item,
        style: textSize18(),
      ),
      onTap: () {
        Navigator.pop(context);
        Provider.of<Screens>(context, listen: false)
            .push(DrawerPages(title: item));
      },
    );
  }
}
