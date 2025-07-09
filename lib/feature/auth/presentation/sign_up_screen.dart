import 'package:flutter/material.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';
import 'package:flutter_templete/feature/auth/presentation/auth_view_model.dart';
import 'package:flutter_templete/widgets/custom_button.dart';
import 'package:flutter_templete/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "회원가입",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: signUpEmailController,
                onChanged: (text) {
                  vm.signUpEmail = text;
                },
                width: double.infinity,
                height: 40,
                fontSize: 16,
                fontColor: Colors.black,
                horizontalPadding: 16,
                verticalPadding: 16,
                fontWeight: FontWeight.w400,
                hintText: "이메일 입력",
                hintFontSize: 16,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: signUpPasswordController,
                onChanged: (text) {
                  vm.signUpPassword = text;
                },
                width: double.infinity,
                height: 40,
                fontSize: 16,
                fontColor: Colors.black,
                horizontalPadding: 16,
                verticalPadding: 16,
                fontWeight: FontWeight.w400,
                hintText: "비밀번호 입력",
                hintFontSize: 16,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: signUpConfirmPasswordController,
                onChanged: (text) {
                  vm.signUpConfirmPassword = text;
                },
                width: double.infinity,
                height: 40,
                fontSize: 16,
                fontColor: Colors.black,
                horizontalPadding: 16,
                verticalPadding: 16,
                fontWeight: FontWeight.w400,
                hintText: "비밀번호 확인",
                hintFontSize: 16,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () async {
                  await vm.signUp();
                },
                width: double.infinity,
                height: 40,
                pressedColor: Colors.black12,
                backgroundColor: Colors.black,
                borderRadius: 0,
                child: Text(
                  "회원가입 버튼",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
