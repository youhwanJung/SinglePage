import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_templete/feature/server_call/presentation/server_call_view_model.dart';
import 'package:flutter_templete/widgets/alert_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/color/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';

/**
 * ServerCallScreen
 */

class ServerCallScreen extends StatefulWidget {
  const ServerCallScreen({super.key});

  @override
  State<ServerCallScreen> createState() => _ServerCallScreenState();
}

class _ServerCallScreenState extends State<ServerCallScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ServerCallViewModel>(context);

    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Text("Server Call Example Screen", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomButton(
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => vm.increment(),
                  backgroundColor: AppColors.buttonBackground,
                  pressedColor: AppColors.buttonPressed,
                  disabledColor: AppColors.buttonDisabled,
                  borderColor: AppColors.black,
                ),
                SizedBox(width : 20.w),
                CustomButton(
                  child: Text(
                    "-",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => vm.decrement(),
                  backgroundColor: AppColors.buttonBackground,
                  pressedColor: AppColors.buttonPressed,
                  disabledColor: AppColors.buttonDisabled,
                  borderColor: AppColors.black,
                ),
              ],
            ),
            SizedBox(height : 10.w),
            Row(
              children: [
                Text(
                  "Count Let's go : "
                ),
                Text(
                  "${vm.count}"
                )
              ],
            ),
            SizedBox(height : 10.w),
            Row(
              children: [
                CustomButton(
                  child: Text(
                    "Post",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => vm.serverPostExample(),
                  backgroundColor: AppColors.buttonBackground,
                  pressedColor: AppColors.buttonPressed,
                  disabledColor: AppColors.buttonDisabled,
                  borderColor: AppColors.black,
                ),
                SizedBox(width : 20.w),
                CustomButton(
                  child: Text(
                    "Get",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => vm.serverGetExample(),
                  backgroundColor: AppColors.buttonBackground,
                  pressedColor: AppColors.buttonPressed,
                  disabledColor: AppColors.buttonDisabled,
                  borderColor: AppColors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
