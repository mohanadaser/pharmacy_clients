

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();

    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
          messageText: const Text('تأكد من الاتصال بالانترنت',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
      update();
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
      update();
    }
  }
}