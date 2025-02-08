import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/widgets/or_login_with_section.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String name = '/register-screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordObscureText = true;
  bool _isConfirmPasswordObscureText = true;
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
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _onTapNextButton,
                child: Text('Register'),
              ),
              SizedBox(height: 40),
              OrLoginWithSection(),
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
            obscureText: _isPasswordObscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  _isPasswordObscureText =! _isPasswordObscureText;
                  setState(() {});
                },
                icon: Icon(_isPasswordObscureText ? Icons.visibility : Icons.visibility_off),
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
          SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            obscureText: _isConfirmPasswordObscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  _isConfirmPasswordObscureText =! _isConfirmPasswordObscureText;
                  setState(() {});
                },
                icon: Icon(_isConfirmPasswordObscureText ? Icons.visibility : Icons.visibility_off),
              ),
              hintText: 'Confirm Password',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your confirm password';
              }
              if (value != _passwordTEController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
  }
}
