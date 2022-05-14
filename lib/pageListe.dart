import 'package:flutter/material.dart';

import 'PageFilm.dart';
import 'classFilm.dart';

class PageListe extends StatelessWidget {
  const PageListe({Key? key, required this.valeurRecup}) : super(key: key);
  final String valeurRecup;
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
        child: FutureBuilder<List<Film>>(
          future: FilmFonction.getFilm(valeurRecup),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final id = snapshot.data[index].idFilm;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageFilm(
                                  imdbID: id,
                                )),
                      );
                    },
                    child: Card(
                      color: Color.fromRGBO(33, 32, 64, 20),
                      elevation: 3,
                      margin: EdgeInsets.all(20),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        minVerticalPadding: 10,
                        title: Text(
                          snapshot.data[index].titre,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data[index].dateSortie,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing:
                            Image.network(snapshot.data[index].afficheImg),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
