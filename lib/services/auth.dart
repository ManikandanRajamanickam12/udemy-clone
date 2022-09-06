import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:udemyclone/services/storage.dart';

class Authentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SecureStorage _secureStorage = SecureStorage();
  Future<String> googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    AuthCredential? authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken);
    UserCredential? userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    User? user = userCredential.user;
    assert(user?.displayName != null);
    assert(user?.email != null);

    User? currentUser = _firebaseAuth.currentUser;
    assert(currentUser?.uid == user?.uid);
    _secureStorage.writeSecureData("email", user?.email);
    _secureStorage.writeSecureData("name", user?.displayName);

    return "Error Occured";
  }

  Future<String> googleSignOut() async {
    _googleSignIn.signOut();
    return "Error Occured";
  }
}
