import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/resume_editor/presentation/resume_editor_view_model.dart';
import 'package:flutter_templete/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SideBarProfileHeaderSectionWidget extends StatelessWidget {
  final double width;
  final double height;

  const SideBarProfileHeaderSectionWidget(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResumeEditorViewModel>(
      builder: (context, vm, child) {
        return Container(
          width: width,
          height: height * 0.25,
          color: Colors.yellow.withOpacity(0.1),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  child: Center(
                      child: Material(
                    color: Colors.white,
                    shape: CircleBorder(),
                    child: InkWell(
                      customBorder: CircleBorder(),
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        print("터치됨");
                      },
                      //todo 여기서 이미지
                      // child: CircleAvatar(
                      //   radius: 50,
                      //   backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                      // ),
                    ),
                  )),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        isTextCenter: true,
                        fontWeight: FontWeight.w600,
                        backgroundColor: Colors.transparent,
                        width: double.infinity,
                        height: 23,
                        borderRadius: 4.0,
                        borderWidth: 0,
                        fontSize: 16,
                        fontColor: Colors.white,
                        horizontalPadding: 8,
                        verticalPadding: 8,
                        enabled: true,
                        hintText: "이름 입력",
                        hintFontSize: 16,
                        onChanged: (text) {

                        },
                      ),
                      CustomTextField(
                        isTextCenter: true,
                        fontWeight: FontWeight.w400,
                        backgroundColor: Colors.transparent,
                        width: double.infinity,
                        height: 20,
                        borderRadius: 4.0,
                        borderWidth: 0,
                        fontSize: 10,
                        fontColor: Colors.white,
                        horizontalPadding: 8,
                        verticalPadding: 8,
                        hintFontSize: 10,
                        enabled: true,
                        hintText: "인트로 입력",
                        onChanged: (text) {

                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
