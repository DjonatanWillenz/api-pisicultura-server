import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/repository/user.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final repositoty = Get.find<UserRepository>();
  final formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  validate() async {
    if (formKey.currentState!.validate()) {
      if ((username.text != '') && (password.text != '')) {
        await repositoty
            .auth(username.text, password.text, false)
            .then((value) {
          System.getInstance().setUser(value);
          _saveDataAuthMemory(value);
          Get.offAndToNamed(AppRoutes.home);
        }).catchError((err) {
          Get.snackbar('Erro:',
              'Email ou senha incorreto(s), verifique e tente novamente');
        });
      }
    }
  }

  _saveDataAuthMemory(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', user.username);
    prefs.setString('password', user.password);
    prefs.setString('token', user.token);
  }

  sendmail() {
    Get.defaultDialog(
      title: 'Recuperar senha',
      middleText:
          'Deseja enviar um e-mail para verificação de dados do usuário?',
      textConfirm: 'Enviar',
      textCancel: 'Cancelar',
      backgroundColor: Colors.green[100],
      buttonColor: Colors.green,
      barrierDismissible: false,
      onCancel: () => Get.back(),
      onConfirm: () => _sendmail(),
    );
  }

  _sendmail() async {}
}
