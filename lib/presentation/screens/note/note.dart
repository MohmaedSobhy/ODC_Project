import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/business_logic/notes/notes_cubite.dart';
import 'package:work_shop_project/business_logic/notes/notes_status.dart';
import 'package:work_shop_project/presentation/screens/edit_note/edit_note.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:work_shop_project/presentation/view_directory/note_item.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubite, NoteStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          NoteCubite.get(context).GetNotes();
          var notes = NoteCubite.get(context).notes;
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.5.h),
              child: (notes.isEmpty)
                  ? const Center(child: Text("No Data"))
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: ((context, index) {
                        return NoteItem(
                          notesModel: notes[index],
                          deleteFunction: () {
                            NoteCubite.get(context).deletNote(notes[index]);
                          },
                          editeFunction: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return EditNoteScreen(notesModel: notes[index]);
                            }));
                          },
                        );
                      }),
                    ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, "AddNote");
                },
                backgroundColor: AppColor.PrimaryColor,
                child: const Icon(Icons.add)),
          );
        });
  }
}
