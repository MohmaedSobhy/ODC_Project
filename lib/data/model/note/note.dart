class NotesModel {
  var id;
  var description;
  var title;
  var date;

  NotesModel({
    this.id,
    required this.description,
    required this.title,
    required this.date,
  });
}
