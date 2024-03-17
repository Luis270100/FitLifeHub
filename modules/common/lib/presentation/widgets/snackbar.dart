import 'package:common/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  String message,
) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.error,
        content: Text(message),
      ),
    );
