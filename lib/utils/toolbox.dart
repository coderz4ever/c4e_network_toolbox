part of c4e_network_toolbox;

class Ping extends StatefulWidget {
  @override
  _PingState createState() => _PingState();
}

class _PingState extends State<Ping> {
  final _formKey = GlobalKey<FormState>();
  dynamic _res;
  final formIP = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formIP.dispose();
    super.dispose();
  }

  Future getPingResult() async {
    dynamic res = await FlutterNetworkToolbox.ping(formIP.text);
    setState(() {
      _res = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: OverflowBox(
            minHeight: 200.0,
            maxHeight: 250.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: formIP,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an ip';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                        getPingResult();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
                Text(_res ?? '')
              ],
            )));
  }
}

class Traceroute extends StatefulWidget {
  @override
  _TracerouteState createState() => _TracerouteState();
}

class _TracerouteState extends State<Traceroute> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await FlutterNetworkToolbox.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(_platformVersion));
  }
}
