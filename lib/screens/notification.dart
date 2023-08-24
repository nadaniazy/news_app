import 'package:flutter/material.dart';
import 'package:news_app/model/lastest_new.dart';
class Notifications extends StatelessWidget {
   Notifications({Key? key}) : super(key: key);
List hotupdate=[
  LatestNews(image: "assets/Frame 32 (1).png", firsttext: "Monday, 10 May 2021", secondtext: "WHO classifies triple-mutant Covid variant from  India as global health risk", thirdtext: "A World Health Organization official said Monday it is  reclassifying the highly contagious triple-mutant Covid  variant spreading in India as a “variant of concern,” indicating that it’s become a...",forthtext: "Published by Berkeley Lovelace Jr."),
  LatestNews(image: "assets/Frame 32.png", firsttext: "Sunday, 9 May 2021", secondtext: "What to do if you're planning or attending a wedding during the pandemic", thirdtext: "They had the artsy, rustic venue, the tailored dress and a guest list including about 150 of their closest friends and family. But the pandemic had other plans, forcing Carly Chalmers and Mitchell Gauvin to make a difficult decision about their wedding...",forthtext: "Published by Kristen Rogers")
];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Hot Updates",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffFF3A44)),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){},),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Column(
          children: [
           Expanded(
             child: ListView.separated(
               physics: BouncingScrollPhysics(),
                 itemBuilder: (context,index){
               return buildNotifications(hotupdate[index],context);
             }, separatorBuilder: (context,index){
               return SizedBox(height: MediaQuery.of(context).size.height*0.03,);
             }, itemCount: hotupdate.length),
           )

          ],
        ),
      ),
    );
  }

  Column buildNotifications(LatestNews latestNews,context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage("${latestNews.image}"),width: double.infinity,height: 150,fit: BoxFit.contain,),
        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        Text("${latestNews.firsttext}",style: TextStyle(color: Color(0xff2E0505),fontSize: 12,fontWeight: FontWeight.w300,fontFamily: 'Nunito'),),
        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        Text("${latestNews.secondtext}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,height: 1.5),),
        SizedBox(height: MediaQuery.of(context).size.height*0.01),
        Text.rich(TextSpan(text: " ${latestNews.thirdtext}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,height: 1.5,fontFamily: 'Nunito'),children: [TextSpan(text: "Read More",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff0080FF,),height: 1.5,fontFamily: 'Nunito'))]),),
        SizedBox(height: MediaQuery.of(context).size.height*0.02),
        Text("${latestNews.forthtext}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Color(0xff2E0505),fontFamily: 'Nunito'),)
      ],
    );
  }
}
