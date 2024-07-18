// import 'dart:async';
// import 'dart:convert';

import 'package:cross_os_ble_demo/utils/central.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ChatScreen extends StatefulWidget {
  final BluetoothDevice device;

  const ChatScreen({super.key, required this.device});

  @override
  State<ChatScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<ChatScreen> {

  late Central central;

  @override
  void initState() {
    super.initState();
    central = Central(device: widget.device);
    central.init();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('centralTest(ログで確認して！)'),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed:(){
                  central.onRead();
                } ,
                child: const Text('read')
            ),
            const SizedBox(width: 100),
            ElevatedButton(
                onPressed:(){
                  central.onWrite('init');
                },
                child: const Text('write')
            )
          ],
        ),
      ),
    );
  }
}
