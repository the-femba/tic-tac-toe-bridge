import 'package:tic_tac_toe_bridge/models/identifier.dart';

class Identifiable<T> {
  final Identifier identifier;

  final T information;

  const Identifiable({
    required this.identifier,
    required this.information,
  });

  factory Identifiable.json(
    dynamic json,
    T Function(dynamic json) information,
  ) =>
      Identifiable(
        identifier: Identifier.parse(json['id'] as String),
        information: information(json['information'] as Map<String, dynamic>),
      );

  dynamic toJson(dynamic Function(T information) information) => {
        'id': identifier.toString(),
        'information': information(this.information),
      };

  @override
  String toString() =>
      toJson((information) => information.toString()).toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Identifiable &&
          runtimeType == other.runtimeType &&
          identifier == other.identifier &&
          information == other.information;

  @override
  int get hashCode => identifier.hashCode ^ information.hashCode;
}
