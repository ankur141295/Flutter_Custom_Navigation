import 'package:flutter/material.dart';
import 'package:strive_benefits/utils/size_config.dart';

class BaseCommonWidgets {
  TextStyle textSize40() {
    return TextStyle(
      fontSize: SizeConfig.setSp(40),
    );
  }

  TextStyle textSize18() {
    return TextStyle(
      fontSize: SizeConfig.setSp(18),
    );
  }
}
