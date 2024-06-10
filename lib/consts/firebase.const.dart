import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
User? user = firebaseAuth.currentUser;

//Colections
const usersCollections = "users";
