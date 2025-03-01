import 'dart:developer'; // For proper logging
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _name = ''.obs;
  final _email = ''.obs;
  final _username = ''.obs;
  final _dob = ''.obs;
  final _gender = ''.obs;
  final _phone = ''.obs;
  final _surname = ''.obs;

  get name => _name.value;
  set name(value) => _name.value = value;

  get email => _email.value;
  set email(value) => _email.value = value;

  get username => _username.value;
  set username(value) => _username.value = value;

  get dob => _dob.value;
  set dob(value) => _dob.value = value;

  get gender => _gender.value;
  set gender(value) => _gender.value = value;

  get phone => _phone.value;
  set phone(value) => _phone.value = value;

  get surname => _surname.value;
  set surname(value) => _surname.value = value;

  Future<void> fetchUserDetails() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        name = data['name'] ?? '';
        email = data['email'] ?? '';
        username = data['username'] ?? '';
        dob = data['dob'] ?? '';
        gender = data['gender'] ?? '';
        phone = data['phone'] ?? '';
        surname = data['surname'] ?? '';

        update();
      } else {
        log('User document does not exist.');
      }
    } catch (e) {
      log("Error fetching user details: $e");
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails(); // No `await` needed
  }
}
