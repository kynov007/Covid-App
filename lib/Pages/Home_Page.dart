import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widget/data_covid.dart';
import '../models/summary_models.dart';

class homePage extends StatelessWidget {
  late Summary dataSummary;

  Future getSummary() async {
    var respon = await http.get(
      Uri.parse('https://covid19.mathdro.id/api/countries/Indonesia'),
    );
    var data = jsonDecode(respon.body) as Map<String, dynamic>;
    dataSummary = Summary.fromJson(data);
    print("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getSummary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Loading...',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage('https://covid19.mathdro.id/api/og'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 40),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 100),
                          child: Text(
                            'Date Modified ${dataSummary.lastUpdate.day}-${dataSummary.lastUpdate.month}-${dataSummary.lastUpdate.year} ${dataSummary.lastUpdate.timeZoneName} ${dataSummary.lastUpdate.hour}:${dataSummary.lastUpdate.minute}:${dataSummary.lastUpdate.second} ',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        dataCovid(
                          title: 'Country',
                          value: 'Indonesia',
                        ),
                        dataCovid(
                          title: 'Confrimed',
                          value: '${dataSummary.confirmed.value}',
                        ),
                        dataCovid(
                          title: 'Death',
                          value: '${dataSummary.deaths.value}',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
