import 'package:b_tour/bloc/pariwisata/pariwisata_list/pariwisata_list_bloc.dart';
import 'package:b_tour/components/bottom_navigation.dart';
import 'package:b_tour/core/session_manager.dart';
import 'package:b_tour/models/pariwisata_model.dart';
import 'package:b_tour/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PariwisataListBloc()..add(PariwisataIndexEvent()),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: BlocBuilder<PariwisataListBloc, PariwisataListState>(
              builder: (context, state) {
                if (state is PariwisataListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PariwisataListError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is PariwisataListLoaded) {
                  SessionManager sessionManager = SessionManager();
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hai, ${sessionManager.getActiveFirstName()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Destination",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlaceDetail(
                                              id: state
                                                  .listPariwisataListModel[0]
                                                  .id)));
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://10.0.2.2:8000/${state.listPariwisataListModel[0].gambar}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color:
                                              const Color.fromARGB(75, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          state.listPariwisataListModel[0]
                                              .judul!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 45,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlaceDetail(
                                              id: state
                                                  .listPariwisataListModel[1]
                                                  .id)));
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://10.0.2.2:8000/${state.listPariwisataListModel[1].gambar}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color:
                                              const Color.fromARGB(75, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          state.listPariwisataListModel[1]
                                              .judul!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.listPariwisataListModel.length,
                          itemBuilder: ((context, index) {
                            PariwisataModel pariwisataModel =
                                state.listPariwisataListModel[index];
                            return Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // print(pariwisataModel.id);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlaceDetail(
                                                  id: pariwisataModel.id)));
                                      // Navigator.pushNamed(
                                      //     context, '/place-detail');
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 19.0),
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'http://10.0.2.2:8000/${pariwisataModel.gambar}',
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8.0,
                                            left: 8.0,
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  75, 0, 0, 0),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Text(
                                              pariwisataModel.judul!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }))
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
