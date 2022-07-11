import '../lib/core_cli.dart';

void main(List<String> arguments) {
  final core = CoreCommands.initialize();

  core.configure([VersionCommand()]);

  core.execute(arguments);
}

class VersionCommand extends CommandBase {
  @override
  String get name => 'version';

  @override
  String get description => 'Get version';

  @override
  run() {
    print('0.0.0');
  }
}
