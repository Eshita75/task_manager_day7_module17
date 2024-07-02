import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {//here we used our build get request method
    //get request er jonno method
    try {
      Response response = await get(Uri.parse(url));//here used http build get request method
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response
            .body); //response body te jei data ta niye asbe ta encode thake seta k decode korte hoi jsonDecode use kore
        return NetworkResponse(//network_caller theke Network_response e return korbe
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body}/*2ND BRACES USE KORCE OPTIONAL PARAMETER BUJHAITE and ? use korce nullable bujhaite*/) async {//here we used our build get request method
    //get request er jonno method
    try {
      debugPrint(url);
      debugPrint(body.toString());
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-type': 'Application/json'},
      ); //here used http build get request method
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodeData = jsonDecode(response.body); //request body te jei data ta niye jabe ta decode thake seta k encode korte hoi jsonEncode use kore
        return NetworkResponse(//network_caller theke Network_response e return korbe
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
