
class WeatherData{
  final String code;  //对应天气代码
  final String cond;//天气
  final String tmp; //温度
  final String hum; //湿度
  final String wind; //风向
  final String time;  //发布时间
  final String length;  //能见度
  final String cloud; //云量

  WeatherData({
    this.cond,
    this.tmp,
    this.hum,
    this.code,
    this.wind,
    this.time,
    this.length,
    this.cloud,
  });

  factory WeatherData.fromJson(Map<String,dynamic> json){
    return WeatherData(
      code: json['HeWeather6'][0]['now']['cond_code'],
      cond: json['HeWeather6'][0]['now']['cond_txt'],
      tmp: json['HeWeather6'][0]['now']['tmp'],
      hum: "湿度 "+json['HeWeather6'][0]['now']['hum']+"%",
      wind: json['HeWeather6'][0]['now']['wind_dir'] + ' ' + json['HeWeather6'][0]['now']['wind_sc'] + " 级",
      time: json['HeWeather6'][0]['update']['loc'],
      length: json['HeWeather6'][0]['now']['vis'],
      cloud: json['HeWeather6'][0]['now']['cloud'],
    );
  }

  factory WeatherData.empty() {
    return WeatherData(
      code: "",
      cond: "",
      tmp: "",
      hum: "",
      wind: "",
      time: "",
      length: "",
      cloud: "",
    );
  }
}

class WeatherAir{
  final String weatheraqi;  //空气质量指数
  final String weatheralty;  //空气质量
  final String weatherpmn;  //pm2.5
  final String weatherpm10; //pm10
  final String weatherNo2; //no2
  final String weatherSo2; //So2


  WeatherAir({
    this.weatheraqi,
    this.weatheralty,
    this.weatherpmn,
    this.weatherpm10,
    this.weatherNo2,
    this.weatherSo2,
  });

  factory WeatherAir.fromJson(Map<String,dynamic> json){
    return WeatherAir(
      weatheraqi: json['HeWeather6'][0]['air_now_city']['aqi'],
      weatheralty: json['HeWeather6'][0]['air_now_city']['qlty'],
      weatherpmn: json['HeWeather6'][0]['air_now_city']['pm25'],
      weatherpm10: json['HeWeather6'][0]['air_now_city']['pm10'],
      weatherNo2: json['HeWeather6'][0]['air_now_city']['no2'],
      weatherSo2: json['HeWeather6'][0]['air_now_city']['so2'],
    );
  }


  factory WeatherAir.empty(){
    return WeatherAir(
      weatherpmn: "",
      weatheralty: "",
      weatheraqi: "",
      weatherpm10: "",
      weatherNo2: "",
      weatherSo2: "",
    );
  }
}