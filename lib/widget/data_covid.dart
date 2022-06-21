import 'package:flutter/material.dart';

class dataCovid extends StatelessWidget {
  const dataCovid({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue[700],
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                ),
              )
            ],
          )),
    );
  }
}
