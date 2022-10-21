import 'package:get/get.dart';
import 'package:mynotes/main.dart';
import 'package:mynotes/model/note_model.dart';
import 'package:mynotes/view/user_note_screen.dart';

class NoteController extends GetxController {
  List<NoteModel> myNotes = <NoteModel>[];

  int minus = 0;
  List<int> number = <int>[];
  List<String> setNotes = <String>[];
  List<NoteModel> userNotes = <NoteModel>[];

  // -------- add notes ---------
  Future<void> addNote(NoteModel notes) async {
    int id = await box.add(notes);
    final idNotes = NoteModel(
        name: notes.name, title: notes.title, desc: notes.desc, id: id);
    box.put(id, idNotes);
    await box.add(idNotes);

    getNotes();
    update();
  }
  // -------- get notes ---------

  getNotes() {
    myNotes.clear();
    box.values.toList();
    myNotes.addAll(box.values);
    getUniqueUser();
    update();
  }
  // -------- delete notes ---------

  Future<void> deleteUser(int id, int index) async {
    box.delete(id);
    userNotes.removeAt(index);
    getNotes();

    update();
  }

  // -------- view  notes ---------

  viewNotes(String userName) async {
    userNotes = myNotes
        .toList()
        .where(
          (element) => element.name.toLowerCase().contains(
                userName.toLowerCase(),
              ),
        )
        .toList();
    Get.to(
      ScreenUserNotes(user: userName),
    );
  }
  // -------- count & notes ---------

  getUniqueUser() async {
    for (var i = 0; i < myNotes.length; i++) {
      int count = 1;

      for (var j = i + 1; j < myNotes.length; j++) {
        if (myNotes[i].name == myNotes[j].name &&
            i != j &&
            myNotes[j].name != '') {
          count++;

          // myNotes[j] = NoteModel(name: '', title: '', desc: '');
          minus++;
        }
      }
      if (count != 0) {
        setNotes.add(myNotes[i].name);
        number.add(count);
      }
    }

    update();
  }

  @override
  void onInit() {
    getNotes();
    getUniqueUser();

    super.onInit();
  }
}
