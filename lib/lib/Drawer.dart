  drawer:  Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: new Color(0xFF0062ac),
              ),
              accountName: Text("Marcelo Augusto Elias"),
              accountEmail: Text("Matrícula: 5046850"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme
                    .of(context)
                    .platform == TargetPlatform.android
                    ? new Color(0xFF0062ac)
                    : Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            ListTile(
              dense: true,
              title: Text("Alternar Matrícula"),
              leading: new Image.asset(
                "assets/images/icons8-male-user-50.png",
                width: 20.0,
              ),
            ),
            ListTile(onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PMIScreen()),
              );
            },
              dense: true,
              title: Text("Contracheque"),
              leading: new Image.asset(
                "assets/images/icon_contracheque.png",
                width: 20.0,
              ),
            ),
      Divider(),
            ListTile(
              dense: true,
              title: Text("Compartilhar"),
              leading: new Image.asset(
                "assets/images/icon_compartilhar.png",
                width: 20.0,
              ),
            ),
            ListTile(
              dense: true,
              title: Text("Avaliar"),
              leading: new Image.asset(
                "assets/images/icon_estrela.png",
                width: 20.0,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              dense: true,
              title: Text("Sair"),
              trailing: Text(
                "Versão 2.0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              leading: new Image.asset(
                "assets/images/icon_porta_sair.png",
                width: 20.0,
              ),
            ),
          ],
        ),
      ),