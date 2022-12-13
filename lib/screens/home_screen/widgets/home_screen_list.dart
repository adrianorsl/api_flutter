import '../../../models/journal.dart';
import 'journal_card.dart';

List<JournalCard> generateListJournalCards({
  required int windowPage,
  required DateTime currentDay,
  required Map<String, Journal> database,
  required Function refreshFunction,
}) {
  // Cria uma lista de Cards vazios
  List<JournalCard> list = List.generate(
    windowPage + 1,
    (index) => JournalCard(
      refreshFunction: refreshFunction,
      showedDate: currentDay.add(Duration(
        days: (windowPage) - index,
      )),
    ),
  );

  //Preenche os espaços que possuem entradas no banco
  database.forEach((key, value) {
    if (value.createdAt.isAfter(currentDay.add(Duration(days: windowPage)))) {
      int difference = value.createdAt
          .difference(currentDay.add(Duration(days: windowPage)))
          .inDays
          .abs();

      list[difference] = JournalCard(
        refreshFunction: refreshFunction,
        showedDate: list[difference].showedDate,
        journal: value,
      );
    }
  });
  return list;
}
