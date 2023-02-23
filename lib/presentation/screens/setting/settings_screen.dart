import 'package:flutter/material.dart';
import 'package:work_shop_project/presentation/screens/login/login.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import '../../view_directory/settings.item.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(color: AppColor.black),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          DefaultSettingItem(
              text: "FAQ",
              function: () {
                Navigator.of(context).pushNamed("FAQScreen");
              }),
          const Divider(thickness: 1),
          DefaultSettingItem(
              text: "Terms & Conditions",
              function: () {
                Navigator.of(context).pushNamed("TermCondtionScreen");
              }),
          const Divider(thickness: 1),
          DefaultSettingItem(
              text: "Our Partenrs",
              function: () {
                Navigator.of(context).pushNamed("PartenrsScreen");
              }),
          const Divider(thickness: 1),
          DefaultSettingItem(
              text: "Support",
              function: () {
                Navigator.pushNamed(context, "SupportScreen");
              }),
          const Divider(thickness: 1),
          DefaultSettingItem(text: "Log out", function: ShowMethod),
          const Divider(thickness: 1),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void ShowMethod() {
    showDialog(
        context: scaffoldKey.currentState!.context,
        builder: (context) => AlertDialog(
              title: const Text("Logout"),
              content: const Text("Are you Sure ?"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }), (route) => false);
                    },
                    child: const Text("Sure")),
              ],
            ));
  }
}
