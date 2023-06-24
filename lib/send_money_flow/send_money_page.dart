import 'package:flutter/material.dart';
import 'package:aplikasi_payment/models/receiver_model.dart';

class SendMoneyPageRoute extends PageRouteBuilder {
  SendMoneyPageRoute(ReceiverModel receiver)
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SendMoneyPage(
              receiver: receiver,
            );
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

class SendMoneyPage extends StatefulWidget {
  final ReceiverModel receiver;

  SendMoneyPage({required this.receiver});

  @override
  SendMoneyPageState createState() => SendMoneyPageState();
}

class SendMoneyPageState extends State<SendMoneyPage> {
  final TextEditingController amountController = TextEditingController();

  int selectedCardIndex = 0;

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
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return _getSection(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSection(int index) {
    switch (index) {
      case 0:
        return _getReceiverSection(widget.receiver);
      case 1:
        return _getEnterAmountSection();
      case 2:
        return _getBankCardSection();
      default:
        return _getSendSection();
    }
  }

  Widget _getReceiverSection(ReceiverModel receiver) {
    return Container(
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
          ),
        ],
      ),
    );
  }

  Widget _getEnterAmountSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: Text(
                  'Enter Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '\$',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 204, 204, 204)),
                          decoration: InputDecoration(
                            hintText: 'Input Jumlah',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBankCardSection() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Debit from',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(11.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _getBankCard(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBankCard(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('XXXX XXXX XXXX 9898'),
            ),
          ),
          Radio(
            activeColor: Color(0xFF65D5E3),
            value: index,
            groupValue: selectedCardIndex,
            onChanged: (int? value) {
              if (value != null) {
                selectedCardIndex = value;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _getSendSection() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: GestureDetector(
        onTapUp: (tapDetail) {
          Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          );
        },
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 34, 197, 175),
            borderRadius: BorderRadius.all(
              Radius.circular(11.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            'SEND',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
