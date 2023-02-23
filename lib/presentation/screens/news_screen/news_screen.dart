//This screen use for get news
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';
import '../../../business_logic/news/news_cubit.dart';
import '../../../business_logic/news/news_state.dart';
import '../../view_directory/news_card.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        NewsCubit myCubit = NewsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: DefaultText(
                text: "News",
                fontSize: 28,
                color: AppColor.black,
              ),
            ),
            body: Conditional.single(
              context: context,
              conditionBuilder: (_) =>
                  myCubit.newsModel != null &&
                  myCubit.newsModel!.data!.isNotEmpty,
              widgetBuilder: (_) => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  SizedBox(height: 8.sp),
                  Expanded(
                      child: ListView.builder(
                    itemCount: myCubit.newsModel!.data!.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        news: myCubit.newsModel!.data![index],
                      );
                    },
                  ))
                ]),
              ),
              fallbackBuilder: (_) => Center(
                child: CircularProgressIndicator(
                  color: AppColor.PrimaryColor,
                ),
              ),
            ));
      },
    );
  }
}
