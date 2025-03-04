import 'package:flutter/material.dart';
import 'package:namer_app/l10n/app_localizations.dart';
import 'package:namer_app/presentation/pages/auth/signup_page.dart';
import 'package:namer_app/presentation/pages/home/dashboard_page.dart';
import 'package:namer_app/presentation/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isShowPassword = false;

  String? selectedValue;
  final List<String> items = ["Apple 🍎", "Banana 🍌", "Cherry 🍒", "Grape 🍇"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/background_image/bg2.png"),
                fit: BoxFit.cover,
              )),
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.translate('hello'),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(230, 67, 27, 1),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "Welcome back, you've been missed!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromRGBO(125, 123, 122, 1),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 20,
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(255, 242, 239, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color: const Color.fromRGBO(
                                            230, 67, 27, 1)))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập email";
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return "Email không hợp lệ";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: !_isShowPassword,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(125, 123, 122, 1),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(255, 242, 239, 1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromRGBO(230, 67, 27, 1),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isShowPassword = !_isShowPassword;
                                  });
                                },
                                icon: Icon(
                                  _isShowPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                              if (value.length < 6) {
                                return "Mật khẩu ít nhất 6 ký tự";
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                print("quen mat khau");
                              },
                              child: Text(
                                "Quên mật khẩu?",
                                style: TextStyle(
                                  color: Color.fromRGBO(230, 67, 27, 1),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              backgroundColor: Color.fromRGBO(243, 71, 28, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ));
                          },
                          style: ButtonStyle(
                            overlayColor:
                                WidgetStateProperty.all(Colors.transparent),
                          ),
                          child: Text(
                            "Create new account",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(97, 95, 95, 1)),
                          )),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 71, 28, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 235, 235, 1),
                              // border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                print("google");
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  "assets/media/google.png",
                                  width: 38,
                                  height: 38,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 235, 235, 1),
                              // border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                print("google");
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  "assets/media/facebook.png",
                                  width: 38,
                                  height: 38,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 235, 235, 1),
                              // border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                print("google");
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  "assets/media/apple.png",
                                  width: 38,
                                  height: 38,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
        ));
  }
}
