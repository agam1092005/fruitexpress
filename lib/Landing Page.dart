// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final firestore = FirebaseFirestore.instance;
  //
  // // ignore: non_constant_identifier_names
  // Future<void> _Glogin() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn(
  //     scopes: ['email'],
  //   );
  //
  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser!.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   await auth.signInWithCredential(credential);
  //
  //   Navigator.of(context, rootNavigator: true).push(
  //     CupertinoPageRoute<bool>(
  //       fullscreenDialog: false,
  //       builder: (BuildContext context) => const HomePage(),
  //     ),
  //   );
  //   return;
  // }
  var loadingProgress = 0;


  final WebViewController controller =
  WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse('https://fruitxpress.company.site/'));

  @override
  Widget build(BuildContext context) {
    controller.setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
            setState(() {
              loadingProgress = progress;
            });
        }
    ),);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
           controller.goBack();
           return false;
          }
          else {
            return true;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              WebViewWidget(controller: controller),
              if (loadingProgress < 100)
                const Center(child: CircularProgressIndicator(
                ),)

            ],
          ),
        ),
      ),
      // child: Scaffold(
      //   body: Padding(
      //     padding: const EdgeInsets.all(16),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Container(
      //           height: 300,
      //           decoration: const BoxDecoration(
      //             color: Colors.transparent,
      //             borderRadius: BorderRadius.all(
      //               Radius.circular(
      //                 30,
      //               ),
      //             ),
      //             image: DecorationImage(
      //               fit: BoxFit.cover,
      //               image: AssetImage(
      //                 "assets/logo.webp",
      //               ),
      //             ),
      //           ),
      //         ),
      //         const Spacer(),
      //         AnimatedTextKit(
      //           repeatForever: false,
      //           isRepeatingAnimation: false,
      //           animatedTexts: [
      //             TypewriterAnimatedText(
      //               'Quality fruits and veggies, unbeatable prices. Fresh, affordable, and delivered to your door.',
      //               textAlign: TextAlign.center,
      //               textStyle: const TextStyle(
      //                 fontSize: 16,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //               speed: const Duration(milliseconds: 50),
      //             ),
      //           ],
      //         ),
      //         const Spacer(),
      //         RoundedButton(
      //           onPressed: () async {
      //             // await _Glogin();
      //             // firestore.collection("Users").doc(auth.currentUser!.uid).set(
      //             //   {
      //             //     "KYC": false,
      //             //   },
      //             // );
      //           },
      //           height: 50,
      //           width: MediaQuery.of(context).size.width,
      //           color: Colors.black,
      //           child: const Text(
      //             "Continue with Google",
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
