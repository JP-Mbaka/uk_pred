import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uk_pred/splashScreen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.resVal});
  String resVal;
  bool isPos = false;
  Widget content = Center();

  @override
  Widget build(BuildContext context) {
    if (resVal == "tested_positive") {
      content = Text("Tested Positive",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.blue));
      isPos = true;
    } else {
      content = Text("Tested Negative",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.blue));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction Result"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              child: SvgPicture.asset(
                isPos
                    ? "asset/images/success_icon.svg"
                    : "asset/images/delet.svg",
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              child: content,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => SplashScreen()));
                    },
                    child: const Icon(Icons.repeat)),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
