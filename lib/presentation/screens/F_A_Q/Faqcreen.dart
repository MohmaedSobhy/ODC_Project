import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: true,
          title: const Text(
            "FAQ",
            style: TextStyle(color: Colors.black),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.5.w),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  check = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'Q1:How many countries Orange Digital center is in?',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    body: Center(
                      child: Text(
                        "16 Country",
                        style: TextStyle(color: AppColor.black),
                      ),
                    ),
                    isExpanded: check,
                    backgroundColor: AppColor.white),
              ],
            ),
          ),
        ));
  }
}
