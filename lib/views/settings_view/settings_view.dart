import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/controllers/auth_controller.dart';
import 'package:mediappoint/controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
        title: Appstyle.bold(title: AppStrings.settings, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(iconsList[0]),
                    ),
                    title: Appstyle.bold(title: controller.username.value),
                    subtitle: Appstyle.normal(title: controller.email.value),
                  ),
                  const Divider(),
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      settingsList.length,
                      (index) => ListTile(
                        onTap: () async {
                          if (index == settingsList.length - 1) {
                            await Authcontroller().signout();
                            Get.offAll(() => const LoginView());
                          }
                        },
                        leading: Icon(
                          settingsListIcon[index],
                          color: Colors.blue,
                        ),
                        title: Appstyle.bold(
                          title: settingsList[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
