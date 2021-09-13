import 'dart:convert';

import 'links.dart';
import 'recipe.dart';

class RecipeModel {
  final Recipe recipe;
  final Links links;
  RecipeModel({
    required this.recipe,
    required this.links,
  });

  RecipeModel copyWith({
    Recipe? recipe,
    Links? links,
  }) {
    return RecipeModel(
      recipe: recipe ?? this.recipe,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recipe': recipe.toMap(),
      'links': links.toMap(),
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      recipe: Recipe.fromMap(map['recipe']),
      links: Links.fromMap(map['_links']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source));

  @override
  String toString() => 'RecipeModel(recipe: $recipe, links: $links)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeModel &&
        other.recipe == recipe &&
        other.links == links;
  }

  @override
  int get hashCode => recipe.hashCode ^ links.hashCode;

  static List<RecipeModel> fromListDynamic(List<dynamic> datas) {
    if (datas == null) return [];
    return datas.map<RecipeModel>((e) => RecipeModel.fromMap(e)).toList();
  }
}
