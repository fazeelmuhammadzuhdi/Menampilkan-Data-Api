import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_api/model.dart';

class Service {
  Future<List<cModel>> getAllData() async {
    final response = await http.get(Uri.parse(
        'https://638974fac5356b25a2009808.mockapi.io/api/jayanusa/barang'));

    if (response.statusCode == 200) {
      List JsonResponse = jsonDecode(response.body);

      return JsonResponse.map((data) => cModel.fromJson(data)).toList();
    } else {
      throw Exception('Gagal Load Data');
    }
  }
}
