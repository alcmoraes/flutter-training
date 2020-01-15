import 'package:flutter/material.dart';

class Layouts {

  /// Template A consists on a Header a Footer
  /// and a Expanded Body, within a SingleChildScrollView
  static LayoutBuilder templateA(Widget body, {Widget header, Widget footer}) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  if(header != null) header,
                  Expanded(
                    child: body,
                  ),
                  if(footer != null) footer,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
