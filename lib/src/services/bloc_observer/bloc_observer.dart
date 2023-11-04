// ignore_for_file: strict_raw_type

import 'dart:developer';

import 'package:bloc/bloc.dart';

extension TransitionFormattedString on Transition {
  String formatted() {
    return 'Transition \n'
        '|||||||||||||||||||||||||| \n'
        'currentState: $currentState \n'
        'event: $event \n'
        'nextState: $nextState \n'
        '|||||||||||||||||||||||||| \n';
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('${bloc.runtimeType} ${transition.formatted()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
