import 'package:flutter/material.dart';

class Course1 extends StatefulWidget {
  @override
  _Course1State createState() => _Course1State();
}

class _Course1State extends State<Course1> {
  List<Theme> listOfThemes = [
    Theme(name: 'Теорія ймовірності', totalPoints: 500, currentPoints: 150),
    Theme(name: 'Комбінаторика', totalPoints: 300, currentPoints: 250),
    Theme(name: 'Первісна', totalPoints: 400, currentPoints: 125),
    Theme(name: 'Логарифмічна рівняння', totalPoints: 200, currentPoints: 50),
    Theme(name: 'Кубічні рівняння', totalPoints: 100, currentPoints: 20),
    Theme(name: 'Біном Ньютона', totalPoints: 100, currentPoints: 30),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
                height: height * 0.3,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.dribbble.com/users/573008/screenshots/10723965/media/30ea9416d96dafb2c2897e96b4891d69.png'),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.05, height * 0.3 * 0.2, 0, 0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.75, height * 0.3 * 0.2, 0, 0),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.05, height * 0.3 * 0.3, 0, 0),
                        child: const Text('ЗНО математика',
                            style: TextStyle(
                              fontSize: 22.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                height: height * 0.63,
                child: ListView.builder(
                  itemCount: listOfThemes.length,
                  itemBuilder: (context, index) =>
                      themeTemplate(listOfThemes[index], height * 0.65, width),
                )),
          ],
        ),
      ),
    );
  }
}

Widget themeTemplate(Theme theme, double height, double width) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[100],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: width * 0.77,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    child: Text(theme.name,
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                          height: height * 0.25 * 0.15,
                          width: width * 0.55,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey[200],
                            value: (theme.currentPoints / theme.totalPoints)
                                .toDouble(),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.green[300]),
                          )),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text('Теорія',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text('Практика',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.25 * 0.2),
            child: Container(
              width: width * 0.18,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0)),
                color: Colors.green[200],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 6, 6, 4),
                    child: Text(theme.currentPoints.toString(),
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text('балів',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class Theme {
  String name;
  int currentPoints;
  int totalPoints;

  Theme({this.name, this.currentPoints, this.totalPoints});
}
