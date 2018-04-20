import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/views/home/HomeViewModel.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      converter: (store) => HomeViewModel.fromStore(store),
      builder: (context, viewModel) => new HomeContainerContent(context, viewModel),
    );
  }
}

class HomeContainerContent extends StatelessWidget {
  HomeContainerContent(this.context, this.viewModel);
  
  final HomeViewModel viewModel;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text("Welcome home, ${viewModel.user.name}!"),
      ),
    );
  }
}