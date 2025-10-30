import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/routes/route_names.dart';
import 'package:flutter_boilerplate/core/helpers/snackbar_helper.dart';
import 'package:flutter_boilerplate/features/demo/presentation/component/showcase_widget.dart';
import 'package:flutter_boilerplate/features/demo/presentation/model/showcase_item.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  List<ShowcaseItem> get showcaseItems => [
    ShowcaseItem(
      icon: Icons.compare,
      title: 'System Design',
      subtitle: 'Demonstrate theming, and App system design',
    ),
    ShowcaseItem(
      icon: Icons.developer_mode,
      title: 'Helper Demo',
      subtitle: 'Demonstrate snackbar, dialog, and toast mecanism',
    ),
    ShowcaseItem(
      icon: Icons.toys,
      title: 'Api Demo',
      subtitle: 'Integrating simple API demo',
    ),
  ];

  void _onPressed(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          context.pushNamed(RouteNames.design);
        }
      case 1:
        {
          SnackBarHelper.showError(context, "Feature is Not Ready Yet");
        }
      case 2:
        {
          SnackBarHelper.showError(context, "Feature is Not Ready Yet");
        }
      case _:
        {
          SnackBarHelper.showError(context, "Feature is Not Found");
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Showcase')),
      body: ListView.builder(
        // Add a small padding at the top to separate from the AppBar
        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
        itemCount: showcaseItems.length,
        itemBuilder: (context, index) {
          return ShowcaseWidget(
            item: showcaseItems[index],
            onPressed: () {
              _onPressed(index, context);
            },
          );
        },
      ),
    );
  }
}
