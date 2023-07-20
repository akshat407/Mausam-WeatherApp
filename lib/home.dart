import "package:flutter/material.dart";
import "package:mausam/locator.dart";
import "package:mausam/weatherdata.dart";
import 'package:intl/intl.dart';

   var dayInfo=DateTime.now();
  var dateFormat=DateFormat('EEEE,d MMM, yyyy').format(dayInfo);

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var client=WeatherData();

  var data;

  info() async
  {
    // var position=await GetPosition();
    data= await client.getData('60','60');
    // data= await client.getData(position.latitude,position.longitude);
    return data;

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: (context,snapshot){
          return Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.75,
              width: size.width,
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsetsDirectional.only(start: 10, end: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff955cd1),
                        Color(0xff3fa2fa),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85])),
              child: Column(
                children: [
                  Text(
                    '${data?.cityname}',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 35,
                        fontFamily: 'MavenPro'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                   dateFormat ,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 20,
                        fontFamily: 'MavenPro'),
                  ),
                  // Image.asset(
                  //   'assets/sunny.png',
                  //   width: size.width * 0.4,
                  // ),
                  Image.network(
                    'http:${data?.icon}',
                    width: size.width*0.5,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${data?.condition}',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Hubballi'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${data?.temp}°C",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 80,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Hubballi'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'assets/storm.png',
                            width: size.width * 0.1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.wind} kmph',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wind',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'assets/humidity.png',
                            width: size.width * 0.1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.humidity}%',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Humidity',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'assets/windflag.png',
                            width: size.width * 0.1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.wind_dir}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wind Direction',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Gust',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.gust} kph',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 23,
                          fontFamily: 'Hubballi',
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Pressure',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.pressure} hpa',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 23,
                          fontFamily: 'Hubballi',
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                )),
                 Expanded(
                    child: Column(
                  children: [
                    Text(
                      'UV',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.uv}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 23,
                          fontFamily: 'Hubballi',
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Precipitaion',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.prici} mm',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 23,
                          fontFamily: 'Hubballi',
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                )),
                 Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Feels like',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.feels_like}°C',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 23,
                          fontFamily: 'Hubballi',
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Last Updated',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 20,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.last_updated}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 20,
                          fontFamily: 'Hubballi',
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ))
              ],
            ),
          ],
        )
          );
        

      }
      )
      
    );
  }
}
