import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/wifi_singelton.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  WifiSing datos = WifiSing();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        datos.clear();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Qr'),
        ),
        body: Center(
          child: QrImageView(
            //`${datos.ssid.value}, ${datos.pass.value}, ${datos.seg.value}`
            data:
                '{\'ssid\': \'${datos.ssid}\',\'password\': \'${datos.pass}\',\'seguridad\': \'${datos.seg}\'}',
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
