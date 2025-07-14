import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/home/domain/model/templete.dart';

class FullScreenModalWidget extends StatelessWidget {
  final Templete? templete;

  const FullScreenModalWidget({
    Key? key,
    this.templete, // required로 필수 인자 지정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo 여기서 Templete 종료 파악해서 확대 비율 자동 조절
    final screenWidth = MediaQuery.of(context).size.width;
    final targetWidth = screenWidth * 0.95;
    final targetHeight = targetWidth * 1.414;

    return SafeArea(
      child: Center(
        child: Container(
          width: targetWidth,
          height: targetHeight,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              InteractiveViewer(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      templete != null
                          ? "${templete?.id}\n여기서 확대 축소가 가능합니다.\n심지어 지금도 말이죠!"
                          : "지금은 템플릿이 준비 안됐네요!\n여기서 확대 축소가 가능합니다.\n심지어 지금도 말이죠!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none, // ← 밑줄 제거
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
