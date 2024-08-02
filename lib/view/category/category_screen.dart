import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8D06),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          SingleChildScrollView(
            child: Container(
              height: 717,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Column(
                            children: [

                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
