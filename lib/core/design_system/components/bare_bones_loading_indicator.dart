import 'package:bare_bones_flutter/core/design_system/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BareBonesLoadingIndicator {
  BuildContext _context;

  void hide() {
    _context.pop();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (_) => const LoadingIndicator(),
    );
  }

  BareBonesLoadingIndicator._create(this._context);

  factory BareBonesLoadingIndicator.of(BuildContext context) {
    return BareBonesLoadingIndicator._create(context);
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.1)),
      child: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
