class Weather{
  var cityname;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var feels_like;
  var pressure;
  var prici;
  var last_updated;

  Weather({
    required this.cityname,
    required this.condition,
    required this.icon,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_dir,
    required this.gust,
    required this.uv,
    required this.feels_like,
    required this.prici,
    required this.last_updated


  });

  Weather.fromjson(Map<String,dynamic>json){

    cityname=json['location']['name'];
    condition=json['current']['condition']['text'];
    icon=json['current']['condition']['icon'];
    temp=json['current']['temp_c'];
    wind=json['current']['wind_kph'];
    humidity=json['current']['humidity'];
    pressure=json['current']['pressure_mb'];
    wind_dir=json['current']['wind_dir'];
    gust=json['current']['gust_kph'];
    uv=json['current']['uv'];
    feels_like=json['current']['feelslike_c'];
    prici=json['current']['precip_mm'];
    last_updated=json['current']['last_updated']; 
  }
  


}