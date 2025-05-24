import 'package:flutter/material.dart';
import 'package:mobile_app_coding_test/views/screens/home_screen.dart';
import 'package:mobile_app_coding_test/view_models/authentication_view_model.dart';
import 'package:mobile_app_coding_test/view_models/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:authentication_buttons/authentication_buttons.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Consumer<AuthenticationViewModel>(
          builder: (context, authenticationViewModel, child) {
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: AuthenticationButton(
                  authenticationMethod: AuthenticationMethod.google,
                  onPressed: () async {
                    await authenticationViewModel.googleSignIn();
                    if (authenticationViewModel.user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider(
                            create: (_) => HomeViewModel(),
                            child: HomeScreen(
                              userName:
                                  authenticationViewModel.user!.displayName ??
                                  '',
                              userEmail:
                                  authenticationViewModel.user!.email ?? '',
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
