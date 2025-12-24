import 'package:expense_app_bloc_db/app_database.dart';

class UserModel {
  int userID;
  String userName;
  String userEmail;
  String userPassword;

  UserModel({
    required this.userID,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userID: map[AppDataBase.COLUMN_USER_ID],
      userName: map[AppDataBase.COLUMN_USER_NAME],
      userEmail: map[AppDataBase.COLUMN_USER_EMAIL],
      userPassword: map[AppDataBase.COLUMN_USER_PASS],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppDataBase.COLUMN_USER_ID: userID,
      AppDataBase.COLUMN_USER_NAME: userName,
      AppDataBase.COLUMN_USER_EMAIL: userEmail,
      AppDataBase.COLUMN_USER_PASS: userPassword,
    };
  }
}
