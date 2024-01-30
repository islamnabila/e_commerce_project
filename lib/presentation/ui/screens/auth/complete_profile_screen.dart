import 'package:e_commerce_project/data/models/create_profile_params.dart';
import 'package:e_commerce_project/presentation/state_holders/complete_profile_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/verify_otp_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameComtroller = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileCOntroller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      AssetsPath.logo,
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Complete Profile",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get started with us with your details",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: _firstNameComtroller,
                        decoration: InputDecoration(hintText: "First Name"),
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter first name";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(hintText: "Last Name"),
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter last name";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: _mobileCOntroller,
                        decoration: InputDecoration(hintText: "Mobile"),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter mobile number";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(hintText: "City"),
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your city";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: _shippingAddressController,
                        maxLines: 4,
                        decoration:
                            InputDecoration(hintText: "Shopping Address"),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your shipping address";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<CompleteProfileController>(
                          builder: (completeProfileController) {
                        return Visibility(
                          visible:
                              completeProfileController.inProgress == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final createProfileParams =
                                      CreateProfileParams(
                                    firstName: _firstNameComtroller.text.trim(),
                                    lastName: _lastNameController.text.trim(),
                                    mobile: _mobileCOntroller.text.trim(),
                                    city: _cityController.text.trim(),
                                    shippingAddress:
                                        _shippingAddressController.text.trim(),
                                  );
                                  final bool result =
                                      await completeProfileController
                                          .createProfileData(
                                              Get.find<VerifyOtpController>()
                                                  .token,
                                              createProfileParams);
                                  if (result) {
                                    Get.offAll(() => MainBottomNavScreen());
                                  } else {
                                    Get.showSnackbar(GetSnackBar(
                                      title: "Complete Profile failed!",
                                      message: completeProfileController
                                          .errorMessage,
                                      duration: Duration(seconds: 2),
                                      isDismissible: true,
                                    ));
                                  }
                                }
                              },
                              child: Text("Complete")),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameComtroller.dispose();
    _lastNameController.dispose();
    _mobileCOntroller.dispose();
    _cityController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }
}
