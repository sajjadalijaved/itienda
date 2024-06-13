import 'package:flutter/material.dart';
// ignore_for_file: unused_local_variable

class BusinessAadd extends StatefulWidget {
  const BusinessAadd({super.key});

  @override
  State<BusinessAadd> createState() => _BusinessAaddState();
}

class _BusinessAaddState extends State<BusinessAadd> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/edit.jpg"), fit: BoxFit.fill)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Add Screen"),
            )
          ],
        ),
      ),
    );
  }
}
