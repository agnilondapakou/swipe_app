import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../utils/constants.dart';
import '../auth/auth_service.dart';

Future<ApiResponse> getFarms() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/farms/$userId';
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
        throw Exception('Failed to get farms');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }
  return apiResponse;
}

Future<ApiResponse> deleteFarmById(String type)  async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/$type';
    final response = await http.delete(
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
        throw Exception('Failed to deleted farm');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }

  return apiResponse;
}

Future<ApiResponse> registerFarmById(
    String farm_name,
    String city,
    double longitude,
    double latitude,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/farms/$userId';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          {
            'farm_name': farm_name,
            'city': city,
            'longitude': longitude,
            'latitude': latitude,
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