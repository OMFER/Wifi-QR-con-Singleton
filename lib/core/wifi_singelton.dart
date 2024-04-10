class WifiSing {

  static final WifiSing _singleton = WifiSing._internal();
  factory WifiSing() => _singleton;
  WifiSing._internal();/// UNA INSTANCIA 

  String? ssid;
  String? pass;
  String? seg;
  /*set pass(String? pass) => _pass = pass;
  set seg(String? seg) => _seg = seg;
  String? get pass => _pass;
  String? get seg => _seg;*/

  void clear (){
    ssid = '';
    pass = '';
    seg = '';
  }
}