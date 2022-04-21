import 'package:domain/di/domain_injector.dart';
import 'package:presentation/di/presentation_injector.dart';
import 'package:data/di/data_injector.dart';

Future<void> initInjector() async {
  await initPresentationModule();
  await initDomainModule();
  await initDataModule();
}
