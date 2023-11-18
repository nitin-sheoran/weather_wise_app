import 'package:weather_wise_app_development/weather/model/clouds_model.dart';
import 'package:weather_wise_app_development/weather/model/coordinates_model.dart';
import 'package:weather_wise_app_development/weather/model/main_weather_model.dart';
import 'package:weather_wise_app_development/weather/model/system_info_model.dart';
import 'package:weather_wise_app_development/weather/model/weather_model.dart';
import 'package:weather_wise_app_development/weather/model/wind_info_model.dart';

class WeatherResponse {
  Coordinates? coordinates;
  List<Weather>? weatherList;
  String? base;
  MainWeather? main;
  int? visibility;
  WindInfo? wind;
  Clouds? clouds;
  int? dt;
  SystemInfo? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherResponse(
      {this.coordinates,
      this.weatherList,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    coordinates =
        json['coord'] != null ? Coordinates.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weatherList = <Weather>[];
      json['weather'].forEach((v) {
        weatherList!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? MainWeather.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? WindInfo.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? SystemInfo.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coordinates != null) {
      data['coord'] = coordinates!.toJson();
    }
    if (weatherList != null) {
      data['weather'] = weatherList!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
