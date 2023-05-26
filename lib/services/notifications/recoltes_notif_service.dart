import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../utils/constants.dart';
import '../auth/auth_service.dart';

Future<ApiResponse> getHarvestsNotReadNotifs() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/notifications/harvest/notread';
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
        throw Exception('Failed to get notifications');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }
  return apiResponse;
}

Future<ApiResponse> getHarvestsReadNotif() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/notifications/harvest/read';
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
        throw Exception('Failed to get notifications');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }
  return apiResponse;
}