import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends ChangeNotifier {
  Map<Permission, PermissionStatus> _permissionStatuses = {};
  bool _didRequestSettings = false;
  String _deniedMessage = "";
  String _permanetlyDeniedMessage = "";

  final Map<Permission, String> permissionDenyMessages = {
    Permission.camera: "카메라 권한 허용 X",
    Permission.location: "위치 권한 허용 X",
    Permission.microphone: "오디오 권한 허용 X",
  };

  Map<Permission, PermissionStatus> get permissionStatuses => _permissionStatuses;
  bool get didRequestSettings => _didRequestSettings;
  String get deniedMessage => _deniedMessage;
  String get permanetlyDeinedMessage => _permanetlyDeniedMessage;

  SplashViewModel() {
    print('[INITIALIZED]: SPLASH VIEW_MODEL');
  }

  void setDidRequestSettings(bool value) {
    _didRequestSettings = value;
  }

  ///AndroidManifest.xml 파일에서 필요한 권한 추가 필요.
  Future<void> checkPermissions({
    required VoidCallback onGranted,
    required VoidCallback onDenied,
    required VoidCallback onPermanentlyDenied,
  }) async {
    try {
      final permissions = [
        Permission.camera,
        Permission.location,
        Permission.microphone,
      ];

      bool hasDenied = false; //권한 거부
      bool hasPermanentlyDenied = false; //권한 영구 거부

      final deniedMessages = <String>[];
      final permanentlyDeniedMessages = <String>[];
      for (Permission permission in permissions) {
        final status = await permission.status;

        if (status.isPermanentlyDenied) {
          _permissionStatuses[permission] = status;
          hasPermanentlyDenied = true;

          final msg = permissionDenyMessages[permission];
          if (msg != null) {
            permanentlyDeniedMessages.add("- $msg");
          }

        } else if (!status.isGranted) {
          final requestStatus = await permission.request();
          _permissionStatuses[permission] = requestStatus;
          if (!requestStatus.isGranted) {
            hasDenied = true;

            final msg = permissionDenyMessages[permission];
            if (msg != null) {
              deniedMessages.add("- $msg");
            }
          }
        } else {
          _permissionStatuses[permission] = status;
          print('${permission.toString()} 권한 허용됨');
        }
      }
      _deniedMessage = deniedMessages.join('\n');
      _permanetlyDeniedMessage = permanentlyDeniedMessages.join('\n');

      if (hasPermanentlyDenied) {
        onPermanentlyDenied();
      } else if (hasDenied) {
        onDenied();
      } else {
        onGranted();
      }
    } catch (e) {
      print("권한 검사 오류 발생: $e");
    }
  }
}
