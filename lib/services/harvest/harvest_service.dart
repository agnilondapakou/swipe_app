import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swipe_app/models/api_response.dart';

import '../../utils/constants.dart';
import '../auth/auth_service.dart';

Future<ApiResponse> getHarvests() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/harvests/farmer/$userId';
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
        throw Exception('Failed to get harvests');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }
  return apiResponse;
}

Future<ApiResponse> deleteHarvestById(String type)  async {
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
        throw Exception('Failed to deleted harvest');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }

  return apiResponse;
}

Future<ApiResponse> registerHarvestById(
    String product_name,
    String product_qty,
    String start_date,
    String end_date,
    String farmId
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/harvests/$farmId';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          {
            'product_name': product_name,
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

Future<ApiResponse> getHarvestById(String type) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/$type';
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
        throw Exception('Failed to get Harvest');
      }
    } else {
      print("Failed to get a response from the server");
    }
  } catch (e) {
    apiResponse.error = "Server error";
  }
  return apiResponse;
}

Future<ApiResponse> updateHarvestById(
    int harvestId,
    String product_name,
    String product_qty,
    String start_date,
    String end_date,
    String farm_id,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url = '$apiUrl/harvests/$harvestId';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          {
            'product_name': product_name,
            'product_qty': product_qty,
            'start_date': start_date,
            'end_date': end_date,
            'farm_id': farm_id,
          }
      ),
    );
    print(response.statusCode);
    if (response != null) {
      if (response.statusCode == 200) {
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