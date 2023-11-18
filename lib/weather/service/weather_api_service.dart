import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_wise_app_development/weather/model/weaher_response_model.dart';

class WeatherApiService {
  static String apiKey = 'fe9c862d031a1ffc04111157bb5a3163';

  static Future<WeatherResponse> getWeatherInformation(
      {required String city}) async {
    http.Response response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey')
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
    } else {
      throw 'Something went wrong';
    }
  }
}
