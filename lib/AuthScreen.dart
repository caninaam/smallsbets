import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smallsbets/FirebaseAuthService.dart';
import 'package:smallsbets/pages/newBetForm.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuthService authService = FirebaseAuthService();
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = authService.getCurrentUser();
    print('Initial user state: $_user');
  }

  Future<void> _signIn() async {
    User? user = await authService.signInWithGoogle();
    if (user != null) {
      setState(() {
        _user = user;
        print('Signed in as: ${user.displayName}');
      });
    } else {
      print('Sign in failed');
    }
  }

  Future<void> _signOut() async {
    await authService.signOut();
    setState(() {
      _user = null;
      print('User signed out');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Building UI, user: $_user');

    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Google Sign-In'),
        actions: _user != null
            ? [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: _signOut,
                ),
              ]
            : [],
      ),
      drawer: _user != null
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(_user!.displayName ?? 'User Name'),
                    accountEmail: Text(_user!.email ?? 'User Email'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                        _user!.photoURL ??
                            'https://via.placeholder.com/150', // Placeholder image if photoURL is null
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: _signOut,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Add new bet'),
                    onTap: () {
                      // Navigate to NewBetPage when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewBetPage(user: _user)),
                      );
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: _signIn,
                child: Text('Sign in with Google'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Signed in as: ${_user!.displayName}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signOut,
                    child: Text('Logout'),
                  ),
                ],
              ),
      ),
    );
  }
}
