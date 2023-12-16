import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class TestModule extends ConsumerStatefulWidget {
  const TestModule({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestModuleState();
}

class _TestModuleState extends ConsumerState<TestModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Unravel the Magic of Testing'.text.bold.size(24).make(),
            30.heightBox,
            const Card(
              elevation: 2,
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    
                  ],
                ),
              ),
            ),
          ],
        ).pSymmetric(h: 16, v: 12),
      ),
    );
  }
}
