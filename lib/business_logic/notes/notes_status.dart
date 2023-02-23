abstract class NoteStatus {}

class NoteInitilaStatus extends NoteStatus {}

class DataBaseInitialSuccess extends NoteStatus {}

class DataBaseInitilalError extends NoteStatus {}

class AddNoteSuccessStatus extends NoteStatus {}

class AddNoteErrorStatus extends NoteStatus {}

class UpdateNoteSuccessStatus extends NoteStatus {}

class UpdateNoteErrorSatus extends NoteStatus {}

class GetAllNotes extends NoteStatus {}

class DeleteNoteSuccess extends NoteStatus {}

class DeleteNoteError extends NoteStatus {}
