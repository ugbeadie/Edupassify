import 'package:coffee_card/main.dart';
import 'package:coffee_card/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:coffee_card/services/auth_services.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '', email = '', password = '';
  bool agreed = false;
  bool loading = false;

  Future<void> register() async {
    if (!_formKey.currentState!.validate()) return;
    if (!agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the Terms & Conditions')),
      );
      return;
    }

    setState(() => loading = true);

    try {
      await authService.value.signUp(
        fullName: fullName.trim(),
        email: email.trim(),
        password: password,
      );

      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const AuthWrapper()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint('error signup: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundGray,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlue),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SignInScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Text(
                "Create Account",
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Join thousands of students excelling",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              const SizedBox(height: 32),

              _buildLabel("Full Name"),
              const SizedBox(height: 8),
              TextFormField(
                decoration: _inputDecoration("John Doe"),
                onChanged: (v) => fullName = v,
                validator: (v) =>
                    v!.isEmpty ? 'Please enter your full name' : null,
              ),
              const SizedBox(height: 24),

              _buildLabel("Email Address"),
              const SizedBox(height: 8),
              TextFormField(
                decoration: _inputDecoration("your.email@example.com"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) => email = v,
                validator: (v) => v!.isEmpty
                    ? 'Please enter your email'
                    : (!v.contains('@') ? 'Enter a valid email address' : null),
              ),
              const SizedBox(height: 24),

              _buildLabel("Password"),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration: _inputDecoration("Min. 8 characters"),
                onChanged: (v) => password = v,
                validator: (v) => v!.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Checkbox(
                    value: agreed,
                    activeColor: AppColors.primaryBlue,
                    onChanged: (v) => setState(() => agreed = v ?? false),
                  ),
                  const Text("I agree to the "),
                  const Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentYellow,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBlue,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInScreen()),
                    );
                  },
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );

  static InputDecoration _inputDecoration(String hint) => InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
  );
}
