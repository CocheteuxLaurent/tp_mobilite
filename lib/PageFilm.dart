import 'package:flutter/material.dart';

import 'classDescription.dart';

class PageFilm extends StatelessWidget {
  const PageFilm({Key? key, required this.imdbID}) : super(key: key);
  final String imdbID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 32, 64, 100),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 32, 64, 100),
        centerTitle: true,
        title: Text('Filmographie'),
      ),
      body: Center(
        child: FutureBuilder<Description>(
            future: DescriptionFonction.getDescription(imdbID),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot);
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(33, 32, 64, 20),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: [
                                Text(
                                  snapshot.data.titre,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    letterSpacing: 1.0,
                                    fontSize: 20.00,
                                  ),
                                ),
                                Text(
                                  snapshot.data.genre,
                                  style: TextStyle(
                                    fontSize: 15.00,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  snapshot.data.dateSortie,
                                  style: TextStyle(
                                    fontSize: 15.00,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          snapshot.data.afficheImg,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Color.fromRGBO(33, 32, 64, 20),
                          elevation: 10.0,
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.duree,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 15.00,
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data.acteurs,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.00,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  snapshot.data.synopsis,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.00,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data.recompense,
                                style: TextStyle(
                                  fontSize: 15.00,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Text(
                                  snapshot.data.realisateur,
                                  style: TextStyle(
                                    fontSize: 15.00,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
