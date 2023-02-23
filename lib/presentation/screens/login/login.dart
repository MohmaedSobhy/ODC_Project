import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/business_logic/Auth/login/loginup_cubite.dart';
import 'package:work_shop_project/business_logic/Auth/login/loginup_state.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/text_form_field.dart';
import '../../widgets/defaulttxt.dart';
import '../register/regesiter.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubite, LoginState>(
        builder: (context, state) {
          var loginCubite = LoginCubite.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.h),
              child: Form(
                key: loginCubite.loginkey,
                child: ListView(
                  children: [
                    Image(
                      image: const AssetImage(
                        "assets/images/logo.png",
                      ),
                      width: 20.w,
                      height: 22.h,
                      fit: BoxFit.fill,
                    ),
                    DefaultText(
                      text: "Login",
                      color: AppColor.black,
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                        controller: loginCubite.emailController,
                        Valided: (value) {
                          if (value.toString().isEmpty) return "Enter Email";

                          return null;
                        },
                        txtHint: "E-mail"),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                      controller: loginCubite.passwordController,
                      txtHint: "Password",
                      MaxLine: 1,
                      Valided: (value) {
                        if (value.toString().isEmpty) return "Enter Password";

                        return null;
                      },
                      IsObscure: loginCubite.isPassword,
                      sufficesPressed: () {
                        loginCubite.showPassword();
                      },
                      SuffixIcon: loginCubite.icon,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Text(
                        "Forget Password ?",
                        style: TextStyle(
                            color: AppColor.orange,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.deepOrange),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // if server work remove comment
                          // if (loginCubite.loginkey.currentState!.validate()) {
                          //   loginCubite.loginData(context);
                          // }
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "AppLayout", (route) => false);

// remove both line if server work
                          loginCubite.emailController.text = "";
                          loginCubite.passwordController.text = "";
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 15),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 3.h,
                            thickness: 1,
                            color: AppColor.black,
                          ),
                        ),
                        DefaultText(
                          text: "OR",
                          color: AppColor.PrimaryColor,
                        ),
                        Expanded(
                          child: Divider(
                            height: 3.h,
                            thickness: 1,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: AppColor.orange))),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return RegsisterScreen();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style:
                              TextStyle(color: AppColor.orange, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
