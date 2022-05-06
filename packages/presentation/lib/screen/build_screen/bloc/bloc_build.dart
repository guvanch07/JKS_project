import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/screen/build_screen/bloc/bloc_build_data.dart';
import 'package:domain/usecase/get_build_usecase.dart';

abstract class BuildBloc extends BaseBloc {
  factory BuildBloc(BuildUseCase useCase) => _BuildBloc(useCase);
  void getProperty(String? propertyName);
  void postButton(String? viewName, String? jobName, String? jobParams);
}

class _BuildBloc extends BaseBlocImpl implements BuildBloc {
  final BuildUseCase _buildUseCase;
  final screenData = BuildData.init();

  _BuildBloc(this._buildUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getProperty(String? jobName) async {
    screenData.property = await _buildUseCase(jobName ?? "empty");
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: isLoading,
      data: screenData.copy(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _buildUseCase.dispose();
  }

  @override
  void postButton(String? viewName, String? jobName, String? jobParams) async {
    screenData.property = await _buildUseCase(jobName ?? "empty");
    _updateData();
  }
}
