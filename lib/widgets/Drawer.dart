import 'package:flutter/material.dart';

Widget buildDrawer(BuildContext context) {
  return new Drawer(
    child: new ListView(
      children: <Widget>[
        const DrawerHeader(child: const Center(child: const Text('Stocks'))),
        const ListTile(
          leading: const Icon(Icons.assessment),
          title: const Text('Stock List'),
          selected: true,
        ),
        const ListTile(
          leading: const Icon(Icons.account_balance),
          title: const Text('aoiej'),
          enabled: false,
        ),
        new ListTile(
          leading: const Icon(Icons.dvr),
          title: const Text('Produto'),
          onTap: () {
            Navigator.of(context).pushNamed("/product");
          },
        ),
        const Divider(),
        new ListTile(
          leading: const Icon(Icons.thumb_up),
          title: const Text('Optimistic'),
          onTap: () {},
        ),
        new ListTile(
          leading: const Icon(Icons.thumb_down),
          title: const Text('Pessimistic'),
          onTap: () {},
        ),
        const Divider(),
        new ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        new ListTile(
          leading: const Icon(Icons.help),
          title: const Text('About'),
          onTap: () {},
        ),
        new ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Logout'),
          onTap: () {
            _handleLogout(context);
          },
        ),
      ],
    ),
  );
}

_handleLogout(context) {
  Navigator.of(context).pushReplacementNamed("/");
}
