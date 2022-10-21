import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/constant/styles.dart';
import 'package:mynotes/constant/type.dart';
import 'package:mynotes/view/widgets/add_notes.dart';
import 'package:mynotes/view/widgets/user_grid_note.dart';
import 'package:mynotes/view_model/note_controller.dart';

TextEditingController descController = TextEditingController();
TextEditingController titleController = TextEditingController();
TextEditingController nameController = TextEditingController();

class ScreenUserNotes extends StatelessWidget {
  final String user;
  const ScreenUserNotes({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      init: NoteController(),
      builder: (controller) => controller.myNotes == null
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : controller.myNotes.isEmpty
              ? Center(
                  child: Text(
                    'No Notes Available',
                    style: Styles.desc,
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      user,
                      style: Styles.appTitle,
                    ),
                  ),
                  body: SafeArea(
                    child: SizedBox(
                      child: GridView.builder(
                        itemCount: controller.userNotes.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.2 / 1,
                        ),
                        itemBuilder: (context, index) {
                          Random rColor = Random();
                          int randomeColor = rColor.nextInt(9 - 1);
                          return GestureDetector(
                            onDoubleTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Styles.kBlack,
                                context: context,
                                builder: (ctx) {
                                  return AddNotes(
                                    type: ActionType.isView,
                                    title: controller.userNotes[index].title,
                                    desc: controller.userNotes[index].title,
                                    name: controller.userNotes[index].name,
                                  );
                                },
                              );
                            },
                            child: Card(
                              color: Styles.cardsColor[randomeColor],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            controller.userNotes[index].title,
                                            style: Styles.customTitle,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              backgroundColor: Styles.kWhite,
                                              buttonColor: Styles.kWhite,
                                              middleText:
                                                  'Do you Want to Delete',
                                              onConfirm: () {
                                                controller.deleteUser(
                                                    controller
                                                        .userNotes[index].id,
                                                    index);
                                                controller.update();
                                                Get.back();
                                              },
                                              title: 'Are You Sure',
                                              onCancel: () {
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Styles.kError,
                                          ),
                                        )
                                      ],
                                    ),
                                    Flexible(
                                      child: Text(
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        controller.userNotes[index].desc,
                                        style: Styles.customDesc,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                          // UserGridNotes(
                          //     randomeColor: randomeColor,
                          //     index: index,
                          //     controller: controller);
                        },
                      ),
                    ),
                  ),
                ),
    );
  }
}
