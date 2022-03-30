// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:presentation/base/bloc_state.dart';
// import 'package:presentation/base/stream_platform_stack_content.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState<D> extends BlocState<MyHomePage, HomeBloc> {
//   @override
//   void initState() {
//     super.initState();
//     bloc.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamPlatformStackContent(
//       dataStream: bloc.dataStream,
//       children: (blocData) {
//         final screenData = blocData.data;
//         if (screenData is HomeData) {
//           return SafeArea(
//               child: ListView.separated(
//             itemBuilder: (context, index) {},
//             itemCount: 1,
//             separatorBuilder: (BuildContext context, int index) {
//               return const SizedBox(height: 5);
//             },
//           ));
//         }
//       },
//     );
//   }
// }
