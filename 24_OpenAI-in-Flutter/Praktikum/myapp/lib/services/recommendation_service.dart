import 'dart:convert';

import '../constants/open_ai.dart';
import '../model/open_ai.dart';
import 'package:dio/dio.dart';

class RecommendationService {
  Future<GptData> getRecommendation(
      {required int price,
      required String camera,
      required String internalMemory}) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final data = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content":
                "You will be provided with statements, and your task is to give them a phone recommendation by Price IDR, Camera Specs, and Internal Memory."
          },
          {
            "role": "user",
            "content": price.toString() + camera + internalMemory
          }
        ],
        "temperature": 1,
        "max_tokens": 256,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      final response = await Dio().post(
        'https://api.openai.com/v1/chat/completions',
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      return GptData.fromJson(response.data);
    } on DioException catch (e) {
      throw 'Error $e';
    }
  }
}
