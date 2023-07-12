import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/app/global/constants/responsive.dart';
import 'package:mobile/app/routes/app_pages.dart';

class MenuModel {
  String icon;
  String title;
  String router;
  MenuModel({required this.icon, required this.title, required this.router});
}

class DxDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DxDrawer({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<DxDrawer> {
  List<MenuModel> menu = [
    MenuModel(
      icon: 'assets/icons/Dashboard.svg',
      title: "Inicio",
      router: AppRoutes.initial,
    ),
    MenuModel(
      icon: 'assets/icons/profile.svg',
      title: "Perfil",
      router: AppRoutes.profile,
    ),
    MenuModel(
      icon: 'assets/icons/setting.svg',
      title: "Configurações",
      router: AppRoutes.settings,
    ),
    MenuModel(
      icon: 'assets/icons/history.svg',
      title: "Agendamentos",
      router: "",
    ),
    MenuModel(
      icon: 'assets/icons/signout.svg',
      title: "Sair",
      router: AppRoutes.auth,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color(0xFF171821),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: SizedBox(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture:
                    const Icon(Icons.account_circle, size: 80),
                accountName: Text(
                  System.getInstance().getUser().getName(),
                  style: const TextStyle(fontSize: 17),
                ),
                accountEmail: Text(
                  System.getInstance().getUser().getEmail(),
                  style: const TextStyle(fontSize: 14),
                ),
                decoration: BoxDecoration(
                  color:
                      ThemeData().drawerTheme.backgroundColor?.withOpacity(0.1),
                ),
              ),
              SizedBox(
                height: Responsive.isMobile(context) ? 40 : 80,
              ),
              for (var i = 0; i < menu.length; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(menu[i].router);
                      widget.scaffoldKey.currentState!.closeDrawer();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 7),
                          child: SvgPicture.asset(menu[i].icon,
                              color: Colors.white),
                        ),
                        Text(
                          menu[i].title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
