import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_benefits/model/provider/screens.dart';
import 'package:strive_benefits/ui/common_widgets/base_common_widgets.dart';
import 'package:strive_benefits/utils/size_config.dart';

class DrawerPages extends StatefulWidget {
  const DrawerPages({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DrawerPages> createState() => _DrawerPagesState();
}

class _DrawerPagesState extends State<DrawerPages> with BaseCommonWidgets {
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

  Future<bool> _onWillPop() async {
    Provider.of<Screens>(context, listen: false).pop();
    return false;
  }

  Widget _getBody() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: Text(
            widget.title,
            style: textSize40(),
          ),
        ),
      ),
    );
  }
}
