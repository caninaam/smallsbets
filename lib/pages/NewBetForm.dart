import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smallsbets/models/Bet.dart';
import 'package:smallsbets/services/Betservices.dart';


class NewBetPage extends StatelessWidget {
  final User? user;
  final Betservices batservices = Betservices();

  NewBetPage({required this.user});

  Future<void> _addBet() async {
    batservices.createBet(Bet(
      title: 'Titlezdagdwi',
      description: 'Description',
      rivalMail: '  ', id: 0, refereeMail: ''));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Bet'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user!.displayName ?? 'User Name'),
              accountEmail: Text(user!.email ?? 'User Email'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  user!.photoURL ?? 'https://via.placeholder.com/150',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implement sign out or other actions here
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bet Title',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bet Description',
                ),
              )
              ,
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Rival  mail',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Referee  mail',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                _addBet();

                },
                child: Text('Submit Bet test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
