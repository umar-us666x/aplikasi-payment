import 'package:flutter/material.dart';
import 'package:aplikasi_payment/send_money_flow/select_account_page.dart';
import 'package:aplikasi_payment/widgets/bank_card.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<BankCardModel> cards = [
    BankCardModel(
      'images/bg_red_card.png',
      'Muhammad',
      '4221 5168 7464 2283',
      '08/20',
      10000000,
    ),
    BankCardModel(
      'images/bg_blue_circle_card.png',
      'Imaduddin',
      '4221 5168 7464 2283',
      '08/20',
      10000000,
    ),
    BankCardModel(
      'images/bg_purple_card.png',
      'Miftahul',
      '4221 5168 7464 2283',
      '08/20',
      10000000,
    ),
    BankCardModel(
      'images/bg_blue_card.png',
      'Jannah',
      '4221 5168 7464 2283',
      '08/20',
      10000000,
    ),
  ];

  double screenWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 197, 175),
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: ListView.builder(
        itemCount: 4,
        // ignore: body_might_complete_normally_nullable
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _userInfoWidget();
          } else if (index == 1) {
            return _userBankCardsWidget();
          }
          ;
        },
      ),
    );
  }

  Widget _userInfoWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  child: Text('M'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    'Muhammad Imaduddin',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications_none,
                  size: 30.0,
                ),
              ),
              Positioned(
                top: 3.0,
                left: 3.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE95482),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      '10',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userBankCardsWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Text(
              'My Bank Accounts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 166.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _getBankCard(index);
              },
            ),
          ),
          Container(
            height: 80.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTapUp: (tapDetail) {
                      Navigator.push(context, SelectAccountPageRoute());
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset('images/ico_send_money.png'),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Send\nmoney',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/ico_receive_money.png'),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Receive\nmoney',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getBankCard(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: BankCard(card: cards[index]),
    );
  }
}
