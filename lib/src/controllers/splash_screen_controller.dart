import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/repository/settings_repository.dart' as settingRepo;
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreenController extends ControllerMVC {
  ValueNotifier<int> progress = new ValueNotifier(0);
  GlobalKey<ScaffoldState> scaffoldKey;

  SplashScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  @override
  void initState() {
    settingRepo.setting.addListener(() {
      print(settingRepo.setting.value.appName);
      if (settingRepo.setting.value.appName != null && settingRepo.setting.value.mainColor != null) {
        progress.value = 100;
      }
    });
    Timer(Duration(seconds: 20), () {
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.current.verify_your_internet_connection),
      ));
    });

    super.initState();
  }
}
