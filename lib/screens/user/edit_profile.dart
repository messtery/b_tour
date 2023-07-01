import 'package:b_tour/bloc/user/profile/profile_bloc.dart';
import 'package:b_tour/components/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _emailAddressController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Profile"),
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
        create: (context) => ProfileBloc()..add(ProfileIndexEvent()),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProfileError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is ProfileLoaded) {
                  _nameController.text =
                      state.listProfileModel.profileModel!.name.toString();
                  _emailAddressController.text =
                      state.listProfileModel.profileModel!.email.toString();
                  _usernameController.text =
                      state.listProfileModel.profileModel!.username.toString();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 145,
                            width: 145,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/avatar.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      TextField(
                        controller: _emailAddressController,
                        enabled: false,
                        decoration: const InputDecoration(
                            labelText: "Email Address",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                            )),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        enabled: false,
                        controller: _nameController,
                        decoration: const InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                            )),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        enabled: false,
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          suffixIcon: Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.green,
                            size: 18,
                          ),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 1),
    );
  }
}
