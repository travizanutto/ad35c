import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/auth_controller.dart';
import 'package:vwalltet/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: false,
        backgroundColor: const Color(CustomColor.delftBlue),
        elevation: 2,
        actions: [
          TextButton(
            onPressed: controller.toggleLoginRegister,
            child: Obx(
              () => Text(
                controller.toggleButtonTitle.value,
                style: TextStyle(
                    fontFamily: 'Metrophobic',
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Senha inválida';
                          } else if (value.length < 6) {
                            return 'Senha muito curta';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: FloatingActionButton.extended(
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.isLogin.value) {
                              try {
                                await controller.login();
                              } catch (e) {
                                return;
                              }
                            } else {
                              try {
                                await controller.signUp();
                              } catch (e) {
                                return;
                              }
                            }
                          }
                        },
                        backgroundColor: Color.fromARGB(255, 244, 244, 244),
                        label: Text(controller.buttonTitle.value),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
