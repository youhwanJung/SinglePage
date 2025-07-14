import 'package:flutter/material.dart';
import 'package:flutter_templete/core/navigation/route_names.dart';
import 'package:flutter_templete/feature/drawer_navigation/drawer_navigation_view_model.dart';
import 'package:flutter_templete/feature/home/presentation/home_view_model.dart';
import 'package:flutter_templete/widgets/custom_button.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final vm = Provider.of<DrawerNavigationViewModel>(context);
    return Container(
        color: Colors.white,
        child: Material(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final parentHeight = constraints.maxHeight;
                        return Container(
                          width: parentHeight,
                          height: parentHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID : ${vm.id}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child:  Text(
                              "Email : ${vm.email}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          print("Edit Profile");
                        },
                        width: 52,
                        height: 32,
                        borderRadius: 3,
                        borderWidth: 1,
                        borderColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _drawerMenuTile(
                      onTap: () {
                        vm.selectMenuIndex(0);
                        ZoomDrawer.of(context)?.close();
                      },
                      selected: vm.selectedMenuIndex == 0,
                      icon: Icons.home_outlined,
                      title: "Home",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _drawerMenuTile(
                      onTap: () {
                        vm.selectMenuIndex(1);
                        ZoomDrawer.of(context)?.close();
                      },
                      selected: vm.selectedMenuIndex == 1,
                      icon: Icons.inventory_2_outlined,
                      title: "MyProjects",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _drawerMenuTile(
                      onTap: () {
                        vm.selectMenuIndex(2);
                      },
                      selected: vm.selectedMenuIndex == 2,
                      icon: Icons.delete_outline,
                      title: "Trash",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _drawerMenuTile(
                      onTap: () {
                        vm.selectMenuIndex(3);
                      },
                      selected: vm.selectedMenuIndex == 3,
                      icon: Icons.announcement_outlined,
                      title: "Notice",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _drawerMenuTile(
                      onTap: () async {
                        await vm.logout();
                        context.go(RouteNames.login);
                      },
                      selected: vm.selectedMenuIndex == 4,
                      icon: Icons.logout_outlined,
                      title: "Logout",
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _drawerMenuTile({
    required IconData icon,
    required String title,
    required bool selected,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: selected
          ? BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(4),
            )
          : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 25,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
