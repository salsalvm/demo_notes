import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mynotes/res/components/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/model/note_model.dart';
import 'package:mynotes/view/splash_screen.dart';

final box = Hive.box<NoteModel>('activities');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('activities');
  runApp(
    const MyNote(),
  );
}

class MyNote extends StatelessWidget {
  const MyNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: Styles.kBlack,
        primarySwatch: Colors.blue,
        backgroundColor: Styles.kBlack,
      ),
      home: const ScreenSplash(),
    );
  }
}
