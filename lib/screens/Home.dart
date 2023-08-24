import 'package:flutter/material.dart';
import 'package:news_app/component/defaulttextformfield.dart';
import 'package:news_app/component/defaultcontainer.dart';
import '../model/lastest_new.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  bool click = false;
  int selectedindex = 0;
  List news = [
    LatestNews(
        image: "assets/Frame 34.png",
        firsttext: "by Ryan Browne",
        secondtext:
            "Crypto investors should be \n prepared to lose all their money,\n BOE governor says",
        thirdtext:
            "“I’m going to say this very bluntly again,” he added. “Buy them \n only if you’re prepared to lose all your money.”"),
    LatestNews(
        image: "assets/Frame 35.png",
        firsttext: "by Ryan Browne",
        secondtext:
            "Asia-Pacific markets trade broadly \n higher,oil prices climb",
        thirdtext:
            "“Stock markets in Asia-Pacific were broadly higher on Monday\n following “a big miss” in the April U.S. jobs report, while oil \nfutures advanced.”")
  ];
  List  text = ["Healthy", "Technology", "Finance", "Arts", "Sports"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.75,
                        child: DefaultTextFormField(
                            iconButton: Icons.search,
                            color: Color(0xff818181),
                            text: "Dogecoin to the Moon...")),
                    buildContainernotification(context)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest News",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [Text("See ALL"), Icon(Icons.arrow_forward)],
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.35,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildLatestNews(news[index]);
                    },
                    itemCount: news.length,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.07,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return typesNews(text[index], index);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width*0.05,
                        );
                      },
                      itemCount: text.length),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.65,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DefaultContainer(latestNewss: listofnews[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height*0.02,
                        );
                      },
                      itemCount: listofnews.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildContainernotification(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
                      width: MediaQuery.of(context).size.width*0.12,
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [
                          Color(0xffFF3A44),
                          Color(0xffFF8086),
                        ]),
                      ),
                      child: Center(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Icon(
                                  Icons.notifications_none,
                                  color: Colors.white,
                                ),
                            Padding(
                              padding:  EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFFE600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
  Widget typesNews(String text, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width*0.3,
          child: Center(
            child: Text(text,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: selectedindex == index ? Colors.white : Colors.brown,
                )),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffF0F1FA), width: 2),
              borderRadius: BorderRadius.circular(30),
              color:
                  selectedindex == index ? Color(0xffFF3A44) : Colors.white)),
    );
  }
  Widget buildLatestNews(LatestNews latestNewss) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage("${latestNewss.image}"),
              fit: BoxFit.cover,
              height: 250,
            )),
        Padding(
          padding:  EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${latestNewss.firsttext}",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(
                    "${latestNewss.secondtext}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5),
                  ),
                ],
              ),
              Text(
                "${latestNewss.thirdtext}",
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
