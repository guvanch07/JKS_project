import 'package:domain/di/injector.dart';
import 'package:presentation/di/injector.dart';
import 'package:data/di/injector.dart';

Future<void> initInjector() async {
  await injectPresentationModule();
  await injectDomainModule();
  await injectDataModule();
}
