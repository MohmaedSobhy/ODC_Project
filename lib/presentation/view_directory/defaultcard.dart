import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';

// ignore: must_be_immutable
class DefaultCard extends StatelessWidget {
  final String text;
  final String imagePath;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var OnClicked;
  DefaultCard({
    super.key,
    required this.text,
    required this.imagePath,
    required this.OnClicked,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnClicked,
      child: Card(
        elevation: 10.sp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(7.sp),
              child: CircleAvatar(
                radius: 20.sp,
                backgroundColor: Colors.grey.withOpacity(0.4),
                child: SvgPicture.asset(
                  imagePath,
                  width: 10.w,
                ),
              ),
            ),
            DefaultText(
              text: text,
              color: AppColor.orange,
              fontSize: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}
