import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_day7_module17/ui/screens/authentication/sign_in_screen.dart';
import 'package:task_manager_day7_module17/ui/utility/app_colors.dart';
import 'package:task_manager_day7_module17/ui/widgets/background_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _resetPasswordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120,),
                  Text('Set Password', style: Theme.of(context).textTheme.titleLarge,),
                  Text('Minimum length password 8 character with letter and number combination',
                    style: Theme.of(context).textTheme.titleSmall,),

                  const SizedBox(height: 24,),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _resetPasswordTEController,
                    decoration: const InputDecoration(
                      hintText: 'Password'
                    ),
                  ),

                  const SizedBox(height: 16,),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _confirmPasswordTEController,
                    decoration: const InputDecoration(
                        hintText: 'Confirm Password'
                    ),
                  ),

                  const SizedBox(height: 16,),

                  ElevatedButton(onPressed: _onTapConfirmButton,
                    child: const Text('Confirm'),),

                  const SizedBox(height: 36,),

                  Center(
                    child: RichText(text: TextSpan(
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontWeight: FontWeight.w600,
                            letterSpacing: .4
                        ),
                        text: "Have account? ",
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _onTapSignInButton();
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (route) => false);
  }

  _onTapConfirmButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (route) => false);
  }

  @override
  void dispose() {
    _resetPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
