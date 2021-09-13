import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'ingredient.dart';

class Recipe {
  final String uri;
  final String label;
  final String image;
  final String source;
  final String url;
  final String shareAs;
  final int yield;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<dynamic> cautions;
  final List<String> ingredientLines;
  final List<Ingredient> ingredients;
  final double calories;
  final double totalWeight;
  final int totalTime;
  Recipe({
    this.uri = '',
    this.label = '',
    this.image = '',
    this.source = '',
    this.url = '',
    this.shareAs = '',
    this.yield = 0,
    this.dietLabels = const [],
    this.healthLabels = const [],
    this.cautions = const [],
    this.ingredientLines = const [],
    this.ingredients = const [],
    this.calories = 0.0,
    this.totalWeight = 0.0,
    this.totalTime = 0,
  });

  Recipe copyWith({
    String? uri,
    String? label,
    String? image,
    String? source,
    String? url,
    String? shareAs,
    int? yield,
    List<String>? dietLabels,
    List<String>? healthLabels,
    List<dynamic>? cautions,
    List<String>? ingredientLines,
    List<Ingredient>? ingredients,
    double? calories,
    double? totalWeight,
    int? totalTime,
  }) {
    return Recipe(
      uri: uri ?? this.uri,
      label: label ?? this.label,
      image: image ?? this.image,
      source: source ?? this.source,
      url: url ?? this.url,
      shareAs: shareAs ?? this.shareAs,
      yield: yield ?? this.yield,
      dietLabels: dietLabels ?? this.dietLabels,
      healthLabels: healthLabels ?? this.healthLabels,
      cautions: cautions ?? this.cautions,
      ingredientLines: ingredientLines ?? this.ingredientLines,
      ingredients: ingredients ?? this.ingredients,
      calories: calories ?? this.calories,
      totalWeight: totalWeight ?? this.totalWeight,
      totalTime: totalTime ?? this.totalTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uri': uri,
      'label': label,
      'image': image,
      'source': source,
      'url': url,
      'shareAs': shareAs,
      'yield': yield,
      'dietLabels': dietLabels,
      'healthLabels': healthLabels,
      'cautions': cautions,
      'ingredientLines': ingredientLines,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'calories': calories,
      'totalWeight': totalWeight,
      'totalTime': totalTime,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      uri: map['uri'],
      label: map['label'],
      image: map['image'],
      source: map['source'],
      url: map['url'],
      shareAs: map['shareAs'],
      yield: map['yield']?.toInt(),
      dietLabels: List<String>.from(map['dietLabels']),
      healthLabels: List<String>.from(map['healthLabels']),
      cautions: List<dynamic>.from(map['cautions']),
      ingredientLines: List<String>.from(map['ingredientLines']),
      ingredients: List<Ingredient>.from(
          map['ingredients']?.map((x) => Ingredient.fromMap(x))),
      calories: map['calories']?.toDouble(),
      totalWeight: map['totalWeight']?.toDouble(),
      totalTime: map['totalTime']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Recipe(uri: $uri, label: $label, image: $image, source: $source, url: $url, shareAs: $shareAs, yield: $yield, dietLabels: $dietLabels, healthLabels: $healthLabels, cautions: $cautions, ingredientLines: $ingredientLines, ingredients: $ingredients, calories: $calories, totalWeight: $totalWeight, totalTime: $totalTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recipe &&
        other.uri == uri &&
        other.label == label &&
        other.image == image &&
        other.source == source &&
        other.url == url &&
        other.shareAs == shareAs &&
        other.yield == yield &&
        listEquals(other.dietLabels, dietLabels) &&
        listEquals(other.healthLabels, healthLabels) &&
        listEquals(other.cautions, cautions) &&
        listEquals(other.ingredientLines, ingredientLines) &&
        listEquals(other.ingredients, ingredients) &&
        other.calories == calories &&
        other.totalWeight == totalWeight &&
        other.totalTime == totalTime;
  }

  @override
  int get hashCode {
    return uri.hashCode ^
        label.hashCode ^
        image.hashCode ^
        source.hashCode ^
        url.hashCode ^
        shareAs.hashCode ^
        yield.hashCode ^
        dietLabels.hashCode ^
        healthLabels.hashCode ^
        cautions.hashCode ^
        ingredientLines.hashCode ^
        ingredients.hashCode ^
        calories.hashCode ^
        totalWeight.hashCode ^
        totalTime.hashCode;
  }
}
