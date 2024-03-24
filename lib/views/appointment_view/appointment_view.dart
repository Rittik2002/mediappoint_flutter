import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/controllers/appointment_controller.dart';
import 'package:mediappoint/views/appointments_details_view/appointmens_details_view.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
          title: "Appointments",
          color: Colors.white,
        ),
        actions: [
          Visibility(
            visible: isDoctor,
            child: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () {
                Get.offAll(() => const LoginView());
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.getAppointment(isDoctor),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Get.to(
                        () => AppointmentDetailsView(
                          doc: data[index],
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      child: Image.asset(iconsList[0]),
                    ),
                    title: Appstyle.bold(
                      title: data![index]
                          [!isDoctor ? 'appWithName' : 'appName'],
                    ),
                    subtitle: Appstyle.normal(
                      title:
                          "On ${data[index]['appDay']}at ${data[index]['appTime']}",
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
