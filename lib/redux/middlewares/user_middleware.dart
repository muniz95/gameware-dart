import 'dart:async';

import 'package:gameware/models/User.dart';
import 'package:gameware/redux/actions/actions.dart';
import 'package:gameware/redux/state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> incrementEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions)
      .ofType(new TypeToken<IncrementCounterAction>())
      .flatMap((_) {
    return new Observable.fromFuture(Firestore.instance.document("users/tudor")
        .updateData({'user': store.state.user})
        .then((_) => new CounterDataPushedAction())
        .catchError((error) => new CounterOnErrorEventAction(error)));
  });
}

Stream<dynamic> userEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions) // 1
      .ofType(new TypeToken<RequestCounterDataEventsAction>()) // 2
      .flatMapLatest((RequestCounterDataEventsAction requestAction) { // 3
    return getUserClicks() // 4
        .map((user) => new CounterOnDataEventAction(user)) // 7
        .takeUntil(actions.where((action) => action is CancelCounterDataEventsAction)); // 8
  });
}

Observable<User> getUserClicks() {
  return new Observable(Firestore.instance.document("users/tudor").snapshots) // 5
      .map((DocumentSnapshot doc) => doc['user'] as User); // 6
}