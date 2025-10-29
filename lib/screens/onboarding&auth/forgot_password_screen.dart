import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:coffee_card/utils/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundGray,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 72),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your email to receive a reset link",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Text(
              "Email Address",
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "your.email@example.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reset');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentYellow,

                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Send Reset Link",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black54),
                  children: [
                    const TextSpan(text: "Remember password? "),
                    TextSpan(
                      text: "Sign In",
                      style: const TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Navigator.pushReplacementNamed(context, '/signin'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
