import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';

class CategoryDetailsView extends StatelessWidget {
  final String docCat;
  const CategoryDetailsView({super.key, required this.docCat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
            title: docCat, size: 18, color: Colors.white),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('doctors')
            .where('docCategory', isEqualTo: docCat)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data=snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 170,
                ),
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 238, 239),
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.blue,
                          width: 150,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/welcome.png",
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        5.heightBox,
                        Appstyle.normal(title: data![index]['docName']),
                        5.heightBox,
                        VxRating(
                          onRatingUpdate: (value) {},
                          selectionColor: Colors.yellowAccent.shade700,
                          maxRating: 5,
                          count: 5,
                          value: data[index]['docRating']*1.0,
                          stepInt: true,
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.to(()=>DoctorProfileView(doc: data[index]));
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }
}
