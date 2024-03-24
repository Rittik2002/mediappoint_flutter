import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
            title: "Search Results", color: Colors.white, size: 18),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 170,
                ),
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  return !doc['docName']
                          .toString()
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase())
                      ? const SizedBox.expand()
                      : Container(
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
                              Appstyle.normal(title: doc['docName']),
                              5.heightBox,
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
                        ).onTap(() {
                          Get.to(() => DoctorProfileView(doc: doc));
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
