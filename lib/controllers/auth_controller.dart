import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/views/appointment_view/appointment_view.dart';
import 'package:mediappoint/views/home_view/home.dart';

class Authcontroller extends GetxController {
  var fullnamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  //doctors editingcontrollers

  var aboutcontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var servicescontroller = TextEditingController();
  var timingcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var categorycontroller = TextEditingController();
  
  UserCredential? usercredential;

  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user != null) {
          var data = await FirebaseFirestore.instance
              .collection('doctors')
              .doc(user.uid)
              .get();
          var isDoc = data.data()?.containsKey('docName') ?? false;
          if (isDoc) {
            Get.offAll(() => const AppointmentView());
          } else {
            Get.offAll(() => const Home());
          }
        } else {
          Get.offAll(() => const LoginView());
        }
      },
    );
  }

  loginUser() async {
    usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }
  
  storeUserData(String uid, String fullname, String email,bool isDoctor) async {
    var store = FirebaseFirestore.instance.collection(isDoctor?'doctors':'users').doc(uid);
    if(isDoctor){
      await store.set({
        'DocAbout': aboutcontroller.text,
        'docAddress':addresscontroller.text,
        'docServices':servicescontroller.text,
        'docTiming':timingcontroller.text,
        'docPhone':phonecontroller.text,
        'docCategory':categorycontroller.text,
        'docName':fullname,
        'docid':FirebaseAuth.instance.currentUser?.uid,
        'docRating':3,
        'docEmail':email,
      });
    }else{
      await store.set({'fullname':fullname,'email':email});
    }
  }

  signupUser(bool isdoctor) async {
    usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
    await usercredential!.user!.updateDisplayName(fullnamecontroller.text);
    await storeUserData(
      usercredential!.user!.uid,
      fullnamecontroller.text,
      emailcontroller.text,
      isdoctor,
    );
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
