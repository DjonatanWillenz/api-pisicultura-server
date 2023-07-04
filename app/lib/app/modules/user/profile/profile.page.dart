import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/components/scaffold.dart';
import 'package:mobile/app/modules/user/profile/profile.controller.dart';

class ProfilePage extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DScaffold(
      scaffoldKey: _scaffoldKey,
      body: Container(
        child: Center(
          child: Text("TESTE"),
        ),
      ),
    );
  }
}
