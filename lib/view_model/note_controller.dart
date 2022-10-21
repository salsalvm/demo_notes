import 'package:get/get.dart';
import 'package:mynotes/main.dart';
import 'package:mynotes/model/note_model.dart';
import 'package:mynotes/view/creator_list_screen.dart';
import 'package:mynotes/view/creator_note_grid.dart';

class NoteController extends GetxController {
  List<NoteModel> myNotes = <NoteModel>[];
  List<NoteModel> orgNotes = <NoteModel>[];

  int minus = 0;
  List<int> number = <int>[].obs;
  List<String> setNotes = <String>[];
  List<NoteModel> userNotes = <NoteModel>[];

  // -------- save notes ---------
  Future<void> saveNote(NoteModel notes) async {
    int id = await box.add(notes);
    final idNotes = NoteModel(
        name: notes.name, title: notes.title, desc: notes.desc, id: id);
    box.put(id, idNotes);

    getNotes();
    update();
  }
  // -------- get notes ---------

  getNotes() {
    myNotes.clear();
    orgNotes.clear();
    box.values.toList();
    myNotes.addAll(box.values);
    for (var element in myNotes) {
      orgNotes.add(element);
    }
    orgNotes.addAll(box.values);
    getUniqueUser();
    update();
  }
  // -------- delete notes ---------

  Future<void> deleteUser(int id, int index) async {
    box.delete(id);

    getNotes();
    getUniqueUser();
    Get.offAll(const ScreenCreatorList());
    update();
  }

  // -------- view  notes ---------

  viewNotes(String userName) async {
    final redundant = orgNotes.toSet().toList();

    userNotes = redundant
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
    for (var i = 0; i < userNotes.length; i++) {}
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

          myNotes[j] = NoteModel(name: '', title: '', desc: '');
          minus++;
        }
      }
      // if (myNotes[i].name != '') {
        setNotes.add(myNotes[i].name);
        number.add(count);
      // }
    }

    update();
  }

  @override
  void onReady() {
    getNotes();
    getUniqueUser();
    super.onReady();
  }

  @override
  void onInit() {
    getNotes();
    getUniqueUser();

    super.onInit();
  }
}
