import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';

class AppointmentDetailsView extends StatelessWidget {
  
  final DocumentSnapshot doc;
  const AppointmentDetailsView({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
          title: "Appointment's details",
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appstyle.bold(title: "Selected Day Of Appointment:"),
            5.heightBox,
            Appstyle.normal(title: doc['appDay']),
            10.heightBox,
            Appstyle.bold(title: "Selected Time Of Appointment:"),
            5.heightBox,
            Appstyle.normal(title: doc['appTime']),
            10.heightBox,
            Appstyle.bold(title: "Mobile Number: "),
            5.heightBox,
            Appstyle.normal(title: doc['appMobile']),
            10.heightBox,
            Appstyle.bold(title: "Full Name:"),
            5.heightBox,
            Appstyle.normal(title: doc['appName']),
            10.heightBox,
            Appstyle.bold(title: "Message:"),
            5.heightBox,
            Appstyle.normal(title: doc['appMsg']),
          ],
        ),
      ),
    );
  }
}
