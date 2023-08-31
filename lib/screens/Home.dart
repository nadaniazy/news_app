import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/component/defaulttextformfield.dart';
import 'package:news_app/component/defaultcontainer.dart';
import 'package:news_app/model/big_container.dart';
import 'package:news_app/screens/favourite.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:news_app/screens/profile.dart';
import 'package:news_app/screens/search_screen.dart';
import '../model/button_navigationbar_model.dart';
import '../model/lastest_new.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool click = false;
  TextEditingController searchText = TextEditingController();
  int selectedindex = 0;
  int selectedscreen = 0;
  int selectedcontainer=0;
  List text = ["Healthy", "Technology", "Finance", "Arts", "Sports"];

  @override
  Widget build(BuildContext context) {
    List buttonnavigationbar = [
      DataInContainer(
          iconData: Icons.home_outlined,
          text: "Home",
          function: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          }),
      DataInContainer(
          iconData: Icons.favorite_outline,
          text: "Favourite",
          function: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Favourite()));
          }),
      DataInContainer(
          iconData: Icons.face_outlined,
          text: "Profile",
          function: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          })
    ];
    List news = [
      LatestNews(
          image: "assets/Frame 34.png",
          firsttext: "by Ryan Browne",
          secondtext:
              "Crypto investors should be \n prepared to lose all their money,\n BOE governor says",
          thirdtext:
              "“I’m going to say this very bluntly again,” he added. “Buy them \n only if you’re prepared to lose all your money.”"),
      LatestNews(
          image: "assets/Frame 35 (1).png",
          firsttext: "by Ryan Browne",
          secondtext:
              "Asia-Pacific markets trade broadly \n higher,oil prices climb",
          thirdtext:
              "“Stock markets in Asia-Pacific were broadly higher on Monday\n following “a big miss” in the April U.S. jobs report, while oil \nfutures advanced.”")
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: DefaultTextFormField(
                                check: true,
                                controller: searchText,
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen()));
                                },
                                suffixcolor: Color(0xff818181),
                                iconButton: Icons.search,
                                color: Color(0xff818181),
                                text: "Dogecoin to the Moon...")),
                        buildContainernotification(context)
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest News",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSerifDisplay',
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Text("See ALL"),
                                Icon(Icons.arrow_forward)
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CarouselSlider.builder(
                      itemCount: news.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return BigContainer(latestNewss: news[itemIndex]);
                      },
                      options: CarouselOptions(
                          autoPlay: false,
                          pageSnapping: true,
                          animateToClosest: true,
                          scrollPhysics: BouncingScrollPhysics(),
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          onPageChanged: (itemindex,_){
                            setState(() {
                              if(itemindex==0)
                            {
                              selectedcontainer=itemindex+1;

                            }else if(itemindex==1)
                              {
                                selectedcontainer==itemindex-1;
                              }
                            });
                          },
                          reverse: false,
                          aspectRatio: 12 / 9,
                          viewportFraction: 0.9,
                          padEnds: false,
                          initialPage: 0,
                          pauseAutoPlayOnManualNavigate: true),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return typesNews(text[index], index);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            );
                          },
                          itemCount: text.length),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DefaultContainer(
                                latestNewss: listofnews[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            );
                          },
                          itemCount: listofnews.length),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                margin: const EdgeInsets.only(
                  right: 40,
                  left: 40,
                  bottom: 40,
                ),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          List.generate(buttonnavigationbar.length, (index) {
                        return buildColumn(buttonnavigationbar[index], index);
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColumn(DataInContainer dataInContainer, index) {
    return InkWell(
      onLongPress: () {
        setState(() {
          selectedscreen = index;
        });
      },
      onTap: dataInContainer.function,
      child: Column(
        children: [
          Icon(
            dataInContainer.iconData,
            color:
                selectedindex == index ? Color(0xffFF3A44) : Color(0xffA6A6A6),
          ),
          Text(
            "${dataInContainer.text}",
            style: TextStyle(
                color:
                    selectedindex == index ? Colors.brown : Color(0xffA6A6A6)),
          )
        ],
      ),
    );
  }

  Widget buildContainernotification(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.height * 0.06,
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
            children: const [
              Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
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
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffF0F1FA), width: 2),
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                selectedindex == index ? Color(0xffFF3A44) : Colors.white,
                selectedindex == index ? Color(0xffFF8086) : Colors.white,
              ]),
            ),
            child: Center(
              child: Text(text,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selectedindex == index ? Colors.white : Colors.brown,
                  )),
            )));
  }
}
// gradient: LinearGradient(
// colors: [Color(0xffD9DFE4), Color(0xffA5AFB7),Colors.black],
// begin: AlignmentDirectional.topCenter,
// end: AlignmentDirectional.bottomCenter)
