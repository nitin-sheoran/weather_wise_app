import 'package:flutter/cupertino.dart';
import 'package:weather_wise_app_development/weather/ui/weather_info_screen.dart';

Map<String, WidgetBuilder> routeMap = {
  ScreenName.weatherDetailScreenText: (context) {
    return const WeatherInfoScreen();
  },
};

class ScreenName {
  static const String weatherDetailScreenText = '';
}

