import 'package:domain/di/injector.dart';
import 'package:presentation/di/injector.dart';
import 'package:data/di/injector.dart';
import 'package:get_it/get_it.dart';

Future<void> initInjector() async {
  final sl = GetIt.I;
  injectPresentationModule(sl);
  injectDomainModule(sl);
  await injectDataModule(sl);
}
