import 'package:flutter/material.dart';
import 'package:flutter_templete/feature/drawer_navigation/widget/drawer_widget.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/feature/home/presentation/widget/full_screen_modal_widget.dart';
import 'package:flutter_templete/feature/home/presentation/widget/ratio_16_to_9_list_view_widget.dart';
import 'package:flutter_templete/feature/home/presentation/widget/ratio_1_to_1_141_list_view_widget.dart';
import 'package:flutter_templete/feature/home/presentation/widget/ratio_3_to_5_list_view_widget.dart';
import 'package:flutter_templete/widgets/custom_app_bar.dart';
import 'package:flutter_templete/widgets/no_padding_icon_button.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<HomeViewModel>();
      await vm.fetchTempleteList();
      await vm.setUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
            appBarHeight: 56,
            customTitle: Text("Templete"),
            isMockUI: true,
            customLeading: Builder(
              builder: (context) {
                return NoPaddingIconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      ZoomDrawer.of(context)?.toggle();
                    },
                    width: 30,
                    height: 30);
              },
            )),
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Resume Template",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Ratio1To1141ListViewWidget(),
                SizedBox(height: 40,),
                Text(
                  "PowerPoint Template",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Ratio16To9ListViewWidget(),
                SizedBox(height: 40,),
                Text(
                  "PhotoCard Template",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Ratio3To5ListViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
