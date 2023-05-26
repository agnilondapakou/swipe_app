import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../utils/constants.dart';

Future<ApiResponse> registerOrderById(
    String product_qty,
    String start_date,
    String end_date,
    String harvest_id,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/commandes/$harvest_id';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          {
            'product_qty': product_qty,
            'start_date': start_date,
            'end_date': end_date,
          }
      ),
    );
    print(response.statusCode);
    if (response != null) {
      if (response.statusCode == 201) {
        apiResponse.data = jsonDecode(response.body);
      } else {
        throw Exception('Failed to register');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }

  return apiResponse;
}