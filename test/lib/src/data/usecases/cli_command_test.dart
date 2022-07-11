import 'package:core_cli/src/data/data.dart';
import 'package:core_cli/src/domain/domain.dart';
import 'package:core_cli/src/utils/utils.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  late Commands sut;
  late Commands sutError;

  late String defaultName;
  late String defaultDescription;

  late String coreName;
  late String coreDescription;

  setUp(() {
    sut = CoreCommands.initialize();
    sutError = CoreCommands();

    defaultName = Constants.defaultName;
    defaultDescription = Constants.defaultDescription;

    coreName = faker.person.name();
    coreDescription = faker.lorem.sentence();
  });

  test('Should initialize CoreCommands with default values', () {
    final name = sut.runner?.executableName;
    final description = sut.runner?.description;

    expect(name, defaultName);
    expect(description, defaultDescription);
  });

  test('Should initialize CoreCommands with correct values', () {
    sut = CoreCommands.initialize(
      coreName,
      coreDescription,
    );
    final name = sut.runner?.executableName;
    final description = sut.runner?.description;

    expect(name, coreName);
    expect(description, coreDescription);
  });

  test('Should not initialize CoreCommands return null', () {
    final runner = sutError.runner;

    expect(runner, null);
  });

  test(
      'Should call configure throw Not Initialized Error if CoreCommands not initialized',
      () async {
    final result = sutError.configure([]);

    expect(result, throwsA(Constants.notInitializeErrorMsg));
  });

  test('Should call configure return correct values', () async {
    final result = sut.configure([]);

    expect(result, throwsA(Constants.notInitializeErrorMsg));
  });
}
