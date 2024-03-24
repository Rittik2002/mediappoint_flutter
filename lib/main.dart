
import 'package:firebase_core/firebase_core.dart';
import 'package:mediappoint/consts/consts.dart';
import 'package:mediappoint/firebase_options.dart';
import 'package:mediappoint/resources/components/waiting_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      //theme: ThemeData(fontFamily: ),
      debugShowCheckedModeBanner: false,
      home: WaitingScreen(),
    );
  }
}
