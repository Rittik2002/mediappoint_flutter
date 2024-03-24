import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/controllers/home_controller.dart';
import 'package:mediappoint/views/category_details_view/category_details_view.dart';
import 'package:mediappoint/views/search_view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Appstyle.bold(
            title: "${AppStrings.welcome} {currentusername!.displayName}", color: Colors.white, size: 18),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      inputColor: Colors.white,
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      bordercolor: Colors.white,
                      textcolor: Colors.white,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                    onPressed: () {
                      Get.to(()=>SearchView(searchQuery: controller.searchQueryController.text,),);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: iconsList.length,
                      itemBuilder: ((BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(docCat: iconstitleList[index],),);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Image.asset(
                                  iconsList[index],
                                  color: Colors.white,
                                  width: 40,
                                ),
                                5.heightBox,
                                Appstyle.normal(title: iconstitleList[index],color: Colors.white),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Appstyle.bold(
                      title: "Popular Doctors",
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                  5.heightBox,
                  FutureBuilder(
                    future: controller.getDoctorList(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var data=snapshot.data?.docs;
                        //print(data!.length.toString());
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length ?? 0,
                            itemBuilder: ((BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => DoctorProfileView(doc:data[index]),
                                  );
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 234, 238, 239),
                                      borderRadius: BorderRadius.circular(12)),
                                  height: 100,
                                  width: 150,
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.blue,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "assets/images/welcome.png",
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      5.heightBox,
                                      Appstyle.normal(title: data![index]['docName']),
                                      5.heightBox,
                                      Appstyle.normal(title: data[index]['docCategory']),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      }
                    },
                  ),
                  5.heightBox,
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Appstyle.normal(
                          title: "View All", color: Colors.blue),
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        height: 100,
                        width: 60,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/body.png",
                              color: Colors.white,
                            ),
                            Appstyle.normal(
                                title: "Tests", color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
