import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';

class HomeController extends GetxController {
  var isLoding = false.obs;
  var searchQueryController=TextEditingController();
  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList(){
    var doctors=FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}