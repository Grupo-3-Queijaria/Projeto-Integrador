import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Contratos'),
            onTap: () {
              Navigator.pushNamed(context, '/contrato');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Contrato'),
            onTap: () {
              Navigator.pushNamed(context, '/add-contrato');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Propriedade'),
            onTap: () {
              Navigator.pushNamed(context, '/propriedade');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Propriedade'),
            onTap: () {
              Navigator.pushNamed(context, '/add-propriedade');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Tecnologia'),
            onTap: () {
              Navigator.pushNamed(context, '/tecnologia');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Tecnologia'),
            onTap: () {
              Navigator.pushNamed(context, '/add-tecnologia');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              } catch (e) {
                print('Erro ao deslogar: $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
