import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strive_benefits/ui/common_widgets/base_common_widgets.dart';
import 'package:strive_benefits/utils/app_constant.dart';
import 'package:strive_benefits/utils/size_config.dart';

class BottomBarPages extends StatefulWidget {
  const BottomBarPages({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BottomBarPages> createState() => _BottomBarPagesState();
}

class _BottomBarPagesState extends State<BottomBarPages>
    with BaseCommonWidgets {
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
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppConstant.areYouSure),
        content: const Text(AppConstant.doYouWantToExit),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppConstant.no),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                Navigator.pop(context);
              }
            },
            child: const Text(AppConstant.yes),
          ),
        ],
      ),
    ));
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
