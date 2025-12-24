

import 'package:expense_app_bloc_db/models/expense_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  AppDataBase._();

  static final AppDataBase db = AppDataBase._();

  /// Tables
  static const String EXPENSE_TABLE = "expense";
  static const String USER_TABLE = "users";

  /// Users columns
  static const String COLUMN_USER_ID = "uId";
  static const String COLUMN_USER_NAME = "uName";
  static const String COLUMN_USER_EMAIL = "uEmail";
  static const String COLUMN_USER_PASS = "uPass";

  /// Expense (note) columns
  /// add uid here also
  static const String COLUMN_EXPENSE_ID = "expId";
  static const String COLUMN_EXPENSE_TITLE = "expTitle";
  static const String COLUMN_EXPENSE_DESC = "expDesc";
  static const String COLUMN_EXPENSE_TIMESTAMP = "expTimeStamp";
  static const String COLUMN_EXPENSE_AMT = "expAmt";
  static const String COLUMN_EXPENSE_BALANCE = "expBal";
  static const String COLUMN_EXPENSE_TYPE = "expType"; // 0 = debit, 1 = credit
  static const String COLUMN_EXPENSE_CAT_TYPE = "expCatType";

  Database? database;

  Future<Database> getDb() async {
    if (database != null) {
      return database!;
    } else {
      database = await initDb();
      return database!;
    }
  }

  Future<Database> initDb() async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    var fullPath = join(documentDirectory.path, "expense.db");

    return await openDatabase(
      fullPath,
      version: 1,
      onCreate: (dbPath, version) async {
        await dbPath.execute('''
  CREATE TABLE $EXPENSE_TABLE (
    $COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    $COLUMN_EXPENSE_TITLE TEXT,
    $COLUMN_EXPENSE_DESC TEXT,
    $COLUMN_EXPENSE_AMT REAL, $COLUMN_EXPENSE_BALANCE REAL,
    $COLUMN_EXPENSE_CAT_TYPE INTEGER, $COLUMN_EXPENSE_TYPE INTEGER, 
    $COLUMN_EXPENSE_TIMESTAMP TEXT,
  )
''');
        await dbPath.execute('''
        CREATE TABLE $USER_TABLE (
        $COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $COLUMN_USER_NAME TEXT,
        $COLUMN_USER_EMAIL TEXT,
        $COLUMN_USER_PASS TEXT,
        )
        ''');
      },
      
    );
  }
  
  void addExpense (ExpenseModel addExpense) async {
     var db = await getDb();
     db.insert(EXPENSE_TABLE, addExpense.toMap());
  }
  
  Future < List<ExpenseModel>> fetchExpense () async {
    var db = await getDb();
    var data = await db.query(EXPENSE_TABLE);
    
    List<ExpenseModel> expenseData = [];
    
    for (var eachData in data){
      expenseData.add(ExpenseModel.fromMap(eachData));
    }
    
    return expenseData;
  }
}
