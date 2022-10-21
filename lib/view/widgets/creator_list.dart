import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mynotes/constant/styles.dart';
import 'package:mynotes/view_model/note_controller.dart';

class CreatorList extends StatelessWidget {
  final int index;
  final NoteController controller;
  const CreatorList({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.viewNotes(controller.setNotes[index]);
      },
      child: Card(
        shadowColor: Styles.kGrey,
        shape: RoundedRectangleBorder(
          borderRadius: Styles.kRadius10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.person,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  controller.myNotes[index].name,
                  style: Styles.customTitle,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 17,
                backgroundColor: Styles.kTransparant,
                child: Obx(
                  () => Text(
                    '${controller.number[index]}',
                    style: Styles.customTitle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
