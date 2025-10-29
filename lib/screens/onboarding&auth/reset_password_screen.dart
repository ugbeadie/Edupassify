import 'package:flutter/material.dart';
import 'package:coffee_card/utils/app_colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
              "Reset Password",
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Create a new secure password",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            const SizedBox(height: 32),

            _buildLabel("New Password"),
            SizedBox(height: 8),
            _buildInput(hint: "Min. 8 characters", obscure: true),

            const SizedBox(height: 24),

            _buildLabel("Confirm Password"),
            SizedBox(height: 8),
            _buildInput(hint: "Re-enter password", obscure: true),

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
                  "Reset Password",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );

  Widget _buildInput({String? hint, bool obscure = false}) => TextField(
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
