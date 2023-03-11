import 'package:FindYourPet/app/repository/pet_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final petRepository = Get.put(PetRepository());
  late Stream<QuerySnapshot> _petsStream;

  @override
  void initState() {
    super.initState();
    _petsStream = petRepository.getPetsSnapshot();
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
        body: StreamBuilder<QuerySnapshot>(
            stream: _petsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ÚLTIMOS CADASTRADOS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async =>
                                petRepository.getPetsSnapshot(),
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var doc = snapshot.data!.docs[index];
                                return CardWidget(
                                  imageURL: doc['imageURL'],
                                  name: doc['name'],
                                  status: doc['status'],
                                  description: doc['description'],
                                  telephone: doc['contact'],
                                  map: doc['locale'],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
