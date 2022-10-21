import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/constant/styles.dart';
import 'package:mynotes/constant/type.dart';
import 'package:mynotes/view/splash_screen.dart';
import 'package:mynotes/view/widgets/add_notes.dart';
import 'package:mynotes/view/widgets/user_list.dart';
import 'package:mynotes/view_model/note_controller.dart';

class ScreenUserList extends StatelessWidget {
  const ScreenUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users List'),
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
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.viewNotes(
                                                controller.setNotes[index]);
                                          },
                                          child: Card(
                                            shadowColor: Styles.kGrey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: Styles.kRadius10,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.person,
                                                    size: 30,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0),
                                                    child: Text(
                                                      controller
                                                          .myNotes[index].name,
                                                      style: Styles.customTitle,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  CircleAvatar(
                                                    radius: 17,
                                                    backgroundColor:
                                                        Styles.kTransparant,
                                                    child: Text(
                                                      '${controller.number[index]}',
                                                      style: Styles.customTitle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                    // UserList(
                                    //     index: index, controller: controller);
                                  },
                                  itemCount: controller.myNotes.length
                                  // -
                                  //     controller.minus
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
