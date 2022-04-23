import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BMICalculatorFirebaseUser {
  BMICalculatorFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

BMICalculatorFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BMICalculatorFirebaseUser> bMICalculatorFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BMICalculatorFirebaseUser>(
            (user) => currentUser = BMICalculatorFirebaseUser(user));
