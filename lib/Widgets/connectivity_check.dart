import 'no_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/JobSeekerBloc/conectivityBloc/connectivity_bloc.dart';

// ignore_for_file: must_be_immutable

class CheckConnectivity extends StatelessWidget {
  final Widget child;
  const CheckConnectivity({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return child;
        } else if (state is DisConnectedState) {
          return const NoConnectionPage();
        } else {
          return Container();
        }
      },
    );
  }
}
