import 'package:flutter/material.dart';
import 'package:aplikasi_payment/models/receiver_model.dart';
import 'package:aplikasi_payment/send_money_flow/send_money_page.dart';

class SelectAccountPageRoute extends PageRouteBuilder {
  SelectAccountPageRoute()
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SelectAccountPage();
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: Offset(-1.0, 0.0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
          },
        );
}

class SelectAccountPage extends StatefulWidget {
  @override
  SelectAccountPageState createState() => SelectAccountPageState();
}

class SelectAccountPageState extends State<SelectAccountPage> {
  final TextEditingController searchController = TextEditingController();
  bool isShowSearchButton = false;
  int selectedIndex = 0;

  List<ReceiverModel> receivers = [
    ReceiverModel('Muhammad', ' 0857 6743 1278', '1234 0000 0099 0909'),
    ReceiverModel('Imaduddin', ' 0856 6743 1278', '2234 0000 0099 0909'),
    ReceiverModel('Umar', ' 0855 6743 1278', '3234 0000 0099 0909'),
    ReceiverModel('Sabar', ' 0854 6743 1278', '4234 0000 0099 0909'),
    ReceiverModel('Miftahul', ' 0853 6743 1278', '5678 0000 0099 0909'),
    ReceiverModel('Jannah', ' 0852 6743 1278', '6678 0000 0099 0909'),
  ];

  List<ReceiverModel> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Money",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 34, 197, 175),
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getSearchSection(),
            _getAccountTypeSection(),
            selectedIndex == 0
                ? _getContactListSection()
                : _getAccountListSection()
          ],
        ),
      ),
    );
  }

  Widget _getSearchSection() {
    Widget searchBar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration.collapsed(
                  hintText: 'Search for Phone number or Bank account number'),
              onChanged: _searchTextChanged,
            ),
          ),
        ),
      ],
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 56.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: searchBar,
        ),
      ),
    );
  }

  Widget _getAccountTypeSection() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Card(
        margin: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
        ),
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTapUp: (tapDetail) {
                    selectedIndex = 0;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.5],
                        colors: selectedIndex == 0
                            ? [Color(0xFF47E497), Color(0xFF47E0D6)]
                            : [Colors.white, Colors.white],
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.contact_phone,
                            color: selectedIndex == 0
                                ? Colors.white
                                : Color(0xFF939192),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Phone\nContacts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == 0
                                        ? Colors.white
                                        : Color(0xFF939192),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTapUp: (tapDetail) {
                    selectedIndex = 1;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.5],
                        colors: selectedIndex == 1
                            ? [
                                Color(0xFF47E497),
                                Color(0xFF47E0D6),
                              ]
                            : [Colors.white, Colors.white],
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_rounded,
                            color: selectedIndex == 1
                                ? Colors.white
                                : Color(0xFF939192),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Bank\nAccounts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == 1
                                        ? Colors.white
                                        : Color(0xFF939192),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAccountListSection() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: searchController.text.isEmpty
                      ? receivers.length
                      : searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _getReceiverSection(
                      searchController.text.isEmpty
                          ? receivers[index]
                          : searchResults[index],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 34, 197, 175),
                    borderRadius: BorderRadius.all(
                      Radius.circular(11.0),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    'ADD BENEFICIARY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContactListSection() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: searchController.text.isEmpty
                      ? receivers.length
                      : searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _getReceiverSection(
                      searchController.text.isEmpty
                          ? receivers[index]
                          : searchResults[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getReceiverSection(ReceiverModel receiver) {
    return GestureDetector(
      onTapUp: (tapDetail) {
        Navigator.push(
          context,
          SendMoneyPageRoute(receiver),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                child: Text(
                  receiver.name.substring(0, 1),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    receiver.name,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.phone,
                          size: 13.0,
                          color: Color(0xFF929091),
                        ),
                      ),
                      Text(
                        receiver.phoneNumber,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF929091),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.account_balance,
                          size: 13.0,
                          color: Color(0xFF929091),
                        ),
                      ),
                      Text(
                        receiver.accountNumber,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF929091),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _searchTextChanged(String text) {
    isShowSearchButton = text.isNotEmpty;
    searchResults = receivers.where((i) {
      return i.name.toLowerCase().contains(text.toLowerCase()) ||
          i.phoneNumber.toLowerCase().contains(text.toLowerCase()) ||
          i.accountNumber.toLowerCase().contains(text.toLowerCase());
    }).toList();
    setState(() {});
  }
}
