import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_wise_app_development/weather/model/weaher_response_model.dart';
import 'package:weather_wise_app_development/weather/service/weather_api_service.dart';
import 'package:weather_wise_app_development/weather/shared/color_const.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({super.key});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  TextEditingController textEditingController = TextEditingController();
  WeatherResponse? weatherResponse;

  @override
  void initState() {
    addWeatherInfo();
    super.initState();
  }

   addWeatherInfo({String city = 'Bhiwani'}) async {
    weatherResponse = await WeatherApiService.getWeatherInformation(city: city);
    setState(() {});
  }

  // bool loading = false;
  //
  // getData() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   weatherResponse = await WeatherApiService.getWeatherInformation(city: );
  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: weatherResponse?.weatherList?.length ?? 0,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weather\nInformation',
                    style: TextStyle(
                      color: ColorsConst.bgColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsConst.bgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (String value) {
                        addWeatherInfo(city: value);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Search City',
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 32, left: 24, right: 24),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/img_8.png',
                          height: 84,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${weatherResponse!.name.toString()}, ${weatherResponse!.sys!.country.toString()}',
                              style: const TextStyle(fontSize: 26),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/img_2.png',
                              height: 48,
                            ),
                            Image.asset(
                              'assets/images/img_3.png',
                              height: 48,
                            ),
                            Image.asset(
                              'assets/images/img_2.png',
                              height: 48,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/img_3.png',
                              height: 52,
                            ),
                            Image.asset(
                              'assets/images/img_1.png',
                              height: 44,
                            ),
                            Image.asset(
                              'assets/images/img_5.png',
                              height: 52,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.thermostat_auto,
                              size: 28,
                            ),
                            Icon(
                              Icons.water_drop,
                              size: 28,
                            ),
                            Icon(
                              Icons.wind_power,
                              size: 28,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              weatherResponse!.main!.temp.toString(),
                            ),
                            Text(
                              weatherResponse!.main!.humidity.toString(),
                            ),
                            Text(
                              weatherResponse!.wind!.speed.toString(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.2,
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Wind Speed',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.wind!.speed.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Sunrise',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat('h:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        weatherResponse!.sys!.sunrise!
                                            .toInt(),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Sunset',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat('h:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        weatherResponse!.sys!.sunset!.toInt(),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Temp',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.main!.temp.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'TempMin',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.main!.tempMin.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'TempMax',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.main!.tempMax.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Humidity',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.main!.humidity
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Pressure',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.main!.pressure
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'FeelsLike',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.main!.feelsLike
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Visibility',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.visibility.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Deg',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.wind!.deg.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Lat',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.coordinates!.lat
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Lon',
                                    style: TextStyle(
                                        color: ColorsConst.textTileColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    weatherResponse!.coordinates!.lon
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
