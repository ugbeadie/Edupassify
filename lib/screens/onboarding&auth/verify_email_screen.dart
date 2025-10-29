import 'package:flutter/material.dart';
import 'package:coffee_card/utils/app_colors.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryBlue,
              child: Icon(Icons.email, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 24),
            const Text(
              "Verify Your Email",
              style: TextStyle(
                fontSize: 28,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "We've sent a verification code to\nyour.email@example.com",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // OTP boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (_) => SizedBox(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentYellow,

                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Verify Email",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text("Didn’t receive the code? Resend"),
            ),
          ],
        ),
      ),
    );
  }
}
