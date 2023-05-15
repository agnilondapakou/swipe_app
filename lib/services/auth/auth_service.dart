import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../models/user_model.dart';
import '../../utils/constants.dart';

  const storage = FlutterSecureStorage();

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
          final token = data['access_token'];
          final user = UserModel.fromJson(data['user']);
          // Stockage du token et des informations utilisateur dans le secure storage
          await storage.write(key: 'token', value: token);
          await storage.write(key: 'user', value: jsonEncode(user.toJson()));
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
          apiResponse.data = UserModel.fromJson(jsonDecode(response.body));
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

  Future<bool> logout() async {
    // Suppression du token et des informations utilisateur depuis le secure storage
    await storage.delete(key: 'token');
    await storage.delete(key: 'user');
    return true;
  }

  Future<String?> isLoggedIn() async {
    // Vérification de la présence du token dans le secure storage pour déterminer si l'utilisateur est connecté ou non
    final token = await storage.read(key: 'token');
    return token;
  }

  Future<ApiResponse> getUser() async {
    ApiResponse apiResponse = ApiResponse();
    // Récupération des informations utilisateur depuis le secure storage
    final userJson = await storage.read(key: 'user');
    if (userJson != null) {
      apiResponse = UserModel.fromJson(jsonDecode(userJson)) as ApiResponse;
    }
    return apiResponse;
  }
