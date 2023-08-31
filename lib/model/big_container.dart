import 'package:flutter/material.dart';
import 'package:news_app/model/lastest_new.dart';

import '../screens/news_detail.dart';
class BigContainer extends StatefulWidget {
  BigContainer({required this.latestNewss}) ;
  LatestNews latestNewss;
  int selectedcontainer=0;
  int index=0;
  @override
  State<BigContainer> createState() => _BigContainerState();
}
class _BigContainerState extends State<BigContainer> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewDetails(
                  latestNews: widget.latestNewss,
                )));
      },
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: widget.selectedcontainer==widget.index
                  ? Container(
                decoration: const BoxDecoration(
                    color: Colors.grey
                ),
                child: Image(
                  image: AssetImage("${widget.latestNewss.image}"),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.9,
                ),
              )
                  : Image(
                image: AssetImage("${widget.latestNewss.image}"),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.9,
              )),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.latestNewss.firsttext}",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    Text(
                      "${widget.latestNewss.secondtext}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: 'DMSerifDisplay',
                          color: Colors.white,
                          height: 1.5),
                    ),
                  ],
                ),
                Text(
                  "${widget.latestNewss.thirdtext}",
                  style: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
