
import 'package:expense_app_bloc_db/models/category_model.dart';

class AppConstants {

  static final List<CategoryModel> constantCategories = [

    CategoryModel(categoryId: 0, categoryTitle: "Travel", categoryImagePath: "assets/travel.png"),
    CategoryModel(categoryId: 1, categoryTitle: "Tea", categoryImagePath: "assets/cup.png"),
    CategoryModel(categoryId: 2, categoryTitle: "Movie", categoryImagePath: "assets/popcorn.png"),
    CategoryModel(categoryId: 3, categoryTitle: "Health", categoryImagePath: "assets/ambulance.png"),
    CategoryModel(categoryId: 4, categoryTitle: "Fund Transfer", categoryImagePath: "assets/mobile-transfer.png"),
    CategoryModel(categoryId: 5, categoryTitle: "Insurance", categoryImagePath: "assets/life-insurance.png"),
    CategoryModel(categoryId: 6, categoryTitle: "Restaurant", categoryImagePath: "assets/restaurant.png"),
    CategoryModel(categoryId: 7, categoryTitle: "Electricity Bill", categoryImagePath: "assets/electricity-bill.png"),
    CategoryModel(categoryId: 8, categoryTitle: "Education", categoryImagePath: "assets/education.png"),
    CategoryModel(categoryId: 9, categoryTitle: "Savings", categoryImagePath: "assets/piggy-bank.png"),
    CategoryModel(categoryId: 10, categoryTitle: "Others", categoryImagePath: "assets/other.png"),
    CategoryModel(categoryId: 11, categoryTitle: "Salary", categoryImagePath: "assets/salary.png"),
    CategoryModel(categoryId: 12, categoryTitle: "Loan", categoryImagePath: "assets/loan.png"),


  ];

  // final List<Map<String, dynamic>> category = [
  //   {"categoryPic": "assets/travel.png"},
  //   {"categoryPic": "assets/cup.png"},
  //   {"categoryPic": "assets/popcorn.png"},
  //   {"categoryPic": "assets/ambulance.png"},
  //   {"categoryPic": "assets/mobile-transfer.png"},
  //   {"categoryPic": "assets/laundry.png"},
  //   {"categoryPic": "assets/life-insurance.png"},
  //   {"categoryPic": "assets/restaurant.png"},
  //   {"categoryPic" : "assets/electricity-bill.png"},
  //   {"categoryPic" : "assets/education.png"},
  //   {"categoryPic" : "assets/piggy-bank.png"},
  //   {"categoryPic" : "assets/other.png"},
  //   {"categoryPic" : "assets/salary.png"},
  //   {"categoryPic": "assets/loan.png"}
  // ];

}
