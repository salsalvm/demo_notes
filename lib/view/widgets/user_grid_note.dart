// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mynotes/constant/styles.dart';
// import 'package:mynotes/constant/type.dart';
// import 'package:mynotes/view/widgets/add_notes.dart';
// import 'package:mynotes/view_model/note_controller.dart';

// class UserGridNotes extends StatelessWidget {
//   const UserGridNotes({
//     Key? key,
//     required this.controller,
//     required this.index,
//     required this.randomeColor,
//   }) : super(key: key);
//   final int index;
//   final NoteController controller;
//   final int randomeColor;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onDoubleTap: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           backgroundColor: Styles.kBlack,
//           context: context,
//           builder: (ctx) {
//             return AddNotes(
//               type: ActionType.isView,
//               title: controller.userNotes[index].title,
//               desc: controller.userNotes[index].title,
//               name: controller.userNotes[index].name,
//             );
//           },
//         );
//       },
//       child: Card(
//         color: Styles.cardsColor[randomeColor],
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: Text(
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       controller.userNotes[index].title,
//                       style: Styles.customTitle,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       Get.defaultDialog(
//                         backgroundColor: Styles.kWhite,
//                         buttonColor: Styles.kWhite,
//                         middleText: 'Do you Want to Delete',
//                         onConfirm: () {
//                           controller.deleteUser(controller.userNotes[index].id);
//                           controller.update();
//                           Get.back();
//                         },
//                         title: 'Are You Sure',
//                         onCancel: () {
//                           Get.back();
//                         },
//                       );
//                     },
//                     icon: Icon(
//                       Icons.delete,
//                       color: Styles.kError,
//                     ),
//                   )
//                 ],
//               ),
//               Flexible(
//                 child: Text(
//                   maxLines: 10,
//                   overflow: TextOverflow.ellipsis,
//                   controller.userNotes[index].desc,
//                   style: Styles.customDesc,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
