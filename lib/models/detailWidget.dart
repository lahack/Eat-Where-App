import 'package:flutter/material.dart';
import 'cafeInfo.dart';
import 'dart:core';

class DetailWidget extends StatelessWidget {
  List<CafeInfo> recommendations;
  int recommendationIndex;
  DetailWidget(this.recommendationIndex, this.recommendations);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100),
      decoration: BoxDecoration(
          color: Colors.amber[50],
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        //margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.blue),
                      //     borderRadius: BorderRadius.circular(10.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          recommendations[recommendationIndex].imageLink,
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(recommendations[recommendationIndex].imageTitle)
                  ],
                ),
                SizedBox(
                  width: 40.0,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(recommendations[recommendationIndex].imageType),
                      SizedBox(height: 20),
                      Text(recommendations[recommendationIndex]
                              .walkMin
                              .toString() +
                          'min'),
                      SizedBox(height: 15),
                      Row(children: [
                        Icon(Icons.star),
                        Text(recommendations[recommendationIndex]
                            .stars
                            .toString()),
                      ])
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                recommendations[recommendationIndex].mapLink,
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                height: 150,
                width: 600,
              ),
            ),
            SizedBox(height: 20,),
            Text(recommendations[recommendationIndex].address),
            Text("_________________________________________________"),
            SizedBox(height: 10,),
            Row(children: <Widget>[SizedBox(width: 5.0,), Text("Call")],),
            SizedBox(height: 5,),
            Row(children: <Widget>[SizedBox(width: 5.0,), Text(recommendations[recommendationIndex].phoneNumber)])
          ],
        ),
      ),
    );
  }
}
