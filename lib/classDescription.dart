import 'dart:convert';

import 'package:http/http.dart' as http;

class Description {
  final String titre;
  final String dateSortie;
  final String afficheImg;
  final String genre;
  final String duree;
  final String acteurs;
  final String synopsis;
  final String recompense;
  final String realisateur;

  const Description({
    required this.titre,
    required this.dateSortie,
    required this.afficheImg,
    required this.genre,
    required this.duree,
    required this.acteurs,
    required this.synopsis,
    required this.recompense,
    required this.realisateur,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      titre: json["Title"],
      dateSortie: json["Year"],
      afficheImg: json["Poster"],
      genre: json["Genre"],
      duree: json["Runtime"],
      acteurs: json["Actors"],
      synopsis: json["Plot"],
      recompense: json["Awards"],
      realisateur: json["Director"],
    );
  }
}

class DescriptionFonction {
  static Future<Description> getDescription(id) async {
    final imdbID = Uri.parse('http://www.omdbapi.com/?i=$id&apikey=5edd8232');
    final response = await http.get(imdbID);

    if (response.statusCode == 200) {
      Map desciption = json.decode(response.body);

      // return film.map((json) => Film.fromJson(json)).where((titre) {
      //   final newTitre = titre.titre.toLowerCase();
      //   final input = filmRechercher.toString().toLowerCase();
      //   return newTitre.contains(input);
      //
      return Description.fromJson(json.decode(response.body));
    } else {
      throw Exception("Une erreur est survenue !!!!");
    }
  }
}
