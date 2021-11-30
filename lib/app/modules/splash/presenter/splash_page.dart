import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

import '../../../app_module.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  onInit() async {
    await Modular.isModuleReady<AppModule>();
    Modular.to.navigate('/todos/');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RiveAnimation.asset(
        'assets/animations/rocket.riv',
        fit: BoxFit.fill,
      ),
      // child: CircularProgressIndicator(),
    );
  }
}
