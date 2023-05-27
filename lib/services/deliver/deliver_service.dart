import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../utils/constants.dart';


Future<ApiResponse> getDelivers() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/delivers';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response != null) {
      if (response.statusCode == 200) {
        apiResponse.data = jsonDecode(response.body);
      } else {
        throw Exception('Failed to get delivers');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }
  return apiResponse;
}

Future<ApiResponse> createDeliver(
    String username,
    String contact,
    String userId
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/users';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          {
            'username': username,
            'userinfo': contact,
            'creator_id': userId,
            'type': "driver",
            'source': 0
          }
      ),
    );
    print(response.statusCode);
    if (response != null) {
      if (response.statusCode == 201) {
        apiResponse.data = jsonDecode(response.body);
      } else {
        throw Exception('Failed to create driver');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }

  return apiResponse;
}