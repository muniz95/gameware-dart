import 'dart:async';

import 'package:gameware/models/User.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../state.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return new AppState(
    user: userReducer(state.user, action),
  );
}

final userReducer = combineTypedReducers<User>([
  new ReducerBinding<User, CounterOnDataEventAction>(_setCounter),
]);

User _setCounter(User oldCounter, CounterOnDataEventAction action) {
  return action.user;
}