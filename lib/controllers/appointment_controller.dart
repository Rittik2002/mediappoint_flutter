import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediappoint/consts/consts.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  bookApppointment(String docid, String docName, context) async {
    isLoading(true);
    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMsg': appMessageController.text,
      'appWith': docid,
      'appWithName': docName,
    });
    isLoading(false);
    VxToast.show(context, msg: "Appointment is booked Successfully");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointment(bool isDoctor) {
    if (isDoctor) {
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appWith', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    } else {
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appBy', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }
  }
}
