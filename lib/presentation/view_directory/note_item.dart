import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:work_shop_project/data/model/note/note.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:date_format/date_format.dart';

class NoteItem extends StatelessWidget {
  NoteItem(
      {super.key,
      required this.notesModel,
      required this.editeFunction,
      required this.deleteFunction});

  NotesModel notesModel;
  var editeFunction;
  var deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notesModel.title.toString(),
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  notesModel.date,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            IconButton(
              onPressed: editeFunction,
              icon: Icon(
                Icons.edit,
                color: AppColor.orange,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            IconButton(
              onPressed: deleteFunction,
              icon: Icon(
                Icons.delete,
                color: AppColor.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
