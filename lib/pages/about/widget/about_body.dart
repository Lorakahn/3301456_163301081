import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/home/home_page.dart';
import 'package:lorakahnmovietips_app/constants.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text("About"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 300,
                child: Center(
                  child: Image.asset(
                    "assets/images/su_vector.png",
                  ),
                ),
                padding: const EdgeInsets.all(20),
              ),
              const Text(
                  "Bu uygulama 3301456 ders kodlu, öğretim görevlisi Ahmet Cevahir Çınar olan Mobil Programlama dersi ödevi niteliğinde 163301081 numaralı Cemre Demir tarafından yapılmıştır.",
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
