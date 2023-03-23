import 'package:FindYourPet/app/repository/pet_repository.dart';
import 'package:flutter/material.dart';

import '../../models/pet_model.dart';
import '../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final petRepository = PetRepository();

  Widget buildPet(PetModel pet) => CardWidget(
        imageURL: pet.imageURL,
        name: pet.name,
        status: pet.status,
        description: pet.description,
        telephone: pet.telephoneNumber,
        map: pet.address,
      );

  @override
  void initState() {
    super.initState();
    petRepository.getAllPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'ÚLTIMOS CADASTRADOS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<PetModel>>(
                future: petRepository.getAllPets(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.done) {
                    if (snapshots.hasData) {
                      final petData = snapshots.data!;
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            petRepository.getAllPets();
                          });
                        },
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: petData.map(buildPet).toList()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
