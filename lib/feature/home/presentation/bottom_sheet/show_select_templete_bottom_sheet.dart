import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';
import 'package:provider/provider.dart';

class ShowSelectTempleteBottomSheet extends StatelessWidget {
  const ShowSelectTempleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> keywords = [
      "키워드 입력란",
      "경력 입력란",
      "강점 어필란",
      ":링크 삽입란",
      "프로필 편집",
    ];
    final vm = context.watch<HomeViewModel>();
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "Templete Info",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    NoPaddingIconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, size: 30, color: Colors.white),
                      width: 30,
                      height: 30,
                      color: Colors.black.withOpacity(0.3),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Container(
                                color: Colors.black.withOpacity(0.3),
                                padding: EdgeInsets.all(4),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double parentHeight = constraints.maxHeight;
                                    double parentHieght = constraints.maxWidth;
                                    return Center(
                                      /// 템플릿이 몇대 몇 비율인지에 따라서, with를 기준점으로 할지 height을 기준점으로 할지 달라진다.
                                      child: Container(
                                        width: parentHeight / 1.414,
                                        height: parentHeight,
                                        color: Colors.white,
                                        child: Image.asset(
                                          'assets/images/bwink_msc_09_single_05.jpg',
                                          fit: BoxFit.cover, // 또는 contain 등 상황에 맞게
                                        ),
                                      ),
                                    );
                                  },
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              "Templete Name",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Update Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize: 9),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Templete Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 22,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                            itemBuilder: (context, index) {
                              //final item = vm.templeteList[index];
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Text(
                                    "#Tag ${index}",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Explain",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 8, // 가로 간격
                          runSpacing: 8, // 세로 간격
                          children: List.generate(
                            keywords.length,
                                (index) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                keywords[index],
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
