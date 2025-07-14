import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/home/presentation/bottom_sheet/show_select_templete_bottom_sheet.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/feature/home/presentation/widget/full_screen_modal_widget.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';
import 'package:provider/provider.dart';

class Ratio1To1141ListViewWidget extends StatelessWidget {
  const Ratio1To1141ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Container(
      height: 401,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: vm.templeteList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          final item = vm.templeteList[index];
          return GestureDetector(
            onTap: () {
              final result = showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => ChangeNotifierProvider.value(
                    value: vm,
                    child: ShowSelectTempleteBottomSheet(),
                  )
              );
              if (result == null) {
                print("바텀 시트 닫힘");
              }
            },
            child: Container(
              width: 220,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1.414,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          if (vm.getImagePathByStatus(item.status) != null)
                            Image.asset(
                              vm.getImagePathByStatus(item.status)!,
                              fit: BoxFit.cover,
                            ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Text(
                              vm.getStatusStringPathByStatus(item.status),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            bottom: 8,
                            child: NoPaddingIconButton(
                              onPressed: () {
                                showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel: 'close',
                                  barrierColor: Colors.black.withOpacity(0.6),
                                  transitionDuration: Duration(milliseconds: 300),
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return FullScreenModalWidget(templete : item);
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.center_focus_strong,
                                color: Colors.black,
                                size: 20,
                              ),
                              width: 20,
                              height: 20,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox( height: 4,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.templateName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 3,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.description,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      item.updatedAt,
                      style: TextStyle(
                          fontSize: 9, fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
