import 'package:demoappliaction/Views/register_page.dart';
import 'package:demoappliaction/widgets/data_input_forms/common_text_form_field/common_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Icon(Icons.message_outlined, size: 120),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Text(
                  "Hello Welcome to the Chat application",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CommonTextFormField(
                    inputTitle: "UserName",
                    controller: usernameController,
                    suffix: Container(),
                    onSubmitComplete: (text) {},
                    hintText: "user name",
                    onChanged: (value) {},
                    onEditingComplete: () {}),
                CommonTextFormField(
                    inputTitle: "PassWord",
                    controller: PasswordController,
                    suffix: Container(),
                    onSubmitComplete: (text) {},
                    hintText: "pass word",
                    onChanged: (value) {
                      setState(() {});
                    },
                    onEditingComplete: () {}),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: ElevatedButton(
                          onPressed: () {
                            onPress();
                          },
                          child: Text("Login")),
                    )),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const RegisterScreen()));

                  },
                    child: const Text("Don't have a account ? lets Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPress() {
    if (kDebugMode) {
      print(usernameController.text.trim() + PasswordController.text.trim());
    }
  }
}
