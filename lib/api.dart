import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uk_pred/model.dart';

Future<String> postFunc(body) async {
  var url = Uri.parse('https://parkinson-ml.uc.r.appspot.com/predict');
  var response = await http.post(url,
      headers: {"Content-type": "application/json"},
      body: json.encode(body).toString());

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body.toString()}');

  final v = resultModelString(response.body);
  print(v.prediction);
  print(v.result);

  return v.result;
}
