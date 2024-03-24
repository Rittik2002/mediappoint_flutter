import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/controllers/auth_controller.dart';
import 'package:mediappoint/views/appointment_view/appointment_view.dart';
import 'package:mediappoint/views/home_view/home.dart';
import 'package:mediappoint/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  child: Image.asset("assets/images/doclogin.png"),
                ),
                // AppStrings.welcomeBack.text.make(),
                // AppStrings.weAreExcited.text.make(),
                Appstyle.bold(title: AppStrings.welcomeBack, size: 18),
                Appstyle.bold(title: AppStrings.weAreExcited, size: 18),
              ],
            ),
            20.heightBox,
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: AppStrings.emailHint,
                        textController: controller.emailcontroller,
                      ),
                      10.heightBox, //velocity_x
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
                        title: "Sign in as a doctor".text.make(),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child:
                            AppStrings.forgetpassword.text.make(), //velocity_x
                      ),
                      20.heightBox,
                      CustomButton(
                        buttonText: AppStrings.login,
                        onTap: () async {
                          await controller.loginUser();
                          if (controller.usercredential != null) {
                            if(isDoctor){
                              Get.to(()=>const AppointmentView());
                            }else{
                              Get.to(() => const Home());
                            }
                          }
                        },
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Appstyle.normal(title: AppStrings.dontHaveAccount),
                          8.widthBox,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignupView());
                            },
                            child: Appstyle.bold(title: AppStrings.signup),
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
