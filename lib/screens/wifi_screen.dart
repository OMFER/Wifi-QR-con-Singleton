import 'package:app_wifi/core/wifi_singelton.dart';
import 'package:app_wifi/providers/testprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';


// ignore: must_be_immutable
class WifiScreen extends StatelessWidget {
  WifiSing datos = WifiSing();
  bool ocultar = true;
  bool listo = false;

  WifiScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  final Map<String, String>formValues = {
    "ssid":"",
    "pass":"",
    "seg":"",
  };

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TestProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wifi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
              child: Column(
            children: [

              //SSID
              CustomInputField(
                validator:(value)=> _validator(value),
                labelText: 'SSID',
                icon: Icons.wifi,
                formProperty: 'ssid',
                formValues: formValues,
              ),

              const SizedBox(
                height: 30,
              ),

              //password
              CustomInputField(
                obscureText: prov.isOscured,
                validator: (value) {
                  if (value == null) return 'Este campo es requerido';
                  return value.length < 8 ? 'Mínimo 8 caracteres' : null;
                },
                labelText: 'Password',
                icon: Icons.password_outlined,
                formProperty: 'pass',
                formValues: formValues,
                suffixIcon: IconButton(
                   onPressed: () {
                    prov.isOscured = !prov.isOscured;
                  },
                    icon: const Icon(Icons.visibility_off),
                  ),
              ),

              const SizedBox(
                height: 30,
              ),

              //tipo de seguridad WEP, WPA, WPA2, FT PSK, 802.1x EAP
              DropdownButtonFormField(
                items: const [
                  //DropdownMenuItem(value: '',child: Text(''),),
                  DropdownMenuItem(value: 'WEP',child: Text('WEP'),),
                  DropdownMenuItem(value: 'WPA',child: Text('WPA'),),
                  DropdownMenuItem(value: 'WPA2',child: Text('WPA2'),),
                  DropdownMenuItem(value: 'FT PSK',child: Text('FT PSK'),),
                  DropdownMenuItem(value: '802.1x EAP',child: Text('802.1x EAP'),),
                ],

                //decoración
                decoration: const InputDecoration(
                    labelText: 'Seguridad',
                    icon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ))),
                validator: (value) {
                  if (value == null) return 'Este campo es requerido';
                  return null;
                },
                //onChanged: (value) => datos.seg = value,
                onChanged: (value) => formValues['seg'] = value!,
              ),

              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Generar'))),
                onPressed: () {
                  if ( myFormKey.currentState!.validate()){
                  datos.ssid = formValues['ssid'];
                  datos.pass = formValues['pass'];
                  datos.seg = formValues['seg'];

                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'qr');
                        }
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
String? _validator(String? value){
  if (value == null) return 'Este campo es requerido';
  return value.isEmpty ? 'Ingrese una red valida' : null;
}