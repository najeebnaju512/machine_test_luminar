import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/core/tag_helper/teg_generator.dart';
import 'package:machine_test_luminar/screens/un_authenticated/login/controller.dart';
import 'package:machine_test_luminar/widget/text_form_feild/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controller;

  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(LoginController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 64,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Please log in to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                CustomTextFormField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validationTypes: [
                    ValidationType.required,
                    ValidationType.email,
                  ],
                ),
                const SizedBox(height: 16),

                CustomTextFormField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validationTypes: [
                    ValidationType.required,
                    ValidationType.minLength,
                  ],
                  minLength: 6,
                ),

                const SizedBox(height: 24),
                Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: controller.onSubmit,
                    child: controller.isLoading.value
                        ? CupertinoActivityIndicator(color: Colors.white)
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
