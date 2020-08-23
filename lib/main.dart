library c4e_network_toolbox;

import 'package:flutter/material.dart';
export 'package:flutter/material.dart';
import 'package:flutter/services.dart';
export 'package:flutter/services.dart';

import 'package:flutter_network_toolbox/flutter_network_toolbox.dart';
export 'package:flutter_network_toolbox/flutter_network_toolbox.dart';

part 'package:c4e_network_toolbox/views/home.dart';
part 'package:c4e_network_toolbox/utils/toolbox.dart';

void main() {
  runApp(C4eNetworkToolbox());
}

class C4eNetworkToolbox extends StatefulWidget {
  @override
  _C4eNetworkToolboxState createState() => _C4eNetworkToolboxState();
}

class _C4eNetworkToolboxState extends State<C4eNetworkToolbox> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Home(),
        ));
  }
}
