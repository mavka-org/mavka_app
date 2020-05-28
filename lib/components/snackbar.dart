import 'package:flutter/material.dart';

void showSnackBarComponent(
    SnackBarType type, String text, BuildContext context) {
  Widget child;

  switch (type) {
    case SnackBarType.info:
      child = Text(text);
      break;
    case SnackBarType.error:
      child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text), const Icon(Icons.error)],
      );
      break;
    case SnackBarType.loading:
      child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(),
          )
        ],
      );
      break;
  }

  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(type == SnackBarType.error
        ? SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: SizedBox(height: 20, child: child),
          )
        : SnackBar(
            duration: type == SnackBarType.loading
                ? const Duration(minutes: 10)
                : null,
            behavior: SnackBarBehavior.floating,
            content: SizedBox(height: 20, child: child),
          ));
}

enum SnackBarType { info, error, loading }
