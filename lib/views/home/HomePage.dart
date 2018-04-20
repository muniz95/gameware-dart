import 'package:flutter/material.dart';
import 'package:gameware/widgets/Drawer.dart';
import '../product/ProductContainer.dart';
import 'HomeContainer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gameware"),
      ),
      drawer: buildDrawer(context),
      body: new PageView(
        children: <Widget>[
          new HomeContainer(),
          new ProductContainer(),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              title: new Text("Produtos")
          ),
          // new BottomNavigationBarItem(
          //     icon: new Icon(Icons.report),
          //     title: new Text("Relatórios")
          // )
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  /// Called when the user presses on of the
  /// [BottomNavigationBarItem] with corresponding
  /// page index
  void navigationTapped(int page){

    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page){
    setState((){
      this._page = page;
    });
  }
}