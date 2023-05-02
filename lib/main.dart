import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'features/cluster_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ChangeNotifierProvider<ClusterProvider>(
      create: (BuildContext context) => ClusterProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moni Demo App',
        home: HomeScreen(),
      ),
    );
  }
}
