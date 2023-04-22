import 'package:FindYourPet/app/repository/pet_repository.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

import '../../models/pet_model.dart';
import '../widgets/button_switch_theme.dart';
import '../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final petRepository = PetRepository();

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
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: const <Widget>[ButtonSwitchTheme()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                'ÚLTIMOS CADASTRADOS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<PetModel>>(
                  future: petRepository.getAllPets(),
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.done) {
                      if (snapshots.hasData) {
                        return FirestorePagination(
                            query: petRepository.query(),
                            limit: 7,
                            onEmpty: const Center(
                              child: Text('Cart is empty'),
                            ),
                            bottomLoader: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.teal,
                              ),
                            ),
                            itemBuilder: (context, documentSnapshot, index) {
                              final data = documentSnapshot.data()
                                  as Map<String, dynamic>;
                              return CardWidget(
                                imageURL: data['imageURL'],
                                name: data['name'],
                                status: data['status'],
                                description: data['description'],
                                telephone: data['contact'],
                                map: data['locale'],
                              );
                            });
                      } else if (snapshots.hasError) {
                        return Center(child: Text(snapshots.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Algo de errado não está certo!'));
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
