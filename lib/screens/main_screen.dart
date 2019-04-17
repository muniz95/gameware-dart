import 'package:flutter/material.dart';
import 'package:gameware/components/drawer.dart';
import 'package:gameware/screens/partials/home_partial.dart';
import 'package:gameware/screens/partials/products_partial.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gameware"),
        elevation: 0,
      ),
      drawer: buildDrawer(context),
      backgroundColor: Color(0XFFB2B4B2),
      body: new PageView(
        children: <Widget>[
          HomePartial(),
          ProductsPartial(),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(

          canvasColor: Color(0XFFB2B4B2),
          primaryColor: Color(0XFF514689),
          textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Color(0XFFA7A4E0)))
        ),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              title: new Text("Add"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.delete),
              title: new Text("Delete"),
            )
          ],
          currentIndex: _page,
          onTap: navigationTapped,
        ),
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