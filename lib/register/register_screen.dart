import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Registrasi",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 34, 197, 175),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'images/payment_logo.png',
                    width: 250,
                    height: 250,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20, width: 20),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 1500,
              child: Text(
                "Create your account",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NIM",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints.expand(
                height: 50,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 34, 197, 175),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
