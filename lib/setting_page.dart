import 'dart:developer';

import 'package:flutter/material.dart';

import 'main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('willpop scope called of setting page');
        currentRoute = '/';
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Setting Page"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/settingdetail'), child: const Text('Setting page'))),
      ),
    );
  }
}

class SettingDetailPage extends StatelessWidget {
  const SettingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting details'),
      ),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
