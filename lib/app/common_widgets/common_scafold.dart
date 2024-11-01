import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final bool isDrawer;
  bool isAppBar;
  final bool isResizeToAvoidBottomInset;

  CommonScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.floatingActionButton,
      this.actions,
      this.isAppBar = true,
      required this.isDrawer,
      required this.isResizeToAvoidBottomInset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBar
          ? AppBar(
              title: Text(
                title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: actions,
            )
          : null,
      resizeToAvoidBottomInset: isResizeToAvoidBottomInset,
      drawer: isDrawer ? _buildDrawer(context) : null,
      body: Column(
        children: [
          Expanded(child: body),
          _buildFooter(context),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(8.0),
      child: const Center(
        child: Text(
          '© 2024 My App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
