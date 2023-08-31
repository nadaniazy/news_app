import 'package:flutter/material.dart';
import 'package:news_app/component/defaulttextformfield.dart';
import 'package:news_app/component/defaultcontainer.dart';
import '../model/lastest_new.dart';
import '../model/tabmodel.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool check = false;
  TextEditingController searchcontroller = TextEditingController();
  int selectedindex = 0;
  List Chips = ["Recommended", "Latest", "Most Viewed", "Channel", "Following"];
  List<TabModel> tabs = [
    TabModel("1", "Healthy"),
    TabModel("2", "Technology"),
    TabModel("3", "Finance"),
    TabModel("4", "Arts"),
    TabModel("5", "Sports")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DefaultTextFormField(
                  check: false,
                  suffixcolor: Color(0xff202663),
                  controller: searchcontroller,
                  iconButton: Icons.close,
                  suffixfunction: () {
                    searchcontroller.clear();
                  },
                  color: Color(0xff202663),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          buildShowModalBottomSheet(context);
                          check = !check;
                        });
                      },
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: check ? Colors.white : Colors.brown,
                      ),
                      label: Text(
                        "Filter",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            color: check ? Colors.white : Colors.brown),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.012,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        primary: check ? Color(0xffFF3A44) : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.063,
                        child: TabBar(
                          onTap: (index) {
                            setState(() {
                              selectedindex = index;
                            });
                          },
                          physics: BouncingScrollPhysics(),
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          tabs: tabs
                              .map(
                                (tabDM) => Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffF0F1FA), width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            selectedindex == tabs.indexOf(tabDM)
                                                ? Color(0xffFF3A44)
                                                : Colors.white),
                                    child: Center(
                                      child: Text(tabDM.title,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: selectedindex ==
                                                    tabs.indexOf(tabDM)
                                                ? Colors.white
                                                : Colors.brown,
                                          )),
                                    )),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text.rich(TextSpan(
                    text: "About 11,130,000 Results for",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: " Covid New Variant",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15))
                    ])),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return DefaultContainer(
                              latestNewss: listofnews2[index]);
                        },
                        itemCount: listofnews2.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          );
                        },
                      ),
                      Center(child: Text("This is technolgy  news")),
                      Center(child: Text("This is Finance  news")),
                      Center(child: Text("This is Arts  newsoda")),
                      Center(child: Text("This is Sports  news")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Filter",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff041E2F)),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide(width: 1, color: Color(0xff041E2F)),
                      ),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Color(0xff041E2F),
                      ),
                      onPressed: () {},
                      label: const Text(
                        "Reset",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff041E2F)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const Text(
                  "Sort By",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff041E2F)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150, childAspectRatio: 2 / 1),
                    itemBuilder: (context, index) {
                      return Chip(
                        side: BorderSide(color: Color(0xffF0F1FA), width: 2),
                        backgroundColor: Colors.white,
                        label: Text(
                          Chips[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xff041E2F)),
                        ),
                      );
                    },
                    itemCount: Chips.length,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffFF3A44), Color(0xffFFB3B6)]),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                      child: Text(
                    "Saved",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                )
              ],
            ),
          );
        });
  }
}
