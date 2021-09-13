import 'dart:convert';

class Ingredient {
  final String text;
  final int weight;
  final String foodCategory;
  final String foodId;
  final String image;
  Ingredient({
    this.text = '',
    this.weight = 0,
    this.foodCategory = '',
    this.foodId = '',
    this.image = '',
  });

  Ingredient copyWith({
    String? text,
    int? weight,
    String? foodCategory,
    String? foodId,
    String? image,
  }) {
    return Ingredient(
      text: text ?? this.text,
      weight: weight ?? this.weight,
      foodCategory: foodCategory ?? this.foodCategory,
      foodId: foodId ?? this.foodId,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'weight': weight,
      'foodCategory': foodCategory,
      'foodId': foodId,
      'image': image,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      text: map['text'],
      weight: map['weight']?.toInt(),
      foodCategory: map['foodCategory'],
      foodId: map['foodId'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ingredient(text: $text, weight: $weight, foodCategory: $foodCategory, foodId: $foodId, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredient &&
        other.text == text &&
        other.weight == weight &&
        other.foodCategory == foodCategory &&
        other.foodId == foodId &&
        other.image == image;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        weight.hashCode ^
        foodCategory.hashCode ^
        foodId.hashCode ^
        image.hashCode;
  }
}
