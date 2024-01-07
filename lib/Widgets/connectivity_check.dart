
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // ignore_for_file: must_be_immutable

// class CheckConnectivityHome extends StatelessWidget {
//   dynamic data;
//   dynamic lat;
//   dynamic long;
//   CheckConnectivityHome({Key? key, this.data, this.lat, this.long})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ConnectivityBloc, ConnectivityState>(
//       builder: (context, state) {
//         if (state is ConnectedState) {
//           return HomeScreen(
//             lat: lat.toString(),
//             long: long.toString(),
//             user_id: data,
//           );
//         } else if (state is DisConnectedState) {
//           return const NoConnectionPage();
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
