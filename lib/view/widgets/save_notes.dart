import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/model/note_model.dart';
import 'package:mynotes/view_model/note_controller.dart';
import 'package:mynotes/constant/styles.dart';
import 'package:mynotes/constant/type.dart';
import 'package:mynotes/view/creator_note_grid.dart';
import 'package:mynotes/view/splash_screen.dart';
import 'package:mynotes/view/widgets/custom_text.dart';

class AddNotes extends StatelessWidget {
  final ActionType type;
  final String? title;
  final String? desc;
  final String? name;
  const AddNotes(
      {Key? key, required this.type, this.title, this.desc, this.name})
      : super(key: key);

  checking() {
    if (type == ActionType.isView) {
      titleController.text = title!;
      descController.text = desc!;
      nameController.text = name!;
    }
  }

  @override
  Widget build(BuildContext context) {
    checking();
    return GetBuilder<NoteController>(
      init: NoteController(),
      builder: (controller) => ListView(
        children: [
          Styles.kHeight25,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Styles.kGrey,
                ),
              ),
              Text(
                'Add New Notes',
                style: Styles.appTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final desc = descController.text.trim();
                    final name = nameController.text.trim();

                    if (title.isEmpty || desc.isEmpty || name.isEmpty) {
                      Get.snackbar('No Content', 'Please write Anything',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Styles.kWhite);
                      return;
                    } else {
                      final NoteModel notes =
                          NoteModel(name: name, title: title, desc: desc);
                      controller.saveNote(notes);
                      titleController.clear();
                      descController.clear();
                      nameController.clear();
                      Get.back();
                    }
                  },
                  icon: Icon(
                    Icons.save,
                    color: Styles.kWhite,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .9,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                      controller: nameController,
                      text: 'Creater Name',
                      style: Styles.title),
                  CustomText(
                    controller: titleController,
                    text: 'Title',
                    style: Styles.title,
                    mLength: 45,
                  ),
                  Expanded(
                    child: CustomText(
                      controller: descController,
                      text: 'Description',
                      style: Styles.desc,
                      mLine: null,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
