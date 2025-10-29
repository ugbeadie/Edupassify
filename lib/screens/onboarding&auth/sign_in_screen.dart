import 'package:coffee_card/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    'E',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Headings
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to continue learning',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                const SizedBox(height: 40),

                // TextFields
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Email Address"),
                      const SizedBox(height: 8),
                      _buildInput(hint: "your.email@example.com"),

                      const SizedBox(height: 24),

                      _buildLabel("Password"),
                      const SizedBox(height: 8),
                      _buildInput(hint: "Min. 8 characters", obscure: true),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Sign In button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentYellow,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Sign Up text with clickable link
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    children: [
                      const TextSpan(text: "Don’t have an account? "),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Label text widget
  static Widget _buildLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );

  // Input field widget
  static Widget _buildInput({String? hint, bool obscure = false}) => TextField(
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
