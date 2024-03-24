import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/controllers/appointment_controller.dart';

class BookAppointmentView extends StatelessWidget {
  final String docid;
  final String docname;
  const BookAppointmentView(
      {super.key, required this.docid, required this.docname});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
          title: docname,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(child: Center(child: Appstyle.bold(title: "Appiontment with $docname"),),),
              // 10.heightBox,
              Appstyle.bold(title: "Select Day Of Appointment:"),
              5.heightBox,
              CustomTextField(
                hint: "Select Day",
                textController: controller.appDayController,
              ),
              10.heightBox,
              Appstyle.bold(title: "Select Time Of Appointment:"),
              5.heightBox,
              CustomTextField(
                hint: "Select Time",
                textController: controller.appTimeController,
              ),
              20.heightBox,
              Appstyle.bold(title: "Mobile Number: "),
              5.heightBox,
              CustomTextField(
                hint: "Enter Your Mobile Number",
                textController: controller.appMobileController,
              ),
              10.heightBox,
              Appstyle.bold(title: "Full Name:"),
              5.heightBox,
              CustomTextField(
                hint: "Enter Full Name Of Patient",
                textController: controller.appNameController,
              ),
              10.heightBox,
              Appstyle.bold(title: "Message:"),
              5.heightBox,
              CustomTextField(
                hint: "Enter Your Message",
                textController: controller.appMessageController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: "Book an appointment",
                  onTap: () async {
                    await controller.bookApppointment(docid, docname, context);
                  },
                ),
        ),
      ),
    );
  }
}
