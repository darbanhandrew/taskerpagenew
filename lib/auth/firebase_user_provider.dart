import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TaskerpageFirebaseUser {
  TaskerpageFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TaskerpageFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TaskerpageFirebaseUser> taskerpageFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TaskerpageFirebaseUser>(
      (user) {
        currentUser = TaskerpageFirebaseUser(user);
        return currentUser!;
      },
    );
