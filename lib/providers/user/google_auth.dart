import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(clientId: '320498965593-0gopqk3nj24spfr4q2g55idi01k307q2.apps.googleusercontent.com', scopes: [
    'email',
    'https://www.googleapis.com/auth/drive.readonly',
  ]);
});
