import 'package:flutter/material.dart';
import './views/plan_creator_screen.dart';
import './plan_provider.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.purple),
          home: PlanCreatorScreen()
      ),
    );
  }
}
