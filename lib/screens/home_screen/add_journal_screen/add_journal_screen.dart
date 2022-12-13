import 'package:apidiario/helpers/weekday.dart';
import 'package:apidiario/models/journal.dart';
import 'package:apidiario/services/journal_service.dart';
import 'package:flutter/material.dart';

class addJournalScreen extends StatelessWidget {
  final Journal journal;
  addJournalScreen({Key? key, required this.journal}) : super(key: key);
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${WeekDay(journal.createdAt.weekday).long}, ${journal.createdAt.day}  |  ${journal.createdAt.month}  |  ${journal.createdAt.year}"),
        actions: [
          IconButton(
              onPressed: () {
                registerJournal(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) async {
    String content = _contentController.text;

    journal.content = content;

    JournalService service = JournalService();
    bool result = await service.register(journal);

    Navigator.pop(context, result);
  }
}
