import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/models/movie.dart';
import '../../domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<List<Movie>?> getTopMovies() async {
    final moviesAsString = await rootBundle.loadString('assets/jsons/movies.json');
    final json = Map<String, dynamic>.from(jsonDecode(moviesAsString));
    final List moviesJson = json['results'];
    final List<Movie> movies = moviesJson.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
    return movies;
  }
}
