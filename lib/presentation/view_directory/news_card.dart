import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';

import '../../data/model/news/NewsModel.dart';

//This card create for get news
class NewsCard extends StatelessWidget {
  NewsCard({Key? key, required this.news}) : super(key: key);

  NewsDataModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
      child: ListTile(
        minVerticalPadding: 5.sp,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        isThreeLine: true,
        tileColor: AppColor.black,
        textColor: AppColor.PrimaryColor,
        style: ListTileStyle.list,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.only(
          left: 1.sp,
        ),
        leading: CircleAvatar(
          radius: 25.sp,
          backgroundImage: NetworkImage(news.imageUrl.toString(), scale: 45.sp),
        ),
        title: DefaultText(text: news.title!),
        horizontalTitleGap: 10.sp,
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(text: news.body!),
            DefaultText(text: news.date!),
          ],
        ),
      ),
    );
  }

  //reduce news body text for the card
  String getCardContent(String content) {
    return content.length > 70 ? '${content.substring(0, 70)}...' : content;
  }
}
