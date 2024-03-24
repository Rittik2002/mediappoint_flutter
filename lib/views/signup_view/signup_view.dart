//import 'package:get/get.dart';
import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/controllers/auth_controller.dart';
//import 'package:mediappoint/views/home_view/home.dart';
//import 'package:mediappoint/consts/fonts.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Authcontroller());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset("assets/images/sign-up.png"),
                ),
                Appstyle.bold(
                    title: AppStrings.signupNow,
                    size: 18,
                    align: TextAlign.center),
              ],
            ),
            10.heightBox,
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: AppStrings.fullnameHint,
                        textController: controller.fullnamecontroller,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: AppStrings.emailHint,
                        textController: controller.emailcontroller,
                      ),
                      10.heightBox,
                      //velocity_x
                      CustomTextField(
                        hint: AppStrings.passswordHint,
                        textController: controller.passwordcontroller,
                      ),
                      10.heightBox,
                      SwitchListTile(
                        value: isDoctor,
                        onChanged: (value) {
                          setState(() {
                            isDoctor = value;
                          });
                        },
                        title: "Signup as a doctor".text.bold.make(),
                      ),
                      Visibility(
                        visible: isDoctor,
                        child: Column(
                          children: [
                            CustomTextField(
                              hint: "About",
                              textController: controller.aboutcontroller,
                            ),
                            10.heightBox,
                            CustomTextField(
                              hint: "Category",
                              textController: controller.categorycontroller,
                            ),
                            10.heightBox,
                            CustomTextField(
                              hint: "Services",
                              textController: controller.servicescontroller,
                            ),
                            10.heightBox,
                            CustomTextField(
                              hint: "Address",
                              textController: controller.addresscontroller,
                            ),
                            10.heightBox,
                            CustomTextField(
                              hint: "Phone Number",
                              textController: controller.phonecontroller,
                            ),
                            10.heightBox,
                            CustomTextField(
                              hint: "Timing",
                              textController: controller.timingcontroller,
                            ),
                          ],
                        ),
                      ),
                      
                      20.heightBox,
                      CustomButton(
                        buttonText: AppStrings.signup,
                        onTap: () async {
                          await controller.signupUser(isDoctor);
                          if (controller.usercredential != null) {
                            Get.offAll(() => const LoginView());
                          }
                        },
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Appstyle.normal(title: AppStrings.alreadyHaveAccount),
                          8.widthBox,
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Appstyle.bold(title: AppStrings.login),
                          ),
                        ],
                      ),
                    ],
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
