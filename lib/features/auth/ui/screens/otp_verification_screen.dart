import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verification-screen';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
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
                'Verification',
                textAlign: TextAlign.left,
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter Your Verification Code',
                  style: textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildTextFormField(),
              SizedBox(height: 20),
              _buildResendCodeButton(textTheme),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _onTapVerifyButton,
                child: Text('Verify'),
              ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: PinCodeTextField(
          controller: _pinTEController,
          appContext: context,
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            fieldHeight: 40,
            fieldWidth: 50,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveColor: AppColors.themeColor,
            selectedColor: AppColors.themeColor,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          validator: (String? value) {
            if (value == null || value.isEmpty || value.length != 4) {
              return 'Enter a 4-digit verification code';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildResendCodeButton(TextTheme textTheme) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            text: "If you didn't received a code? ",
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: 'Resend',
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

  void _onTapVerifyButton() {
    // if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    super.dispose();
    _pinTEController.dispose();
  }
}
