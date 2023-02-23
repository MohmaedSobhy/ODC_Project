import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_shop_project/business_logic/Auth/signup/signup_state.dart';
import 'package:work_shop_project/data/Remote/dio_helper.dart';
import 'package:work_shop_project/presentation/constantents/end_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work_shop_project/presentation/screens/login/login.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confimPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  String gender = 'male';
  bool visiblePassword = true;
  bool visibleConfirmPassword = true;
  IconData passwordIcon = Icons.visibility_off_outlined;
  IconData confirmIcon = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    passwordIcon =
        (visiblePassword) ? Icons.visibility_off_outlined : Icons.visibility;
    emit(VisiblePasswordState());
  }

  void changeConfirmPasswordVisiblity() {
    visibleConfirmPassword = !visibleConfirmPassword;
    confirmIcon = (visibleConfirmPassword)
        ? Icons.visibility_off_outlined
        : Icons.visibility;
    emit(VisibleConfirmPasswordState());
  }

  void changeGender(val) {
    gender = val;
    emit(ChangeGenderState());
  }

  Future postSignup(context) async {
    var json = {
      "name": nameController.value,
      "email": emailController.value,
      "password": passwordController.value,
      "phonNumber": phoneController.value,
      "gender": gender == 'male' ? 'm' : 'f',
    };
    DioHelper.postData(url: EndPoint.registerEndPoint, data: json)
        .then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Successfully Signup",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => LoginScreen())),
            (route) => false);
      }
      emit(GetSingupSuccessState());
    }).catchError((error) {
      // print("Error : $error");
      emit(GetSingupErrorState());
    });
  }
}
