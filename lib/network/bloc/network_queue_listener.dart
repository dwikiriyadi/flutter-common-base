import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../object/result_state.dart';
import 'network_queue_view_model.dart';

typedef NetworkQueueListenerBuilder = Function(
    BuildContext context, bool retrying, Map<String, ResultState> results);

class NetworkQueueListener extends StatelessWidget {
  final Widget child;
  final NetworkQueueListenerBuilder listener;

  const NetworkQueueListener(
      {super.key, required this.child, required this.listener});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkQueueViewModel, NetworkQueueState>(
      listener: (context, state) => listener(
        context,
        state.retrying,
        state.results,
      ),
      child: child,
    );
  }
}
