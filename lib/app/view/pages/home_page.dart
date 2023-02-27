import 'package:FindYourPet/app/repository/pet_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/pet_model.dart';
import '../components/card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final petRepository = Get.put(PetRepository());

  Widget buildPet(PetModel pet) => CardComponent(
      imageURL: pet.imageURL,
      name: pet.name,
      description: pet.description,
      telephone: pet.telephoneNumber,
      map: pet.address);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Image.asset(
          //   'assets/images/logotipo.png',
          //   fit: BoxFit.cover,
          //   // alignment: Alignment.center,
          //   height: MediaQuery.of(context).size.height / 10,
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.pets_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              const Text(
                'FindYourPet',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<PetModel>>(
          future: petRepository.getAllPets(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.done) {
              if (snapshots.hasData) {
                final petData = snapshots.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'ÚLTIMOS CADASTRADOS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        ListView(
                            shrinkWrap: true,
                            children: petData.map(buildPet).toList()),
                      ],
                    ),
                  ),
                );
              } else if (snapshots.hasError) {
                return Center(child: Text(snapshots.error.toString()));
              } else {
                return const Center(
                    child: Text('Algo de errado não está certo!'));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
