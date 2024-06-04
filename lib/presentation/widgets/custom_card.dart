import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
        elevation: 2,
        surfaceTintColor: colors.primary,
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: ClipRRect(
          borderRadius: BorderRadius.circular(12),
        ).clipBehavior,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Hacer tarea de calculo en la tarde',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Importancia:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(' Alta'),
                      SizedBox(width: 20),
                      Text(
                        'Estado:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(' Pendiente')
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'Aliquip ea irure pariatur ipsum nulla eu culpa exercitation anim ea proident nostrud quis. Culpa aute amet cupidatat ut elit aute consequat eu et nostrud. Laboris sint ea ut qui eu minim ad ad occaeca...'),
                ],
              )),
        ));
  }
}
