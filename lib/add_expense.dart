import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});

  final List<Map<String, dynamic>> category = [
    {
      "categoryPic": "assets/travel.png",
    },
    {
      "categoryPic": "assets/cup.png",
    },
    {
      "categoryPic": "assets/popcorn.png",
    },
    {
      "categoryPic": "assets/ambulance.png",
    },
    {
      "categoryPic": "assets/mobile-transfer.png",
    },
    {
      "categoryPic": "assets/laundry.png",
    },
    {
      "categoryPic": "assets/life-insurance.png",
    },
    {
      "categoryPic": "assets/restaurant.png"
    },
  ];

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
                  (){
                    showModalBottomSheet(

                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GridView.builder(

                            itemCount: category.length,

                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 4,
                              mainAxisExtent: 82,


                            ),
                            itemBuilder: (context, index){
                              return Container(decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15), color: Color (0xFFD1E5EE),
                              ),child: Center(child: SizedBox(height:60, width:60,child: IconButton(onPressed: (){}, icon: Image.asset(category[index]["categoryPic"])))),);
                            },
                          ),
                        );
                      },
                    );
                  },
              ),
              commonSizedBox(10),

              CommonElevatedButton(
                "December 14, 2023",
                Colors.white,
                Colors.black,
                  (){
                  showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2099));
                  },
              ),
              commonSizedBox(10),
              CommonElevatedButton("ADD Expense", Colors.black, Colors.white, (){}),
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
      onPressedd,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressedd,
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
