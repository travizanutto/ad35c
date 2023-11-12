import 'package:sqlite3/sqlite3.dart';

class DatabaseService {
  final Database db = sqlite3.open('./main.db');

}
