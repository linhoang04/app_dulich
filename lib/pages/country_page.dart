import 'package:app_chat_fighting/models/citi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../service/service/auth/auth_service.dart';

class CountryPage extends StatelessWidget {
  final CitiModel model;
  CountryPage({super.key, required this.model});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text(
                  "${model.country}",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.network(
                  "https://flagcdn.com/32x24/${model.countryCode.toLowerCase()}.png",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection("country");
                  collRef.add({
                    "id": model.id,
                    "email": _authService.getCurrenUser()!.email,
                    "nameCiti": model.name,
                    "latitude": model.latitude,
                    "longitude": model.longitude,
                    "timezone": model.timezone,
                    "nameCountry": model.country,
                    "feature_code": model.featureCode,
                    "country_code": model.countryCode,
                    "country_id": model.countryId,
                    "elevation": model.elevation,
                    "population": model.population,
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 17,
                  color: Theme.of(context).colorScheme.primary,
                ),
                splashColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                  " Tên: ${model.name}\n Vĩ độ: ${model.latitude}\n Tung độ: ${model.longitude}\n Múi giờ: ${model.timezone}\n Độ cao: ${model.elevation}\n Mã đặc trưng: ${model.latitude}\n Mã quốc gia: ${model.countryCode}\n Dân số: ${model.population}\n Id quốc gia: ${model.countryId}\n"),
            ),
          ),
          Lottie.asset("assets/country_animate.json")
        ],
      ),
    );
  }
}
