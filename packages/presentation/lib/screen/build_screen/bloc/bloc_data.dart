import 'package:domain/core/extension/string_extention.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/screen/build_screen/bloc/bloc.dart';
import 'package:domain/usecase/get_build_usecase.dart';

abstract class BuildBloc extends BaseBloc {
  factory BuildBloc(BuildUseCase useCase) => _BuildBloc(useCase);
  void getProperty(String? propertyName);
}

class _BuildBloc extends BaseBlocImpl implements BuildBloc {
  final BuildUseCase _buildUseCase;
  final _screenData = BuildData.init();

  _BuildBloc(this._buildUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getProperty(String? jobName) async {
    _screenData.property = await _buildUseCase(jobName.orEmpty);
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _buildUseCase.dispose();
  }
}
