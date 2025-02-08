import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/email_verification_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/register_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/widgets/or_login_with_section.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscureText = true;
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
                'Welcome back! Glad to\nsee you, Again!',
                textAlign: TextAlign.left,
                style: textTheme.titleLarge?.copyWith(
                    color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              _buildTextFormFields(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EmailVerificationScreen.name);
                  },
                  child: Text(
                    'Forget password?',
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _onTapLoginButton,
                child: Text('Login'),
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

  Widget _buildTextFormFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            obscureText: _isObscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                  onPressed: () {
                    _isObscureText =! _isObscureText;
                    setState(() {});
                  },
                  icon: Icon(_isObscureText ? Icons.visibility : Icons.visibility_off),
              ),
              hintText: 'Password',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your password';
              }
              if (value!.length <= 6) {
                return 'Enter a password more than 6 characters';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _onTapLoginButton() {
    if (_formKey.currentState!.validate()) {}
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
    _passwordTEController.dispose();
  }
}
