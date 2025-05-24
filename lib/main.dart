import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_coding_test/views/screens/authentication_screen.dart';
import 'package:mobile_app_coding_test/firebase_options.dart';
import 'package:mobile_app_coding_test/view_models/authentication_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
      ],
      child: const AuthenticationScreen(),
    ),
  );
}
