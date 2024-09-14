import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null; // The user canceled the sign-in
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Get currently signed-in user
  User? get currentUser => _auth.currentUser;
}
