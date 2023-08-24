import 'dart:ui';
import 'package:flutter/material.dart';

class NewDetails extends StatelessWidget {
  const NewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image(
          image: AssetImage("assets/Vector.png"),
        ),
        backgroundColor: Color(0xffFF3A44),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/Rectangle 60.png"),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: Container(
                          height: MediaQuery.of(context).size.height +
                              MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(15.0).copyWith(top: MediaQuery.of(context).size.height*0.13),
                            child: Text.rich(TextSpan(
                                text: "LONDON",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    color: Color(0xff2E0505)),
                                children: [
                                  TextSpan(
                                      text:
                                          """  —  Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.

Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.

Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”

“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”

Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.

“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.

“If consumers invest in these types of product, they should be prepared to lose all their money.”

Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”
                      
                      
                      """,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          height: 1.6,
                                          color: Color(0xff2E0505)))
                                ])),
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                            vertical: MediaQuery.of(context).size.height * 0.1),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0x93969292)),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sunday, 9 May 2021",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                    color: Color(0xff2E0505)),
                              ),
                              Text(
                                "Crypto investors should be prepared to lose all their money, BOE governor says",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff2E0505)),
                              ),
                              Text(
                                "Published by Ryan Browne",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                    color: Color(0xff2E0505)),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
