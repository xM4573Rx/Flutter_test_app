import 'package:flutter/material.dart';
import 'package:test_app/config/providers/user_provider.dart';
//import 'package:weinflu_app/config/app_routes.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider.of(context).userData.name = '${UserProvider.of(context).userData.name}s';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text(
              'Hola ${UserProvider.of(context).userData.name} 🤯'),
          //onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
