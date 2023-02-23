import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';

class TermCondtionScreen extends StatelessWidget {
  const TermCondtionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          "Terms And Conditions",
          style: TextStyle(color: AppColor.black),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColor.black,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.h),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 1.h),
              child: Column(
                children: [
                  DefaultText(
                    text: "Terms and Condtion",
                    color: AppColor.black,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(text: ""),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
