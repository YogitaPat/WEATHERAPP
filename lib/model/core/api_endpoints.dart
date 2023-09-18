// import 'package:weather_app/model/core/apikey.dart';
const String  apiKey ='841ca938c589b79dcc793012e1fd9627';
class ApiEndpoints {
  static const weatherUrl =
      'https://api.openweathermap.org/data/2.5/forecast?&units=metric&appid=$apiKey';

  static const weatherLatLongUrl =
      'https://api.openweathermap.org/data/2.5/forecast?&units=metric&appid=$apiKey';

  static const climateImgUrl = 'http://openweathermap.org/img/wn';
}
