import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_shop_project/business_logic/Auth/login/loginup_cubite.dart';
import 'package:work_shop_project/business_logic/Auth/signup/singup_cubite.dart';
import 'package:work_shop_project/business_logic/news/news_cubit.dart';
import 'package:work_shop_project/business_logic/notes/notes_cubite.dart';
import 'package:work_shop_project/data/Local/cache_helper.dart';
import 'package:work_shop_project/data/Local/sql_helperl.dart';
import 'package:work_shop_project/data/Remote/dio_helper.dart';
import 'package:work_shop_project/presentation/AppLayout/app_layout.dart';
import 'package:work_shop_project/presentation/screens/F_A_Q/Faqcreen.dart';
import 'package:work_shop_project/presentation/screens/addnote/add_note.dart';
import 'package:work_shop_project/presentation/screens/event/event.dart';
import 'package:work_shop_project/presentation/screens/finals/final.dart';
import 'package:work_shop_project/presentation/screens/lecture/lecture.dart';
import 'package:work_shop_project/presentation/screens/login/login.dart';
import 'package:work_shop_project/presentation/screens/midterm/mditerm.dart';
import 'package:work_shop_project/presentation/screens/news_screen/news_screen.dart';
import 'package:work_shop_project/presentation/screens/note/note.dart';
//import 'package:work_shop_project/presentation/screens/login/login.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/screens/our_partens/our_partenrs_screen.dart';
import 'package:work_shop_project/presentation/screens/register/regesiter.dart';
import 'package:work_shop_project/presentation/screens/sections/section.dart';
import 'package:work_shop_project/presentation/screens/setting/settings_screen.dart';
import 'package:work_shop_project/presentation/screens/splash_screen/splash_screen.dart';
import 'package:work_shop_project/presentation/screens/support/support.dart';
import 'package:work_shop_project/presentation/screens/terms_conditons/term_conditons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  await HelperSql.initialDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: ((context) => SignupCubit())),
            BlocProvider(create: ((context) => LoginCubite())),
            BlocProvider(create: (((context) => NewsCubit()..getNews()))),
            BlocProvider(create: (((context) => NoteCubite()..GetNotes()))),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Register',
            theme: ThemeData(
              elevatedButtonTheme: const ElevatedButtonThemeData(
                  style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
              )),
            ),
            home: const SplashScreen(),
            routes: {
              "LoginScreen": ((context) => LoginScreen()),
              "RegsisterScreen": ((context) => RegsisterScreen()),
              "AppLayout": (((context) => const AppLayout())),
              "NoteScreen": ((context) => const NoteScreen()),
              "LectureScreen": ((context) => const LectureScreen()),
              "EventScreen": ((context) => const EventScreen()),
              "FinalScreen": ((context) => const FinalScreen()),
              "SectionsScreen": ((context) => const SectionScreen()),
              "MidetermScreen": ((context) => const MidtermScreen()),
              "AddNote": ((context) => AddNote()),
              "SupportScreen": ((context) => SupportScreen()),
              "FAQScreen": ((context) => const FAQScreen()),
              "TermCondtionScreen": (((context) => const TermCondtionScreen())),
              "NewsScreen": (((context) => const NewsScreen())),
              "PartenrsScreen": ((context) => const PartenrsScreen())
            },
          ),
        );
      },
    );
  }
}
