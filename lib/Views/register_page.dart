import 'package:demoappliaction/values/colors.dart';
import 'package:demoappliaction/widgets/data_input_forms/common_text_form_field/common_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Icon(Icons.app_registration_outlined,
                  size: 120, color: AppColors.appPrimaryColor),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text("Lets Begin Your Journey !!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              CommonTextFormField(
                inputTitle: "Email",
                controller: emailController,
                suffix: Container(),
                onSubmitComplete: (value) {},
                hintText: "Enter your email",
                onChanged: (value) {},
                onEditingComplete: () {},
                focusNode: emailFocusNode,
              )
            ],
          ),
        ),
      ),
    );
  }
}
