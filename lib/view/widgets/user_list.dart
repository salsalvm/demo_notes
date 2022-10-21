// import 'package:flutter/material.dart';
// import 'package:mynotes/constant/styles.dart';
// import 'package:mynotes/view_model/note_controller.dart';

// class UserList extends StatelessWidget {
//   final int index;
//   final NoteController controller;
//   const UserList({
//     required this.controller,
//     required this.index,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: GestureDetector(
//           onTap: () {
//             controller.viewNotes(controller.setNotes[index].name);
//           },
//           child: Card(
//             shadowColor: Styles.kGrey,
//             shape: RoundedRectangleBorder(
//               borderRadius: Styles.kRadius10,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.person,
//                     size: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: Text(
//                       controller.setNotes[index].name,
//                       style: Styles.customTitle,
//                     ),
//                   ),
//                   const Spacer(),
//                   CircleAvatar(
//                     radius: 17,
//                     backgroundColor: Styles.kTransparant,
//                     child: Text(
//                       '${controller.number[index]}',
//                       style: Styles.customTitle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
