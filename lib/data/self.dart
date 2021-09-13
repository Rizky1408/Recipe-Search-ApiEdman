import 'dart:convert';

class Self {
  final String href;
  final String title;
  Self({
    required this.href,
    required this.title,
  });

  Self copyWith({
    String? href,
    String? title,
  }) {
    return Self(
      href: href ?? this.href,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'href': href,
      'title': title,
    };
  }

  factory Self.fromMap(Map<String, dynamic> map) {
    return Self(
      href: map['href'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Self.fromJson(String source) => Self.fromMap(json.decode(source));

  @override
  String toString() => 'Self(href: $href, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Self &&
      other.href == href &&
      other.title == title;
  }

  @override
  int get hashCode => href.hashCode ^ title.hashCode;
}