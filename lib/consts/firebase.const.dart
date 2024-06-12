import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
User? currentUser = firebaseAuth.currentUser;

//Colections
const usersCollections = "users";
const productCollections = "products";
