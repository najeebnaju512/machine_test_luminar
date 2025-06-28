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
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                validationTypes: [
                  ValidationType.required,
                  ValidationType.minLength,
                ],
                minLength: 6,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  controller.onSubmit();
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'custom_text_form_field.dart'; // Make sure this file contains your validated CustomTextFormField

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Perform login
//       debugPrint("Email: ${_emailController.text}");
//       debugPrint("Password: ${_passwordController.text}");
//       // Add your login API or logic here
//     } else {
//       debugPrint("Form is invalid");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
