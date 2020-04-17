import 'package:flutter/material.dart';
import './models/Hotel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Hotel hotel = new Hotel(
      '0',
      'Miami Resort',
      'https://lh3.googleusercontent.com/proxy/OT_YFkEdYZEbJJY094DqIkhWfI0SCIU7bNa9pY0Rt32-sClSFUI3wT9MpK8yncRktHpuLmMTiykJUILkc6hFoSQ3KDUaXQbuyNAOzzxwdOgja7GLgNaGzeTvtpADkCnrE8osaA9-',
      3.5,
      '2',
      31.12342,
      30.12341,
      500,
      200,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: HotelPage(hotel),
    );
  }
}

class HotelPage extends StatefulWidget {
  HotelPage(this.hotel) : super();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Hotel hotel;

  @override
  _HotelPageState createState() => _HotelPageState(hotel);
}

class _HotelPageState extends State<HotelPage> {
  final Hotel hotel;
  _HotelPageState(this.hotel) : super();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 2 / 3,
              child: Image.network(
                hotel.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        hotel.Name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                            allowHalfRating: false,
                            starCount: 5,
                            rating: hotel.Rate,
                            size: 22.0,
                            color: Colors.yellow[700],
                            borderColor: Colors.black12,
                          ),
                          Text(
                            '(' + hotel.Rate.toString() + ')',
                            style:
                                TextStyle(color: Colors.black12, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    hotel.minPrice.toString() +
                        '\$-' +
                        hotel.maxprice.toString() +
                        '\$',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
