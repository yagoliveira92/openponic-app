import 'package:app_openponic/common/colors/openponic_color.dart';
import 'package:app_openponic/features/settings/controller/settings_controller.dart';
import 'package:app_openponic/features/settings/controller/settings_controller_state.dart';
import 'package:app_openponic/features/settings/widgets/form_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsController);
    TextEditingController _pHController = TextEditingController(text: '');
    TextEditingController _tempController = TextEditingController(text: '');
    TextEditingController _conduController = TextEditingController(text: '');
    TextEditingController _umidController = TextEditingController(text: '');

    ref.listen<SettingsControllerState>(settingsController, (prev, next) {
      if (next is SettingsControllerSuccess) {
        if (next.isUpdateParameter) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: OpenponicColor.green,
              content: Text('Salvo com sucesso!'),
            ),
          );
        }
      }
    });

    if (state is SettingsControllerSuccess) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                height: 150,
                decoration: const BoxDecoration(
                  color: OpenponicColor.blueLight,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Configurações',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          minRadius: 40,
                          backgroundImage:
                              AssetImage('assets/image/profile_image.png'),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usuário',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              'Perfil',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Mudar parâmetros',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    FormSettingsWidget(
                      parametersValue: state.allParameters,
                      conduController: _conduController,
                      pHController: _pHController,
                      tempController: _tempController,
                      umidController: _umidController,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_pHController.text.isNotEmpty ||
                            _umidController.text.isNotEmpty ||
                            _tempController.text.isNotEmpty ||
                            _conduController.text.isNotEmpty) {
                          return await ref
                              .read(settingsController.notifier)
                              .updateParameters(
                                condutividade: _conduController.text,
                                ph: _pHController.text,
                                temperatura: _tempController.text,
                                umidade: _umidController.text,
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: OpenponicColor.green,
                      ),
                      child: const Text(
                        'Salvar parâmetros',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return const Center(
      child: SizedBox.square(
        dimension: 50.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
