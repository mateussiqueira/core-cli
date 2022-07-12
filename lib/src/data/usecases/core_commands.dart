import 'dart:async';

import 'package:args/command_runner.dart';

import '../../domain/domain.dart';
import '../../utils/utils.dart';
import '../models/models.dart';

class CoreCommands implements Commands {
  CoreCommands([this._runner]);

  factory CoreCommands.initialize([
    String? name,
    String? description,
  ]) =>
      CoreCommands(
        CommandRunner(
          name ?? Constants.defaultName,
          description ?? Constants.defaultDescription,
        ),
      );

  CommandRunner? _runner;

  @override
  CommandRunner? get runner => _runner;

  CommandRunner _getRunner() {
    try {
      if (_runner == null) {
        throw Exception();
      }

      return _runner!;
    } catch (_) {
      throw DomainError.notInitialized;
    }
  }

  @override
  Future<void> configure(List<CommandBase> commands) async {
    try {
      if (commands.isEmpty) {
        throw Exception();
      }
      final runner = _getRunner();

      for (var command in commands) {
        runner.addCommand(command);
      }

      _runner = runner;
    } catch (_) {
      throw Constants.notInitializeErrorMsg;
    }
  }

  @override
  execute(List<String> arguments) {
    final runner = _getRunner();

    runner.run(arguments);
  }
}
