import 'package:flutter/material.dart';
import 'package:uk_pred/api.dart';
import 'package:uk_pred/model.dart';
import 'package:uk_pred/result.dart';
import 'package:uk_pred/variables.dart';

void main() {
  runApp(MaterialApp(
    home: ResultScreen(
      resVal: 'Tested_positive',
    ),
  ));
}

class Home extends StatelessWidget {
  Home({super.key});

  final _formKey = GlobalKey<FormState>();

  final pregController = TextEditingController();
  final plasController = TextEditingController();
  final presController = TextEditingController();
  final skinController = TextEditingController();
  final insuController = TextEditingController();
  final massController = TextEditingController();
  final pediController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ush',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(195, 226, 154, 59)),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
          titleTextStyle: const TextStyle().copyWith(fontSize: 18),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Diabetes Prediction"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: pregController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("No. of Pregnancy"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: plasController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Plasma level"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: presController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Blood Pressure"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: skinController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("BMI/Skin"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: insuController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Insulin level"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: massController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Body Mass"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: pediController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Pedigree"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Age"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.05),
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: InkWell(
                      onTap: () async {
                        Predict body = Predict(
                          preg: double.parse(pregController.text),
                          plas: double.parse(plasController.text),
                          pres: double.parse(presController.text),
                          skin: double.parse(skinController.text),
                          insu: double.parse(insuController.text),
                          mass: double.parse(massController.text),
                          pedi: double.parse(pediController.text),
                          age: double.parse(ageController.text),
                        );

                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Image.asset("asset/images/me.gif"),
                                ));
                        const Duration(seconds: 8);
                        await postFunc(body.toJson()).then(
                          (value) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ResultScreen(resVal: value),
                            ),
                          ),
                        );
                      },
                      child: const Center(child: Text("Predict")),
                    ),
                  ),
                  SizedBox(height: height(context) * 0.05),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
