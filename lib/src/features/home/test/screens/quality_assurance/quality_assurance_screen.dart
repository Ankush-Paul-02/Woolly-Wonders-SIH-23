import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/common/error_text.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class QualityAssuranceScreen extends ConsumerStatefulWidget {
  final String uid;
  const QualityAssuranceScreen({super.key, required this.uid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QualityAssuranceScreenState();
}

class _QualityAssuranceScreenState
    extends ConsumerState<QualityAssuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Quality Assurance'.text.bold.make(),
      ),
      body: ref.watch(getUserDataProvider(widget.uid)).when(
            data: (user) => Column(
              children: [
                user.name.text.make(),
              ],
            ).pSymmetric(h: 20, v: 10),
            error: (error, printStackTrace) =>
                ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
