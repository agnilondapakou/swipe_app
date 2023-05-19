import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../models/user_model.dart';
import '../../utils/constants.dart';

  const storage = FlutterSecureStorage();
var token = '';
int userId = 0;
  Future<ApiResponse> login(String identifier, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String url = '$apiUrl/user';
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
            {
              'identifier': identifier,
              'password': password,
            }
        ),
        headers: _header(),
      );
      if (response != null) {
        if (response.statusCode == 201) {
          final data = jsonDecode(response.body);
          apiResponse.data = data;
          token = data['session']['token'];
          userId = data['session']['user_id'];
        } else {
          final errors = jsonDecode(response.body);
          apiResponse.error = errors;
        }
      } else {
        print("Failed to get a response from the server");
      }
    } catch (e) {
      apiResponse.error == "server error";
    }
    return apiResponse;
  }

  Future<ApiResponse> register(
    String username,
    String email,
    String phone_number,
    String type,
    String password,
    String source,
  ) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String url = '$apiUrl/users/';
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
            {
              'username': username,
              'email': email,
              'phone_number': phone_number,
              'type': type,
              'password': password,
              'source': source,
            }
        ),
      );
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

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  Future<ApiResponse> logout()  async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String url = '$apiUrl/users';
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
            {
              'token': token,
            }
        ),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          apiResponse.data = jsonDecode(response.body);
        } else {
          throw Exception('Failed to logout');
        }
      } else {
        print("Failed to get a response from the server");
      }
    } catch (e) {
      apiResponse.error = "Server error";
    }

    return apiResponse;
  }

  Future<String?> isLoggedIn() async {
    // Vérification de la présence du token dans le secure storage pour déterminer si l'utilisateur est connecté ou non
    final token = await storage.read(key: 'token');
    return token;
  }

  Future<ApiResponse> getUser() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String url = '$apiUrl/users/$userId';
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
          throw Exception('Failed to get user');
        }
      } else {
        print("Failed to get a response from the server");
      }
    } catch (e) {
      apiResponse.error = "Server error";
    }
    return apiResponse;
  }
