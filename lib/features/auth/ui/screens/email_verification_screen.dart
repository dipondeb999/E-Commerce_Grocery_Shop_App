import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/register_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/widgets/or_login_with_section.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification-screen';

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                'Forgot Password',
                textAlign: TextAlign.left,
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              _buildTextFormField(),
              SizedBox(height: 20),
              _backToSignInButton(textTheme),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onTapSendCodeButton,
                child: Text('Send Code'),
              ),
              SizedBox(height: 40),
              OrLoginWithSection(),
              SizedBox(height: 40),
              _buildRegisterNowButton(textTheme),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _emailTEController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          hintText: 'Email',
        ),
        validator: (String? value) {
          if (value?.trim().isEmpty ?? true) {
            return 'Enter your email address';
          }
          if (EmailValidator.validate(value!) == false) {
            return 'Enter a valid email address';
          }
          return null;
        },
      ),
    );
  }

  Widget _backToSignInButton(TextTheme textTheme) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Back to sign in',
          style: textTheme.titleSmall?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _onTapSendCodeButton() {
    // if (_formKey.currentState!.validate()) {}
    Navigator.pushNamed(context, OtpVerificationScreen.name);
  }

  Widget _buildRegisterNowButton(TextTheme textTheme) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RegisterScreen.name);
        },
        child: RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: 'Register Now',
                style: textTheme.titleSmall?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
