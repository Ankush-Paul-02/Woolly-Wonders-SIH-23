import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/auth/repository/auth_repository.dart';

import '../../../../core/common/error_text.dart';
import '../../../../model/wool_model.dart';

class WoolList extends ConsumerWidget {
  const WoolList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final woolData = ref.watch(getWoolsDataProvider);

    return woolData.when(
      data: (wools) {
        return SingleChildScrollView
        (
          child: Column(
            children: [
              for (final wool in wools) WoolCard(wool: wool),
            ],
          ),
        );
      },
      error: (error, printStackTrace) => ErrorText(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}

class WoolCard extends ConsumerWidget {
  final WoolModel wool;

  const WoolCard({Key? key, required this.wool}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(wool.color),
        trailing: authState.when(
          data: (user) {
            if (user != null) {
              return ref.watch(getUserDataProvider(user.uid)).when(
                data: (data) {
                  if (data.userType == 'Shader') {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () async {
                            await _updateWoolStatus(ref, wool.id, true);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () async {
                            await _updateWoolStatus(ref, wool.id, false);
                          },
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                error: (error, printStackTrace) =>
                    ErrorText(error: error.toString()),
                loading: () => const Loader(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          error: (error, printStackTrace) =>
              ErrorText(error: error.toString()),
          loading: () => const Loader(),
        ),
      ),
    );
  }

  Future<void> _updateWoolStatus(WidgetRef ref, String woolId, bool isRejected) async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.updateWoolStatus(woolId, isRejected);
    ref.refresh(getWoolsDataProvider); // Trigger a refresh of the wool list
  }
}

