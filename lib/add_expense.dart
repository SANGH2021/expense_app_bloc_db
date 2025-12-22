import 'package:expense_app_bloc_db/app_constants.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  dynamic buttonNameOrPic;

  int categoryTappableId = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.cyan,
        title: Text("Add Expense"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonSizedBox(50),

              commonTextField(
                "Name your Expense",
                Icons.abc,
                TextInputType.text,
              ),

              commonSizedBox(50),
              commonTextField("Add Desc", Icons.abc, TextInputType.text),

              commonSizedBox(50),

              commonTextField(
                "Enter Amount",
                Icons.money,
                TextInputType.number,
              ),

              commonSizedBox(50),
              DropdownButton(
                value: 1,
                items: [
                  DropdownMenuItem(value: 1, child: Text("Debit")),
                  DropdownMenuItem(value: 0, child: Text("Credit")),
                ],
                onChanged: (index) {},
              ),
              commonSizedBox(50),

              commonElevatedButton(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                childWidget: categoryTappableId == -1
                    ? Text("Choose Expense")
                    : SizedBox(height:  35, width: 35,
                      child: Image.asset(
                          AppConstants
                              .constantCategories[categoryTappableId]
                              .categoryImagePath,
                        ),
                    ) ,

                onSelect: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.builder(
                          itemCount: AppConstants.constantCategories.length,

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 4,
                                mainAxisExtent: 82,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFFD1E5EE),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: IconButton(
                                    onPressed: () {
                                      categoryTappableId = index;



                                      setState(() {

                                      });
                                      Navigator.pop(context);
                                    },
                                    icon: Image.asset(
                                      AppConstants
                                          .constantCategories[index]
                                          .categoryImagePath,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              commonSizedBox(10),

              commonElevatedButton(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                childWidget: Text("December 14, 2023"),
                onSelect: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2099),
                  );
                },
              ),
              commonSizedBox(10),
              commonElevatedButton(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                childWidget: Text("ADD Expense"),
                onSelect: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonElevatedButton({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onSelect,
    required Widget childWidget,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelect,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: childWidget,
      ),
    );
  }

  Widget commonSizedBox(double height) => SizedBox(height: height);

  Widget commonTextField(
    String hintText,
    IconData iconData,
    textInputTypeOfKeyBoard,
  ) {
    return TextField(
      keyboardType: textInputTypeOfKeyBoard,

      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: Icon(iconData),
      ),
    );
  }
}
