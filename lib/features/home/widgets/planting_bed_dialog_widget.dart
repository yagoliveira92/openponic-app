import 'package:app_openponic/common/colors/openponic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantingBedDialogWidget extends StatelessWidget {
  const PlantingBedDialogWidget({
    required this.listName,
    required this.changeFlowerbad,
    required this.actualName,
    Key? key,
  }) : super(key: key);

  final List<String> listName;
  final Function({required String name}) changeFlowerbad;
  final String actualName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(25),
      child: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Text(
              'Selecione seu canteiro:',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 23.0,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  onTap: () {
                    changeFlowerbad(name: listName[index]);
                    Navigator.pop(context);
                  },
                  selected: listName[index] == actualName,
                  selectedColor: OpenponicColor.green,
                  trailing: listName[index] == actualName
                      ? const Text('Atual')
                      : const SizedBox.shrink(),
                  title: Text(
                    listName[index],
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
              childCount: listName.length,
            ),
          ),
        ],
      ),
    );
  }
}
