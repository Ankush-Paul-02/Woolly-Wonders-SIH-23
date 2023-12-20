import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/features/auth/repository/auth_repository.dart';
import 'package:sih23/src/features/auth/screens/widgets/auth_field.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/common/error_text.dart';
import '../../../../core/utils.dart';
import '../../../auth/controllers/auth_controller.dart';

class LastScreen extends ConsumerStatefulWidget {
  final String uid;
  const LastScreen({super.key, required this.uid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LastScreenState();
}

class _LastScreenState extends ConsumerState<LastScreen> {
  final _colorController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _colorController.dispose();
  }

  bool isValidate() {
    if (_colorController.text.trim().isEmpty) {
      showSnackBar(context, 'Please enter all fields!');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(getUserDataProvider(widget.uid));
    final authRepo = ref.read(authRepositoryProvider);

    return Scaffold(
      body: user.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.heightBox,
              'Create a product'.text.size(20).bold.make(),
              10.heightBox,
              10.heightBox,
              AuthField(
                label: 'Color',
                hint: 'Enter the color',
                icon: Icons.color_lens,
                controller: _colorController,
                inputType: TextInputType.name,
              ),
              10.heightBox,
              10.heightBox,
              30.heightBox,
              30.heightBox,
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 35.w,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (isValidate()) {
                        // Call the createAndSaveWool method
                        await authRepo.createAndSaveWool(
                          woolId:
                              const Uuid().v1().toString(), // Replace with your logic for generating woolId
                          color: _colorController.text,
                          isRejected: false, // Replace with your logic for setting the price
                        );

                        // You can navigate to the next screen or perform other actions
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: AppTheme.blueColor,
                    ),
                    label: 'Create'
                        .text
                        .size(18)
                        .bold
                        .color(AppTheme.whiteColor)
                        .make(),
                  ),
                ),
              ),
              20.heightBox,
              const Divider(),
              20.heightBox,
            ],
          ).pSymmetric(h: 20, v: 10),
        ),
        error: (error, printStackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}
