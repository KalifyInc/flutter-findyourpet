import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  late ConnectivityResult result;

  late StreamSubscription subscription;

  var isConnected = false;

  checkInternet(context) async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox(context);
    }
  }

  showDialogBox(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
                title: const Text('Sem internet!'),
                content: const Text('Confira sua conexão com a internet'),
                actions: [
                  CupertinoButton.filled(
                    child: const Text('Tente novamente'),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet(context);
                    },
                  )
                ]));
  }

  startStreaming(context) {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet(context);
    });
  }
}
