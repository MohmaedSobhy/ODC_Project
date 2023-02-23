import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';
import 'package:work_shop_project/presentation/widgets/text_form_field.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(
          text: "Support",
          color: AppColor.black,
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        backgroundColor: AppColor.white,
        elevation: 2.5.sp,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.h),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              DefaultTextFormField(
                controller: nameController,
                txtHint: "Name",
                PrefixIcon: Icons.person,
                Valided: (value) {
                  if (value.toString().isEmpty) return "Enter Name";

                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultTextFormField(
                controller: emailController,
                txtHint: "Email",
                PrefixIcon: Icons.email,
                Valided: (value) {
                  if (value.toString().isEmpty) return "Enter Email";

                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultTextFormField(
                controller: messageController,
                txtHint: "Message",
                MaxLine: 4,
                Valided: (value) {
                  if (value.toString().isEmpty) return "Enter Your Message";

                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      emailController.text = "";
                      nameController.text = "";
                      messageController.text = "";
                    }
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
