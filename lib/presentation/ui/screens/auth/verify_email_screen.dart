import 'package:e_commerce_project/presentation/state_holders/send_email_otp_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                ),
                Image.asset(
                  AssetsPath.logo,
                  width: MediaQuery.of(context).size.height * 0.1,
                  height: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Enter Your Email Address",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "Email Address"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter your email";
                      }
                      String emailPattern =
                          r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';

                      RegExp regExp = RegExp(emailPattern);
                      if (!regExp.hasMatch(value!)) {
                        return "Enter a valid email address";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<SendEmailOtpController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool result = await controller
                                .sendOtpToEmail(_emailController.text.trim());
                            if (result) {
                              Get.to(
                                () => VerifyOtpScreen(
                                    email: _emailController.text.trim()),
                              );
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Send OTP failed',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
