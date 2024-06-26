import 'package:flutter/material.dart';
import 'package:todolist/Animation/fadeAnimation.dart';
import 'package:todolist/db/notes_database.dart';
import 'package:todolist/pages/note_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/model/note.dart';

class Note_Task extends StatefulWidget {
  final Note? note;
  const Note_Task({super.key, this.note});

  @override
  State<Note_Task> createState() => _Note_TaskState();
}

class _Note_TaskState extends State<Note_Task> {
  late String description;
  bool Ison = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF4F6FD),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          child: Column(
            children: [
              FadeAnimation(
                delay: 0.2,
                child: Container(
                  margin: EdgeInsets.only(top: he * 0.05, left: we * 0.73),
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], shape: BoxShape.circle),
                  child: Container(
                    width: 47,
                    height: 47,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF4F6FD),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                  delay: 0.3,
                  child: NoteFormWidget(
                    description: description,
                    onChangedDescription: (description) {
                      setState(() {
                        this.description = description;
                      });
                    },
                  )),
              FadeAnimation(
                  delay: 0.4,
                  child: widget.note?.description == null
                      ? _buildButtonCreate(context)
                      : _buildButtonSave(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCreate(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      width: we * 0.4,
      height: 50,
      margin: EdgeInsets.only(left: we * 0.45),
      child: ElevatedButton(
        onPressed: addNote,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF002FFF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New task",
              style: GoogleFonts.lato(color: Colors.white),
            ),
            SizedBox(width: we * 0.03),
            Icon(
              Icons.expand_less_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSave(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
      width: we * 0.4,
      height: 50,
      margin: EdgeInsets.only(left: we * 0.45),
      child: ElevatedButton(
        onPressed: updateNote,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF002FFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Save",
              style: GoogleFonts.lato(color: Colors.white),
            ),
            SizedBox(width: we * 0.03),
            Icon(
              Icons.edit,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Future addNote() async {
    final note = Note(description: description);
    if (description.isNotEmpty) {
      await NotesDatabase.instance.create(note);
    } else {
      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(description: description);
    await NotesDatabase.instance.update(note);
    Ison = true;
    Navigator.of(context).pop();
  }
}
