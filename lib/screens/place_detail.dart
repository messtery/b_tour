import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Details"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            // Handle back button press
            // You can use Navigator.pop(context) to navigate back
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/diamond-beach.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Row(
                children: [
                  Text(
                    "Diamond Beach",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    "Nusa Penida(Bali)",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(75, 0, 0, 0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Pesona Pulau Nusa Penida Bali memang tak ada habisnya. Berbagai destinasi wisata alam menarik dapat Anda temui di sana. Salah satuya, Atuh Beach, pantai berpasir putih yang sudah cukup banyak dikunjungi wisatawan dalam maupun luar negeri. Namun jika Anda mengunjungi Atuh Beach, jangan lupa mampir ke pantai yang lokasinya tak jauh dari sana bernama Diamond Beach. Diamond Beach berada dalam satu kawasan dengan Atuh Beach. Untuk berkunjung ke dua pantai ini, Anda cukup membayar Rp 5.000 saja di loket masuk kawasan. Sesuai namanya, Diamond Beach menawarkan pemandangan tebing-tebing karst dengan bentuk meruncing menyerupai permata. Untuk mencapai pantai berpasir putih ini, Anda harus menuruni sebuah anak tangga yang terbuat dari batu yang telah dilengkapi dengan pagar pengaman.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
