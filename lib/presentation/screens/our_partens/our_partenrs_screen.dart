import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';

class PartenrsScreen extends StatelessWidget {
  const PartenrsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.PrimaryColor,
          ),
        ),
        centerTitle: true,
        title: DefaultText(
            text: 'Our Partners', color: Colors.black, fontSize: 15.sp),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.h),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.grey.shade400,
                    Colors.white,
                    Colors.grey.shade400
                  ],
                )),
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: 'ODC',
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Image(
                  image: const AssetImage("assets/images/logo.png"),
                  width: 100.w,
                  height: 15.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
