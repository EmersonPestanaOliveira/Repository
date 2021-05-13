import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';

class DefaultError extends StatelessWidget {

  final String sError;

  const DefaultError({Key key, this.sError}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(100.0),
      child: Column (
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error, color: Colors.red, size: 100),
          Divider(),
          Text(sError.toUpperCase(), style: AppTheme.tsDefaultBoldTextStyle2)
        ],
      ),
    )
  );
}