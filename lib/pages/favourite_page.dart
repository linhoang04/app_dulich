import 'package:app_chat_fighting/components/my_country_title.dart';
import 'package:app_chat_fighting/service/service/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // foregroundColor: const Color.fromARGB(255, 62, 58, 58),
        foregroundColor: Theme.of(context).colorScheme.primary,

        elevation: 0,
        title: Text(
          "Favourite",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("country").snapshots(),
        builder: (context, snapshot) {
          List<Row> countryWidgets = [];
          if (snapshot.hasData) {
            final countrys = snapshot.data!.docs.reversed.toList();

            for (var country in countrys) {
              if (_authService.getCurrenUser()!.email == country["email"] ||
                  !countrys.any((element) => element["id"] != country["id"])) {
                final countryWidget = Row(
                  children: [
                    MyCountryTitle(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Thông tin'),
                              content: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                        " Tên: ${country["nameCiti"]}\n Vĩ độ: ${country["latitude"]}\n Tung độ: ${country["longitude"]}\n Múi giờ: ${country["timezone"]}\n Độ cao: ${country["elevation"]}\n Mã đặc trưng: ${country["feature_code"]}\n Mã quốc gia: ${country["country_code"]}\n Dân số: ${country["population"]}\n Id quốc gia: ${country["country_id"]}\n"),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Đóng'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      code: country["country_code"].toString(),
                      nameCountry: country["nameCountry"].toString(),
                      nameCiti: country["nameCiti"].toString(),
                      onPressed: () async {
                        await _firestore
                            .runTransaction((Transaction myTransaction) async {
                          myTransaction.delete(country.reference);
                        });
                      },
                    ),
                  ],
                );
                countryWidgets.add(countryWidget);
              }
            }
          }
          return Expanded(
            child: ListView(
              children: countryWidgets,
            ),
          );
        },
      ),
    );
  }
}
