import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/views/category_details_view/category_details_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Appstyle.normal(
            title: AppStrings.category, size: 18, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 190,
          ),
          itemCount: iconsList.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(()=>CategoryDetailsView(docCat: iconstitleList[index]));
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        iconsList[index],
                        width: 55,
                        color: Vx.randomPrimaryColor,
                      ),
                    ),
                    const Divider(),
                    20.heightBox,
                    Appstyle.bold(
                      title: iconstitleList[index],
                      size: 16,
                    ),
                    20.heightBox,
                    Appstyle.normal(
                      title: "12 Seecialist",
                      color: Colors.black.withOpacity(0.5),
                      size: 14,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
