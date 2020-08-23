part of c4e_network_toolbox;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int _selectedDrawerIndex = 0;
  dynamic _getDrawerItemWidget(pos) {
    switch (pos) {
      case 0:
        return new Ping();
      case 1:
        return new Traceroute();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("C4E Network Toolbox"),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Toolbox'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Ping'),
                selected: _selectedDrawerIndex == 0,
                onTap: () => _onSelectItem(0),
              ),
              ListTile(
                title: Text('Traceroute'),
                selected: _selectedDrawerIndex == 1,
                onTap: () => _onSelectItem(1),
              ),
              // ListTile(
              //   title: Text('Item 2'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ));
  }
}
