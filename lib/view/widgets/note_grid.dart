
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/constant/styles.dart';
import 'package:mynotes/view_model/note_controller.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({
    Key? key,
    required this.randomeColor,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final int randomeColor;
  final int index;
  final NoteController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Styles.cardsColor[randomeColor],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      middleText: 'Do you Want to Delete',
                      onConfirm: () {
                        controller.deleteUser(
                            controller.userNotes[index].id, index);
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
    );
  }
}
