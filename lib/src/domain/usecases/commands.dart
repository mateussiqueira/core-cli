import 'package:args/command_runner.dart';

import '../../data/data.dart';

abstract class Commands {
  CommandRunner? get runner;

  Future<void> configure(List<CommandBase> commands);
  void execute(List<String> arguments);
}
