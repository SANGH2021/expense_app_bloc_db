import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  


  final List<Map<String, dynamic>> category = [
    {"categoryPic": "assets/travel.png"},
    {"categoryPic": "assets/cup.png"},
    {"categoryPic": "assets/popcorn.png"},
    {"categoryPic": "assets/ambulance.png"},
    {"categoryPic": "assets/mobile-transfer.png"},
    {"categoryPic": "assets/laundry.png"},
    {"categoryPic": "assets/life-insurance.png"},
    {"categoryPic": "assets/restaurant.png"},
  ];

  dynamic buttonNameOrPic;

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

              commonTextField("Name your Expense", Icons.abc,TextInputType.text,),

              commonSizedBox(50),
              commonTextField("Add Desc", Icons.abc,TextInputType.text),

              commonSizedBox(50),

              commonTextField("Enter Amount", Icons.money,TextInputType.number),

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
                buttonNameOrPic != null ? buttonNameOrPic : "Choose Expense",
                buttonNameOrPic !=null ? Color(0xFFD1E5EE) : Colors.black,
                Colors.white,
                () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.builder(
                          itemCount: category.length,

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
                                      buttonNameOrPic = SizedBox(height: 35, width: 35,child: Image.asset(category[index]['categoryPic']));

                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    icon: Image.asset(
                                      category[index]["categoryPic"],
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
                "December 14, 2023",
                Colors.white,
                Colors.black,
                () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2099),
                  );
                },
              ),
              commonSizedBox(10),
              commonElevatedButton(
                "ADD Expense",
                Colors.black,
                Colors.white,
                () {},
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget commonElevatedButton(
    buttonNameOrPic,
    Color backgroundColor,
    Color foregroundColor,
    onSelect,
  ) {
    return SizedBox(

      width: double.infinity,
      child: ElevatedButton(

        onPressed: onSelect,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: buttonNameOrPic is String ? Text(buttonNameOrPic) : buttonNameOrPic,
      ),
    );
  }


  Widget commonSizedBox(double height) => SizedBox(height: height);

  Widget commonTextField(String hintText, IconData iconData, TextInputType) {
    return TextField(
      keyboardType: TextInputType,

      decoration: InputDecoration(

        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: Icon(iconData),
      ),
    );
  }
}
