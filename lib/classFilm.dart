import 'dart:convert';

import 'package:http/http.dart' as http;

class Film {
  final String titre;
  final String dateSortie;
  final String afficheImg;
  final String idFilm;
  final String type;

  const Film({
    required this.titre,
    required this.dateSortie,
    required this.afficheImg,
    required this.idFilm,
    required this.type,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      titre: json["Title"],
      dateSortie: json["Year"],
      type: json["Type"],
      afficheImg: json["Poster"],
      idFilm: json["imdbID"],
    );
  }
}

class FilmFonction {
  static Future<List<Film>> getFilm(filmRechercher) async {
    final url =
        Uri.parse('http://www.omdbapi.com/?s=$filmRechercher&apikey=5edd8232');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map film = json.decode(response.body);

      // return film.map((json) => Film.fromJson(json)).where((titre) {
      //   final newTitre = titre.titre.toLowerCase();
      //   final input = filmRechercher.toString().toLowerCase();
      //   return newTitre.contains(input);
      //

      var list = (film['Search'] as List)
          .map((item) => new Film.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception("Une erreur est survenue !!!!");
    }
  }
}
