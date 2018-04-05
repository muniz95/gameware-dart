import 'package:gameware/models/User.dart';

class IncrementCounterAction {}

class CounterDataPushedAction {}

class RequestCounterDataEventsAction {}

class CancelCounterDataEventsAction {}

class CounterOnDataEventAction {
  final User user;

  CounterOnDataEventAction(this.user);

  @override
  String toString() => 'CounterOnDataEventAction{user: $user}';
}

class CounterOnErrorEventAction {
  final dynamic error;

  CounterOnErrorEventAction(this.error);

  @override
  String toString() => 'CounterOnErrorEventAction{error: $error}';
}