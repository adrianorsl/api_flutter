import 'package:apidiario/models/journal.dart';
import 'package:apidiario/screens/home_screen/add_journal_screen/add_journal_screen.dart';
import 'package:apidiario/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());

  JournalService service = JournalService();
  //service.register(Journal.empty());
  service.getAll();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.white70)),
          textTheme: GoogleFonts.bitterTextTheme()),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
      },
      onGenerateRoute: ((settings) {
        if (settings.name == "add-journal") {
          final Journal journal = settings.arguments as Journal;
          return MaterialPageRoute(builder: (context) {
            return addJournalScreen(journal: journal);
          });
        }

        return null;
      }),
    );
  }
}
