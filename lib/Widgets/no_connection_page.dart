import 'package:flutter/material.dart';

class NoConnectionPage extends StatefulWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  State<NoConnectionPage> createState() => _NoConnectionPageState();
}

class _NoConnectionPageState extends State<NoConnectionPage> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFca8e2e),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: isloading
                    ? const CircularProgressIndicator()
                    : const Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/dis.gif'),
                      ),
              ),
            ),
            SizedBox(
              height: height * .04,
              width: width,
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });
                    await Future.delayed(
                      const Duration(seconds: 2),
                    );
                    if (mounted) {
                      setState(() {
                        isloading = false;
                      });
                    }
                  },
                  child: const Text(
                    "Try Again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
