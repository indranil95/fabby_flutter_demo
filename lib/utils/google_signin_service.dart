import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? _currentUser;

  // Sign in and return the user data as a map
  Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        _currentUser = account;
        return {
          'name': account.displayName,
          'id': account.id,
          'email': account.email,
          'photoUrl': account.photoUrl,
        };
      }
      return null; // No account signed in
    } catch (error) {
      print('Error during Google Sign-In: $error');
      return null; // Sign-in failed
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _currentUser = null;
  }
}
