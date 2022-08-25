import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/screen/build_screen/bloc/bloc_build_data.dart';
import 'package:domain/usecase/get_build_usecase.dart';
import 'package:domain/usecase/post_build_usecase.dart';
import 'package:domain/model/propery/post_model.dart';

abstract class BuildBloc extends BaseBloc {
  factory BuildBloc(
          BuildUseCase useCase, BuildJenkisUseCase buildJenkisUseCase) =>
      _BuildBloc(
        useCase,
        buildJenkisUseCase,
      );
  void getProperty(String? propertyName);
  void pop();
  void postJenkisBuild();
  void onChangeValue(String value, String nameWidget);
}

class _BuildBloc extends BaseBlocImpl implements BuildBloc {
  final BuildUseCase _buildUseCase;
  final BuildJenkisUseCase _buildJenkisUseCase;
  final screenData = BuildData.init();

  _BuildBloc(this._buildUseCase, this._buildJenkisUseCase);

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
  void postJenkisBuild() {
    final request = PostRequestModel();
    _buildJenkisUseCase(request);
  }

  @override
  void onChangeValue(String value, String nameWidget) {
    screenData.valueWidgets[nameWidget] = value;
  }

  @override
  void pop() {
    appNavigator.pop();
  }
}
