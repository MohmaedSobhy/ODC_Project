import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_shop_project/business_logic/Auth/signup/signup_state.dart';
import 'package:work_shop_project/business_logic/Auth/signup/singup_cubite.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';
import 'package:work_shop_project/presentation/widgets/text_form_field.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class RegsisterScreen extends StatelessWidget {
  RegsisterScreen({super.key});
  String password = "";

  @override
  Widget build(BuildContext context) {
    var signCubite = SignupCubit.get(context);
    return BlocBuilder<SignupCubit, SignupState>(
      builder: ((context, state) {
        return Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.h),
          child: Form(
            key: signCubite.signupKey,
            child: ListView(
              children: [
                Image(
                  image: const AssetImage(
                    "assets/images/logo.png",
                  ),
                  width: 20.w,
                  height: 25.h,
                  fit: BoxFit.fill,
                ),
                DefaultText(
                  text: "Register",
                  color: AppColor.PrimaryColor,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                  controller: signCubite.nameController,
                  txtHint: "Name",
                  Valided: (value) {
                    if (value.toString().isEmpty) {
                      return "Enter Your Name ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                  controller: signCubite.emailController,
                  txtHint: "Email",
                  Valided: (value) {
                    if (value.toString().isEmpty) return "Enter Email";

                    return null;
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    controller: signCubite.passwordController,
                    txtHint: "Password",
                    IsObscure: signCubite.visiblePassword,
                    MaxLine: 1,
                    sufficesPressed: () {
                      signCubite.changePasswordVisibility();
                    },
                    Valided: (value) {
                      if (value.toString().length < 4) {
                        return "Password more then 4";
                      }
                      password = value;
                      return null;
                    },
                    SuffixIcon: signCubite.passwordIcon),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    controller: signCubite.confimPasswordController,
                    txtHint: "Confirm password",
                    IsObscure: signCubite.visibleConfirmPassword,
                    MaxLine: 1,
                    sufficesPressed: () {
                      signCubite.changeConfirmPasswordVisiblity();
                    },
                    Valided: (value) {
                      if (value.toString() != password) {
                        return "Confirm Password Should Equal Password";
                      }
                      return null;
                    },
                    SuffixIcon: signCubite.confirmIcon),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                  controller: signCubite.phoneController,
                  txtHint: "phone",
                  Valided: (value) {
                    if (value.toString().isEmpty) return "Enter your Phone ";
                    return null;
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        DefaultText(
                          text: "Gender",
                          fontSize: 15.sp,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.PrimaryColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: ["male", "female"].map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                signCubite.gender = value.toString();
                              },
                              value: signCubite.gender,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      if (signCubite.signupKey.currentState!.validate()) {
                        //signCubite.postSignup(context);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "AppLayout", (route) => false);
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 3.h,
                        color: AppColor.PrimaryColor,
                      ),
                    ),
                    DefaultText(
                      text: "OR",
                      color: AppColor.PrimaryColor,
                    ),
                    Expanded(
                      child: Divider(
                        height: 3.h,
                        color: AppColor.PrimaryColor,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: AppColor.PrimaryColor, fontSize: 12.sp),
                    ))
              ],
            ),
          ),
        ));
      }),
    );
  }
}
