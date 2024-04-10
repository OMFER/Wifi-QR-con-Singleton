class Sing {
  static final Sing _singleton = Sing._internal();
  factory Sing() => _singleton;
  Sing._internal();
}

class NumberSingletonLazy{
  static NumberSingletonLazy? _instance;
  NumberSingletonLazy._internal(){
    _instance=this;
    print('Create Lazy');
  }
  factory NumberSingletonLazy() => _instance ?? NumberSingletonLazy._internal();
  renderState(Function onState){
    onState();
  }
}