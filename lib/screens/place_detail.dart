import 'package:b_tour/bloc/pariwisata/pariwisata_detail/pariwisata_detail_bloc.dart';
import 'package:b_tour/components/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceDetail extends StatelessWidget {
  final int? id;
  const PlaceDetail({this.id, super.key});

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
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            PariwisataDetailBloc()..add(GetDetailPariwisataEvent(id: id!)),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: BlocBuilder<PariwisataDetailBloc, PariwisataDetailState>(
              builder: (context, state) {
                if (state is PariwisataDetailLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PariwisataDetailError) {
                  return Center(child: Text(state.message));
                } else if (state is PariwisataDetailLoaded) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'http://10.0.2.2:8000/${state.pariwisataDetailResponse.pariwisataModel!.gambar}'),
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.pariwisataDetailResponse.pariwisataModel!
                                  .judul!,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Expanded(
                            child: Text(
                              state.pariwisataDetailResponse.pariwisataModel!
                                  .lokasi!,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.pariwisataDetailResponse.pariwisataModel!
                                  .deskripsi!,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }
}
