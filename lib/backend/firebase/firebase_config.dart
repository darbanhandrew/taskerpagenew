import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA9j8wcHN_IymDjMkgcknvFLzkUPrRbMXE",
            authDomain: "taskerpage-2dd15.firebaseapp.com",
            projectId: "taskerpage-2dd15",
            storageBucket: "taskerpage-2dd15.appspot.com",
            messagingSenderId: "916384246833",
            appId: "1:916384246833:web:216157fb13c11c85473910",
            measurementId: "G-ENLWCM4164"));
  } else {
    await Firebase.initializeApp();
  }
}
