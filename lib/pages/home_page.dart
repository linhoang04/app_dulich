import 'package:app_chat_fighting/components/my_drawer.dart';
import 'package:app_chat_fighting/controller/citi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../components/my_textfield.dart';
import '../service/service/auth/auth_service.dart';
import 'country_page.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CitiController controller = Get.put(CitiController());
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text("${_authService.getCurrenUser()!.email}"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
        ),
        drawer: const MyDarwer(),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              controller.showListView.toggle();
            },
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTextField(
                      onChanged: (location) {
                        controller.fetchCiti(location);
                      },
                      controller: controller.textController,
                      obscureText: false,
                      hinText: "Ha Noi",
                    ),
                    // Thêm hình ảnh ở đây
                    Container(
                      padding: const EdgeInsets.only(
                        left: 7,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Hình ảnh 1
                          Row(
                            children: [
                              Lottie.asset(
                                'assets/1.json',
                                height: 190,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Lottie.asset(
                                'assets/5.json',
                                height: 100,
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Lottie.asset(
                                'assets/4.json',
                                height: 190,
                              ),
                              Lottie.asset(
                                'assets/3.json',
                                height: 190,
                              ),
                            ],
                          ),
                          Lottie.asset(
                            "assets/bot.json",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (controller.showListView.value)
                  Positioned(
                    top: 70, // Điều chỉnh vị trí của ListView.builder
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GetX<CitiController>(
                      init: CitiController(),
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.listCiti.length,
                          itemBuilder: (context, index) {
                            final citis = controller.listCiti[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CountryPage(model: citis),
                                  ),
                                );
                              },
                              child: Container(
                                // height: 200,
                                width: MediaQuery.of(context).size.width * 0.87,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://flagcdn.com/32x24/${citis.countryCode.toLowerCase()}.png",
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        citis.name,
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
