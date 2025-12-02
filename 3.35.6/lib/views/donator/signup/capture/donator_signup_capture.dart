import 'dart:io';

import 'package:dener/components/app_button/app_button_component.dart';
import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DonatorSignupCapture extends StatefulWidget {
  const DonatorSignupCapture({super.key});

  @override
  State<DonatorSignupCapture> createState() => _DonatorSignupCaptureState();
}

class _DonatorSignupCaptureState extends BaseState<DonatorSignupCapture> {
  final imagePicker = ImagePicker();
  final picture = ValueNotifier<XFile?>(null);

  @override
  void onInit() {
    imagePicker
        .pickImage(source: ImageSource.camera)
        .then((file) => picture.value = file);
  }

  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = AppTextStyles.of(context);
    return Scaffold(
      body: Container(        
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 60),
              child: Text('UAAAAAU!!', style: textStyles.titleBlack),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: ListenableBuilder(
                  listenable: picture,
                  builder: (BuildContext context, _) {
                    return picture.value == null
                        ? Container()
                        : Image.file(File(picture.value!.path));
                  },
                ),
              ),
            ),
            Text('Clique em confirmar para eviar sua foto.', style: textStyles.buttonBlack),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButtonComponent(
                  labelText: 'Confirmar',
                  onPressed: () => navigateBack(args: true),
                ),
                AppButtonComponent(
                  labelText: 'Cancelar',
                  onPressed: () => navigateBack(args: false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
