import 'package:flutter/material.dart';
import 'package:news_app/model/lastest_new.dart';
class DefaultContainer extends StatelessWidget {
   DefaultContainer({required this.latestNewss}) ;
LatestNews latestNewss;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage("${latestNewss.image}"),
              height: 150,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: EdgeInsets.all(11.0),
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${latestNewss.firsttext}",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'New York Small',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${latestNewss.secondtext}",
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12, color: Colors.white,fontFamily: 'Nunito'),
                    ),
                    Text(
                      "${latestNewss.thirdtext}",
                      style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white, fontSize: 12,fontFamily: 'Nunito'),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
