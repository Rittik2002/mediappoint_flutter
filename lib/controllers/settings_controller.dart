import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediappoint/consts/consts.dart';

class SettingsController extends GetxController {
  var isLoading = false.obs;
  var currentuser = FirebaseAuth.instance.currentUser;
  var username = ''.obs;
  var email = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    getUserData();
  }
  getUserData() async {
    
    isLoading(true);
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(currentuser!.uid)
        .get();
    var userData = user.data();
    username.value=userData!['fullname'] ?? '';
    email.value=currentuser!.email??'';
    isLoading(false);
    
  }
}
