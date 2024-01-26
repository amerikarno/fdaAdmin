import 'package:finansiada/appRoutes.dart';
import 'package:finansiada/bloc/homePage/home_page_bloc.dart';
import 'package:finansiada/bloc/register/register_bloc.dart';
import 'package:finansiada/pages/home/widget/formLogin.dart';
import 'package:finansiada/pages/home/widget/formRegister.dart';
import 'package:finansiada/utils/imageSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double? screenWidth;
  double? screenHeight;
  bool loadScreen = true;

  @override
  void initState() {
    super.initState();
    resizeScreen();
  }

  resizeScreen() async {
    Size? newSize = await ImageUtil().getImageSize('assets/chart-1905225_1280.jpg');
    if (newSize != null) {
      setState(() {
        screenWidth = newSize.width;
        screenHeight = newSize.height;
        loadScreen = false;
      });
    } else {
      setState(() {
        screenWidth = MediaQuery.of(context).size.width;
        screenHeight = MediaQuery.of(context).size.height;
        loadScreen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, stateHome) {
          return loadScreen
              ? const Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/chart-1905225_1280.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Welcome to my homepage',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.grey,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          constraints: BoxConstraints(maxWidth: screenWidth! / 2),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withOpacity(0.9),
                          ),
                          child: stateHome.showLogin ? FormLogin(formKey: formKey) : FormRegister(formKey: formKey),
                        ),
                        const SizedBox(height: 20),
                        stateHome.showLogin
                            ? ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, AppRoute.login);
                                  } else {
                                    var snackBar = const SnackBar(
                                      content: Text('Some fields was incorrect. Try to fix first.'),
                                      backgroundColor: Colors.red,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                },
                                child: const Text("Login"),
                              )
                            : BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, stateRegister) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (stateRegister.acceptAgreement) {
                                        if (formKey.currentState!.validate()) {
                                          print("this form is validated");
                                          Navigator.pushNamed(context, AppRoute.register);
                                        } else {
                                          var snackBar = const SnackBar(
                                            content: Text('Some fields was incorrect. Try to fix first.'),
                                            backgroundColor: Colors.red,
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }
                                      } else {
                                        var snackBar = const SnackBar(content: Text('Please accept agreement term and condition'));
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }
                                    },
                                    child: const Text("Register"),
                                  );
                                },
                              ),
                        const SizedBox(height: 30),
                        Container(
                          constraints: BoxConstraints(maxWidth: screenWidth! / 2),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withOpacity(0.9),
                          ),
                          child: stateHome.showLogin
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                        onTap: () {
                                          context.read<HomePageBloc>().add(HomePageEventSwapLoginRegister());
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            "Create new account.",
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Already have an account."),
                                    const SizedBox(width: 5),
                                    InkWell(
                                        onTap: () {
                                          context.read<HomePageBloc>().add(HomePageEventSwapLoginRegister());
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            "Login.",
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        )),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
