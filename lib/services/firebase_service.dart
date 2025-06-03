import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signInWithEmail(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  } on FirebaseAuthException catch (e) {
    print('Login error: $e');
    return null;
  }
}

Future<User?> registerWithEmail(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  } on FirebaseAuthException catch (e) {
    print('Registration error: $e');
    return null;
  }
}

void signOut() {
  FirebaseAuth.instance.signOut();
}
