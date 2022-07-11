import 'dart:async';

class CommandEntity {
  CommandEntity({
    required this.command,
    required this.name,
    this.abbr,
  });

  final FutureOr<dynamic>? command;
  final String name;
  final String? abbr;
}
