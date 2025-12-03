import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

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

              CommonTextField("Name your Expense", Icons.abc),

              commonSizedBox(50),
              CommonTextField("Add Desc", Icons.abc),

              commonSizedBox(50),

              CommonTextField("Enter Amount", Icons.money),

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
              CommonElevatedButton(
                "Choose Expense",
                Colors.black,
                Colors.white,
              ),
              commonSizedBox(10),

              CommonElevatedButton(
                "December 14, 2023",
                Colors.white,
                Colors.black,
              ),
              commonSizedBox(10),
              CommonElevatedButton("ADD Expense", Colors.black, Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget CommonElevatedButton(
    String childText,
    Color backgroundColor,
    Color foregroundColor,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: Text(childText),
      ),
    );
  }

  Widget commonSizedBox(double height) => SizedBox(height: height);

  Widget CommonTextField(String hintText, IconData iconData) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: Icon(iconData),
      ),
    );
  }
}
