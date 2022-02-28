
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:presentation/state_man/data/bloc_state.dart';

abstract class BaseBloc<A>{
  Stream<BlocData?> get getStream;
  void initState();
  void dispose();
}
class BlocImpl<A> implements BaseBloc<A>{
  final _data = StreamController<BlocData<A?>>();
  final _blocData = BlocData.init();

  @override
  void dispose(){
    _data.close();
  }
  @override
  void initState(){
  }

  @override
  Stream<BlocData?> get getStream => _data.stream;

  @protected
    void handleData({
      bool? isLoading,
      bool? isValid,
      A? data,
    }) {
        if(!_data.isClosed){
          _blocData.updateParams(
            isloading: isLoading,
            data: data,
          );
          _data.add(_blocData.copy<A>());  //!
        }
    }
}


