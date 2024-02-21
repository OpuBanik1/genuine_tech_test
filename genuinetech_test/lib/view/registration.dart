import 'package:flutter/material.dart';
import 'package:genuinetech_test/src/service/custtom_http.dart';
import 'package:genuinetech_test/view/coustomer_list.dart';
import 'package:genuinetech_test/widget/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/rendering/box.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  bool isChecked = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Container(
            height: double.maxFinite,
            width: double.infinity,
            margin:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            padding: const EdgeInsets.all(10),
            // decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: myStyle(30, Colors.black),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Divider(color: Colors.grey, thickness: 0.8),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gapPadding: 3.0,
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      hintText: "Email",
                      labelText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Please enter a valid email";
                    }
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      suffix: TextButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible == true
                                ? passwordVisible = false
                                : passwordVisible = true;
                          });
                        },
                        child: Text(
                          "Show",
                          style: myStyle(15, Colors.grey),
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gapPadding: 3.0,
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      hintText: "Password",
                      labelText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value!.length > 8) {
                      return "Please enter a strong password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Forgot password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: isChecked,
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "I read an agree with ecolines Rules and\n Privacy policy",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: myStyle(13, Colors.grey),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                TextButton(
                    onPressed: () async {
                      CustomHttp.getLogIn(emailController.text.toString(),
                          passwordController.text.toString());
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      var token = sharedPreferences.getString('token');
                      if (token != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerList()));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber),
                      height: 40,
                      // width: double.infinit,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Login",
                          style: myStyle(15, Colors.black),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          )),
    );
  }
}
