// // import 'dart:convert';
// // import 'package:farmers_konekt/weather/location.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:developer';

// // class OpenWeatherMapWeatherApi extends WeatherApi {
// //   static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
// //   static const apiKey = "<insert api_id here>";
// //   http.Client httpClient;

// //   OpenWeatherMapWeatherApi() {
// //     this.httpClient = new http.Client();
// //   }

// //   Future<Location> getLocation(String city) async {
// //     final response = await this.httpClient.get(Uri.encodeFull('$endPointUrl/weather?q=$city&APPID=$apiKey'));

// //     if (response.statusCode != 200) {
// //       throw Exception(
// //           'error retrieving location for city $city: ${response.statusCode}');
// //     }

// //     return Location.fromJson(jsonDecode(response.body));
// //   }

// //   @override
// //   Future<Forecast> getWeather(Location location) async {
// //     final requestUrl =
// //         '$endPointUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
// //     final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

//     if (response.statusCode != 200) {
//       throw Exception('error retrieving weather: ${response.statusCode}');
//     }

//     return Forecast.fromJson(jsonDecode(response.body));
//   }
// }
