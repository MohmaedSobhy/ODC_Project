import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/business_logic/notes/notes_cubite.dart';
import 'package:work_shop_project/business_logic/notes/notes_status.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/widgets/defaulttxt.dart';
import 'package:work_shop_project/presentation/widgets/text_form_field.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubite, NoteStatus>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          title: DefaultText(
            text: "Add Note",
            color: AppColor.black,
            fontSize: 20.sp,
          ),
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          leading: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.h),
          child: Form(
            key: NoteCubite.get(context).addNoteKey,
            child: Column(
              children: [
                DefaultTextFormField(
                  controller: NoteCubite.get(context).titleController,
                  txtHint: "Title",
                  Valided: (value) {
                    if (value.toString().isEmpty) return "Enter Title";

                    return null;
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                DefaultTextFormField(
                  controller: NoteCubite.get(context).decscriptionController,
                  txtHint: "Description",
                  MaxLine: 4,
                  Valided: (value) {
                    if (value.toString().isEmpty) {
                      return "Enter Description";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (NoteCubite.get(context)
                          .addNoteKey
                          .currentState!
                          .validate()) {
                        NoteCubite.get(context).addNote(context);
                      }
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
