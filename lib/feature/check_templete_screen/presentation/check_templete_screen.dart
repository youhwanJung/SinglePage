import 'package:flutter/material.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';
import 'package:flutter_templete/core/utils/server_result_dialog.dart';
import 'package:flutter_templete/feature/auth/presentation/auth_view_model.dart';
import 'package:flutter_templete/feature/check_templete_screen/presentation/check_templete_view_model.dart';
import 'package:flutter_templete/widgets/custom_button.dart';
import 'package:flutter_templete/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CheckTempleteScreen extends StatefulWidget {
  const CheckTempleteScreen({super.key});

  @override
  State<CheckTempleteScreen> createState() => _CheckTempleteScreenState();
}

class _CheckTempleteScreenState extends State<CheckTempleteScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<CheckTempleteViewModel>();

    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CheckTempleteViewModel>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "어떤 템플릿이 있나요",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // 테두리 색상
                        width: 2.0,        // 테두리 두께
                      ),
                      color: Colors.transparent, // 배경 투명
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                width: 200,
                                height: 200 * 1.414,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, // 테두리 색상
                                    width: 2.0,        // 테두리 두께
                                  ),
                                  color: Colors.transparent, // 배경 투명
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 20,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 6,
                          dotWidth: 6,
                          activeDotColor: Colors.black,
                          dotColor: Colors.grey,
                          spacing: 8,
                          radius: 4,
                          expansionFactor: 2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          )
      ),
    );
  }
}
