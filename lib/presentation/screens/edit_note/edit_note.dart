import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/data/model/note/note.dart';
import 'package:work_shop_project/presentation/view_directory/cutom_note.dart';
import '../../../business_logic/notes/notes_cubite.dart';
import '../../../business_logic/notes/notes_status.dart';
import '../../styles/app_colors.dart';
import '../../widgets/defaulttxt.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({super.key, required this.notesModel});
  NotesModel notesModel;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubite, NoteStatus>(
        listener: (context, state) {},
        builder: ((context, state) {
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: AppBar(
              title: DefaultText(
                text: "Edite Note",
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
                key: NoteCubite.get(context).editnotekey,
                child: Column(
                  children: [
                    CustomNotesTextField(
                        labelText: "Title",
                        hintText: "Title",
                        startValue: notesModel.title,
                        validation: (value) {
                          if (value.toString().isEmpty) return "Enter Title";
                          return null;
                        },
                        onChanged: (value) {
                          title.text = value;
                          print(value);
                        },
                        maxLines: 1,
                        editController: title),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    CustomNotesTextField(
                        labelText: "Description",
                        hintText: "Description",
                        startValue: notesModel.description,
                        validation: (value) {
                          if (value.isEmpty) {
                            return "Enter Description";
                          }
                        },
                        onChanged: (value) {
                          description.text = value;
                        },
                        maxLines: 4,
                        editController: description),
                    ElevatedButton(
                        onPressed: () {
                          if (NoteCubite.get(context)
                              .editnotekey
                              .currentState!
                              .validate()) {
                            NoteCubite.get(context).editNote(
                                context,
                                notesModel.id,
                                title.text == ""
                                    ? notesModel.title
                                    : title.text,
                                description.text == ""
                                    ? notesModel.description
                                    : description.text,
                                DateFormat("hh:mm a      dd/MM/yyyy")
                                    .format(DateTime.now())
                                    .toString());
                          }
                        },
                        child: const Text(
                          "Edite",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
