import 'package:gameware/redux/app/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    userState: state.userState
  );
}