import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/feature/home/presentation/widget/full_screen_modal_widget.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';
import 'package:provider/provider.dart';

class Ratio3To5ListViewWidget extends StatelessWidget {
  const Ratio3To5ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Container(
      height: 457,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          //final item = vm.templeteList[index];
          return Container(
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
                  aspectRatio: 3 / 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Positioned(
                          left: 8,
                          bottom: 8,
                          child: Text(
                            "State",
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
                                  return FullScreenModalWidget();
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
                    "Name",
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
                    "Description",
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
                    "Update Time",
                    style: TextStyle(
                        fontSize: 9, fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
