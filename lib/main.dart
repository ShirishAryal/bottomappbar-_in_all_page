import 'dart:developer';

import 'package:flutter/material.dart';

import 'router.dart';

String currentRoute = '/';
List<NavigatorObserver> navObserver = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SecondaryMaterialApp(initialRoute: "/"),
      navigatorObservers: navObserver,
    );
  }
}

class SecondaryMaterialApp extends StatefulWidget {
  const SecondaryMaterialApp({super.key, required this.initialRoute});
  static final NitvTaskRouter _appRouter = NitvTaskRouter();
  final String initialRoute;

  @override
  State<SecondaryMaterialApp> createState() => _SecondaryMaterialAppState();
}

class _SecondaryMaterialAppState extends State<SecondaryMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('navigator observer $navObserver');
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  log(currentRoute);
                  if (currentRoute == '/') return;
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
                    return const SecondaryMaterialApp(initialRoute: "/");
                  }), (r) {
                    return false;
                  });
                  currentRoute = '/';
                },
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  log(currentRoute);
                  if (currentRoute == '/settingpage') return;
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
                    return const SecondaryMaterialApp(initialRoute: "/settingpage");
                  }), (r) {
                    return false;
                  });

                  setState(() {
                    currentRoute = '/settingpage';
                  });
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: MaterialApp(
          initialRoute: widget.initialRoute,
          onGenerateRoute: SecondaryMaterialApp._appRouter.generateRoute,
        ),
      ),
    );
  }
}
