import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work_shop_project/business_logic/Auth/login/loginup_state.dart';
import 'package:work_shop_project/data/Remote/dio_helper.dart';
import 'package:work_shop_project/data/model/login/login_model.dart';
import 'package:work_shop_project/presentation/constantents/end_points.dart';
import 'package:work_shop_project/presentation/screens/home/home_screen.dart';

import '../../../data/Local/cache_helper.dart';

class LoginCubite extends Cubit<LoginState> {
  LoginCubite() : super(LoingInitilaState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  IconData icon = Icons.visibility_off_outlined;

  static LoginCubite get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  showPassword() {
    isPassword = !isPassword;
    icon = (isPassword) ? Icons.visibility_off_rounded : Icons.visibility;
    emit(VisiblePassword());
  }

  Future loginData(context) async {
    var json = {
      "email": emailController.value,
      "password": passwordController.value
    };
    DioHelper.postData(url: EndPoint.loginEndPoint, data: json).then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Successfully Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => const HomeScreen())),
            (route) => false);
      }
      var userLogin = LoginModel.fromJson(value.data);
      CacheHelper.put(key: 'token', value: userLogin.data!.accessToken);
      emit(LoginSuccessState());
    }).catchError((error) {
      CacheHelper.put(key: 'token', value: "Hello User");
      emailController.text = "";
      passwordController.text = "";
      emit(LoginErrorState());
    });
  }

  enterEmail() {
    emit(EnterEmail());
  }
}
