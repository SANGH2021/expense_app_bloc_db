import 'package:expense_app_bloc_db/app_database.dart';

class ExpenseModel {
  int expenseID;
  String expenseTitle;
  num expenseAmount;
  String expenseDisc;
  String expenseTimeStamp;
  num expenseBalance;
  int categoryType;
  int expenseType;

  ExpenseModel({
    required this.expenseID,
    required this.expenseTitle,
    required this.expenseAmount,
    required this.expenseDisc,
    required this.expenseTimeStamp,
    required this.expenseBalance,
    required this.categoryType,
    required this.expenseType,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      expenseID: map[AppDataBase.COLUMN_EXPENSE_ID],
      expenseTitle: map[AppDataBase.COLUMN_EXPENSE_TITLE],
      expenseAmount: map[AppDataBase.COLUMN_EXPENSE_AMT],
      expenseDisc: map[AppDataBase.COLUMN_EXPENSE_DESC],
      expenseTimeStamp: map[AppDataBase.COLUMN_EXPENSE_TIMESTAMP],
      expenseBalance: map[AppDataBase.COLUMN_EXPENSE_BALANCE],
      categoryType: map[AppDataBase.COLUMN_EXPENSE_CAT_TYPE],
      expenseType: map[AppDataBase.COLUMN_EXPENSE_TYPE],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppDataBase.COLUMN_EXPENSE_TITLE: expenseTitle,
      AppDataBase.COLUMN_EXPENSE_AMT: expenseAmount,
      AppDataBase.COLUMN_EXPENSE_DESC: expenseDisc,
      AppDataBase.COLUMN_EXPENSE_TIMESTAMP: expenseTimeStamp,
      AppDataBase.COLUMN_EXPENSE_BALANCE: expenseBalance,
      AppDataBase.COLUMN_EXPENSE_CAT_TYPE: categoryType,
      AppDataBase.COLUMN_EXPENSE_TYPE: expenseType,
    };
  }
}
