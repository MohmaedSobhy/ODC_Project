import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_shop_project/business_logic/notes/notes_status.dart';
import 'package:work_shop_project/data/Local/sql_helperl.dart';
import 'package:intl/intl.dart';
import '../../data/model/note/note.dart';

class NoteCubite extends Cubit<NoteStatus> {
  NoteCubite() : super(NoteInitilaStatus());

  static NoteCubite get(context) => BlocProvider.of(context);
  List<NotesModel> notes = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController decscriptionController = TextEditingController();
  final GlobalKey<FormState> addNoteKey = GlobalKey<FormState>();
  final GlobalKey<FormState> editnotekey = GlobalKey<FormState>();

  Future<dynamic> iniliaze() async {
    HelperSql.db.then((value) {
      emit(DataBaseInitialSuccess());
    }).catchError((error) {
      emit(DataBaseInitilalError());
    });
  }

  // ignore: non_constant_identifier_names
  GetNotes() async {
    notes = await HelperSql.getAllRowsDB();
    emit(GetAllNotes());
  }

  Future<dynamic> editNote(BuildContext context, int id, String title,
      String description, String date) async {
    HelperSql.updateDB(id, title, description, date).then((value) {
      Navigator.pop(context, "NoteScreen");
      emit(UpdateNoteSuccessStatus());
    }).catchError((error) {
      //print("Error + $error");
      emit(UpdateNoteErrorSatus());
    });
  }

  addNote(BuildContext context) async {
    HelperSql.insertDB({
      "Title": titleController.text.toString(),
      "Description": decscriptionController.text.toString(),
      "Date":
          DateFormat("hh:mm a  dd/MM/yyyy").format(DateTime.now()).toString(),
    }).then((value) {
      titleController.text = "";
      decscriptionController.text = "";
      Navigator.of(context).pop();
      emit(AddNoteSuccessStatus());
    }).catchError((error) {
      emit(AddNoteErrorStatus());
    });
  }

  deletNote(NotesModel note) async {
    HelperSql.deleteDB(note.id).then((value) {
      emit(DeleteNoteSuccess());
    }).catchError((error) {
      emit(DeleteNoteSuccess());
    });
  }
}
