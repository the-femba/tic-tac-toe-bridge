class Size {
  final int width;

  final int height;

  const Size.only({this.width = 0, this.height = 0})
      : assert(width >= 0),
        assert(height >= 0);

  const Size.all([int all = 0])
      : width = all,
        height = all,
        assert(all >= 0);

  factory Size.json(dynamic json) {
    return Size.only(
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }

  Size copyWith({
    int? width,
    int? height,
  }) {
    return Size.only(
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  dynamic toJson() => {
        'width': width,
        'height': height,
      };

  @override
  bool operator ==(Object other) =>
      other is Size && other.width == width && other.height == height;

  Size operator +(Size other) {
    return Size.only(
      width: width + other.width,
      height: height + other.height,
    );
  }

  Size operator -(Size other) {
    return Size.only(
      width: width - other.width,
      height: height - other.height,
    );
  }

  Size operator *(int scalar) {
    return Size.only(
      width: width * scalar,
      height: height * scalar,
    );
  }

  Size operator /(int scalar) {
    return Size.only(
      width: width ~/ scalar,
      height: height ~/ scalar,
    );
  }

  Size operator %(int scalar) {
    return Size.only(
      width: width % scalar,
      height: height % scalar,
    );
  }

  Size operator &(Size other) {
    return Size.only(
      width: width & other.width,
      height: height & other.height,
    );
  }

  Size operator |(Size other) {
    return Size.only(
      width: width | other.width,
      height: height | other.height,
    );
  }

  Size operator -() {
    return Size.only(
      width: -width,
      height: -height,
    );
  }

  @override
  String toString() => toJson().toString();

  @override
  int get hashCode => Object.hash(width, height);

  static const empty = Size.all(0);
}
