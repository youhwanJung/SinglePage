import 'package:flutter/material.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';
import 'package:flutter_templete/feature/auth/presentation/auth_view_model.dart';
import 'package:flutter_templete/widgets/custom_button.dart';
import 'package:flutter_templete/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

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
                "로그인",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: loginEmailController,
                onChanged: (text) {
                  vm.loginEmail = text;
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
                controller: loginPasswordController,
                onChanged: (text) {
                  vm.loginPassword = text;
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
              CustomButton(
                onPressed: () async {
                  await vm.login();
                },
                width: double.infinity,
                height: 40,
                pressedColor: Colors.black12,
                backgroundColor: Colors.black,
                borderRadius: 0,
                child: Text(
                  "로그인 버튼",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () {
                  context.push(RouteNames.signUp);
                },
                width: double.infinity,
                height: 40,
                pressedColor: Colors.black12,
                backgroundColor: Colors.black,
                borderRadius: 0,
                child: Text(
                  "회원 가입 버튼",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
