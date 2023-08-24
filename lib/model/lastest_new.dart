class LatestNews {
  String image;
  String firsttext;
  String secondtext;
  String thirdtext;
  String? forthtext;

  LatestNews(
      {required this.image,
        required this.firsttext,
        required this.secondtext,
        required this.thirdtext,
        this.forthtext
        });
}

List listofnews = [
  LatestNews(
      image: "assets/Frame 33.png",
      firsttext: "5 things to know about the 'conundrum' of lupus",
      secondtext: "Matt Villano",
      thirdtext: "Sunday, 9 May 2021"),
  LatestNews(
      image: "assets/Frame 34 (1).png",
      firsttext: "4 ways families can ease anxiety together",
      secondtext: "Zain Korsgaard",
      thirdtext: "Sunday, 9 May 2021"),
  LatestNews(
      image: "assets/Frame 32.png",
      firsttext:
      "What to do if you're planning or attending a wedding during the pandemic",
      secondtext: "Kristen Rogers",
      thirdtext: "Sunday, 9 May 2021")
];

List listofnews2 = [
  LatestNews(
      image: "assets/Frame 32.png",
      firsttext:
      "What to do if you're planning or attending a wedding during the pandemic",
      secondtext: "Kristen Rogers",
      thirdtext: "Sunday, 9 May 2021"),
  LatestNews(
      image: "assets/Frame 33 (2).png",
      firsttext: "Doctors on digital front lines help fight India’s Covid surge",
      secondtext: "Shepard Smith",
      thirdtext: "Friday, 7 May 2021"),
  LatestNews(
      image: "assets/Frame 34 (1).png",
      firsttext: "4 ways families can ease anxiety together",
      secondtext: "Zain Korsgaard",
      thirdtext: "Sunday, 9 May 2021"),
];
