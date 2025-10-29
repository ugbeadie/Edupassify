// import 'package:coffee_card/screens/main_layout.dart';
// import 'package:flutter/material.dart';
// import 'screens/Home/home_screen.dart';
// import 'screens/onboarding&auth/onboarding_screen.dart';
// import 'screens/onboarding&auth/sign_in_screen.dart';
// import 'screens/onboarding&auth/sign_up_screen.dart';
// import 'screens/onboarding&auth/verify_email_screen.dart';
// import 'screens/onboarding&auth/forgot_password_screen.dart';
// import 'screens/onboarding&auth/reset_password_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Edupassify',

//       // Start the app with the Onboarding screen
//       initialRoute: '/onboarding',

//       routes: {
//         '/': (context) => const HomeScreen(), // main app screen
//         '/onboarding': (context) => const OnboardingScreen(),
//         '/signin': (context) => const SignInScreen(),
//         '/signup': (context) => const SignUpScreen(),
//         '/verify': (context) => const VerifyEmailScreen(),
//         '/forgot': (context) => const ForgotPasswordScreen(),
//         '/reset': (context) => const ResetPasswordScreen(),
//         '/main': (context) => const MainLayout(),
//       },
//     );
//   }
// }

import 'package:coffee_card/screens/onboarding&auth/forgot_password_screen.dart';
import 'package:coffee_card/screens/onboarding&auth/onboarding_screen.dart';
import 'package:coffee_card/screens/onboarding&auth/reset_password_screen.dart';
import 'package:coffee_card/screens/onboarding&auth/sign_in_screen.dart';
import 'package:coffee_card/screens/onboarding&auth/sign_up_screen.dart';
import 'package:coffee_card/screens/onboarding&auth/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'screens/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edupassify',
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/verify': (context) => const VerifyEmailScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/reset': (context) => const ResetPasswordScreen(),
        '/main': (context) => const MainLayout(),
      },
    );
  }
}
