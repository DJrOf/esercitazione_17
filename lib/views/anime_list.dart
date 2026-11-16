import 'package:flutter/material.dart';

import '../models/anime.dart';
import '../services/anime_service.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Anime>>(
      future: AnimeService.fetchAnime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Errore : ${snapshot.error}"),
          );
        } else {
          final animeList = snapshot.data!;
          return ListView.builder(
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              final anime = animeList[index];
              return Card.filled(
                child: ListTile(
                  leading: Image.network(anime.imageUrl),
                  title: Text(anime.title),
                ),
              );
            },
          );
        }
      },
    );
  }
}
