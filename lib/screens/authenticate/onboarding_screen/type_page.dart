import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/onboarding_screen/class_and_code_page.dart';

class TypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TYPE_PAGE');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'Що описує тебе найкраще',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  color: const Color.fromRGBO(38, 132, 254, 100),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassAndCodePage()));
                  },
                  textColor: Colors.white,
                  height: 70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Учень(-ця)',
                    style: TextStyle(fontFamily: 'Gilroy', fontSize: 35),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: const Color.fromRGBO(38, 132, 254, 100),
                  onPressed: () {},
                  textColor: Colors.white,
                  height: 70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Батьки',
                    style: TextStyle(fontFamily: 'Gilroy', fontSize: 35),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage(
                        'assets/sign_up_pic/sign_up_backpack.png',
                      ),
                      height: 300,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
