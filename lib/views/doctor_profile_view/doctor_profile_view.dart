import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/views/book_appointment_view/book_appointment_view.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 217, 220),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
          title: doc['docName'],
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset(iconsList[0]),
                      ),
                      10.widthBox,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Appstyle.bold(
                              title: doc['docName'],
                              color: Colors.black,
                            ),
                            Appstyle.bold(
                              title: doc['docCategory'],
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const Spacer(),
                            VxRating(
                              onRatingUpdate: (value) {},
                              selectionColor: Colors.yellowAccent.shade700,
                              maxRating: 5,
                              count: 5,
                              value: doc['docRating'] * 1.0,
                              stepInt: true,
                            ),
                          ],
                        ),
                      ),
                      Appstyle.bold(
                        title: "See all reviews",
                        color: Colors.blue,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Appstyle.bold(
                        title: "Phone Number",
                        color: Colors.black,
                      ),
                      subtitle: Appstyle.normal(
                        title: doc['docPhone'],
                      ),
                      trailing: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.yellow[600],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.phone),
                      ),
                    ),
                    10.heightBox,
                    Appstyle.bold(
                      title: "About",
                      color: Colors.black,
                      size: 16,
                    ),
                    Appstyle.normal(
                      title: doc['DocAbout'],
                      color: Colors.black,
                    ),
                    10.heightBox,
                    Appstyle.bold(
                      title: "Address",
                      color: Colors.black,
                      size: 16,
                    ),
                    Appstyle.normal(
                      title: doc['docAddress'],
                      color: Colors.black,
                    ),
                    10.heightBox,
                    Appstyle.bold(
                      title: "Working time",
                      color: Colors.black,
                      size: 16,
                    ),
                    Appstyle.normal(
                      title: doc['docTiming'],
                      color: Colors.black,
                    ),
                    10.heightBox,
                    Appstyle.bold(
                      title: "Services",
                      color: Colors.black,
                      size: 16,
                    ),
                    Appstyle.normal(
                      title: doc['docServices'],
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          buttonText: "Book an appointment",
          onTap: () {
            Get.to(
              () => BookAppointmentView(
                docid: doc['docid'],
                docname: doc['docName'],
              ),
            );
          },
        ),
      ),
    );
  }
}
