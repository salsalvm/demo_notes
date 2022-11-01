import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/res/components/styles.dart';
import 'package:mynotes/res/type.dart';
import 'package:mynotes/main.dart';
import 'package:mynotes/view/splash_screen.dart';
import 'package:mynotes/view/widgets/save_notes.dart';
import 'package:mynotes/view/widgets/creator_list.dart';
import 'package:mynotes/view_model/note_controller.dart';

class ScreenCreatorList extends StatelessWidget {
  const ScreenCreatorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users List'),
        leading: IconButton(
            onPressed: () {
              Get.defaultDialog(
                backgroundColor: Styles.kWhite,
                buttonColor: Styles.kWhite,
                middleText: 'Do you Want to clear this box',
                onConfirm: () {
                  box.clear();
                  Get.back();
                },
                title: 'Are You Sure',
                onCancel: () {
                  Get.back();
                },
              );
            },
            icon: const Icon(Icons.clear)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Styles.kHeight15,
            SizedBox(
              height: size.height,
              child: GetBuilder<NoteController>(
                init: NoteController(),
                builder: (controller) {
                  controller.myNotes.removeWhere((item) => item.name == '');
                  return controller.setNotes == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        )
                      : controller.setNotes.isEmpty
                          ? Center(
                              child: Text(
                                'No User Available',
                                style: Styles.desc,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: CreatorList(
                                            index: index,
                                            controller: controller),
                                      ),
                                    );
                                  },
                                  itemCount: controller.myNotes.length
                                  ),
                            );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 10),
              child: Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Styles.kBlack,
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Styles.kBlack,
                      context: context,
                      builder: (ctx) {
                        return const AddNotes(
                          type: ActionType.isAdd,
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
