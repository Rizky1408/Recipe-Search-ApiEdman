import 'dart:convert';

import 'self.dart';

class Links {
  final Self self;
  Links({
    required this.self,
  });

  Links copyWith({
    Self? self,
  }) {
    return Links(
      self: self ?? this.self,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'self': self.toMap(),
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      self: Self.fromMap(map['self']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  String toString() => 'Links(self: $self)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Links &&
      other.self == self;
  }

  @override
  int get hashCode => self.hashCode;
}