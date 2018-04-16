import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:gameware/Assets.dart';
// import 'package:url_launcher/url_launcher.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => new _HeaderState();
}

class _HeaderState extends State<Header> {
  static const String flutterUrl = 'https://flutter.io/';
  static const String githubUrl = 'https://github.com/muniz95/gameware-dart';
  static final TextStyle linkStyle = new TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  TapGestureRecognizer _flutterTapRecognizer;
  TapGestureRecognizer _githubTapRecognizer;

  // @override
  // void initState() {
  //   super.initState();
  //   _flutterTapRecognizer = new TapGestureRecognizer()
  //     ..onTap = () => _openUrl(flutterUrl);
  //   _githubTapRecognizer = new TapGestureRecognizer()
  //     ..onTap = () => _openUrl(githubUrl);
  // }

  @override
  void dispose() {
    _flutterTapRecognizer.dispose();
    _githubTapRecognizer.dispose();
    super.dispose();
  }

  // void _openUrl(String url) async {
  //   // Close the about dialog.
  //   Navigator.pop(context);

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   }
  // }

  Widget _buildAppNameAndVersion(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Text(
            'Distrowatch',
            style: textTheme.display1.copyWith(color: Colors.black),
          ),
          new Text(
            'v0.0.1', // TODO: figure out a way to get this dynamically
            style: textTheme.body2.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutButton(BuildContext context) {
    var content = new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Icon(
          Icons.info_outline,
          color: Colors.black54,
          size: 18.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: new Text(
            'About',
            textAlign: TextAlign.end,
            style: new TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );

    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAboutDialog(context),
          );
        },
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: content,
        ),
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: new Text('About Distrowatch'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          // _buildTMDBAttribution(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          // textColor: Theme.of(context).primaryColor,
          textColor: Colors.black54,
          child: new Text('Okay, got it!'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: 'Distrowatch is the main Linux, BSD and Unix-like '
            'distros database and news portal.\n\n',
        style: new TextStyle(color: Colors.black87),
        children: <TextSpan>[
          new TextSpan(text: 'The app was developed with '),
          new TextSpan(
            text: 'Flutter',
            recognizer: _flutterTapRecognizer,
            style: linkStyle,
          ),
          new TextSpan(
            text: ' and it\'s open source; check out the source '
                'code yourself from ',
          ),
          new TextSpan(
            text: 'the GitHub repo',
            recognizer: _githubTapRecognizer,
            style: linkStyle,
          ),
          new TextSpan(text: '.'),
        ],
      ),
    );
  }

  // Widget _buildTMDBAttribution() {
  //   return new Padding(
  //     padding: const EdgeInsets.only(top: 16.0),
  //     child: new Row(
  //       children: <Widget>[
  //         new Padding(
  //           padding: const EdgeInsets.only(top: 8.0),
  //           child: new Image.asset(
  //             ImageAssets.poweredByTMDBLogo,
  //             width: 32.0,
  //           ),
  //         ),
  //         new Expanded(
  //           child: new Padding(
  //             padding: const EdgeInsets.only(left: 12.0),
  //             child: new Text(
  //               'This product uses the TMDb API but is not endorsed or certified by TMDb.',
  //               style: new TextStyle(fontSize: 12.0),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Theme.of(context).primaryColor,
      constraints: new BoxConstraints.expand(height: 175.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildAppNameAndVersion(context),
          _buildAboutButton(context),
        ],
      ),
    );
  }
}
