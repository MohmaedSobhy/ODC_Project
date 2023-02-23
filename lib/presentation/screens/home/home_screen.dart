import 'package:flutter/material.dart';
import 'package:work_shop_project/presentation/view_directory/defaultcard.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.5.w),
        child: ListView(
          children: [
            Image(
              image: const AssetImage(
                "assets/images/logo.png",
              ),
              fit: BoxFit.cover,
              width: 100.w,
              height: 10.h,
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.h,
                  crossAxisSpacing: 2.h,
                  childAspectRatio: 100 / 60),
              children: [
                DefaultCard(
                    text: "Lecture",
                    imagePath: "assets/icons/lecture.svg",
                    OnClicked: () {
                      Navigator.pushNamed(context, "LectureScreen");
                    }),
                DefaultCard(
                  text: "Sections",
                  imagePath: "assets/icons/sections.svg",
                  OnClicked: () {
                    Navigator.pushNamed(context, "SectionsScreen");
                  },
                ),
                DefaultCard(
                    text: "Midterm",
                    imagePath: "assets/icons/midterm.svg",
                    OnClicked: () {
                      Navigator.pushNamed(context, "MidetermScreen");
                    }),
                DefaultCard(
                  text: "Final",
                  imagePath: "assets/icons/final.svg",
                  OnClicked: () {
                    Navigator.pushNamed(context, "FinalScreen");
                  },
                ),
                DefaultCard(
                  text: "Event",
                  imagePath: "assets/icons/event.svg",
                  OnClicked: () {
                    Navigator.pushNamed(context, "EventScreen");
                  },
                ),
                DefaultCard(
                  text: "Notes",
                  imagePath: "assets/icons/notes.svg",
                  OnClicked: () {
                    Navigator.pushNamed(context, "NoteScreen");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
