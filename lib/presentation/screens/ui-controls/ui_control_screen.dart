import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Control screen')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bus, train, boat }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDevModeActive = false;
  Transportation transportationSelected = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDIner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: Text('Subtitle'),
          value: isDevModeActive,
          onChanged: (value) {
            setState(() {
              isDevModeActive = value;
            });
          },
        ),

        ExpansionTile(
          title: const Text('Transportation Methods'),
          subtitle: Text('$transportationSelected'),
          initiallyExpanded: true,
          children: [
            RadioListTile(
              title: Text('Car'),
              subtitle: Text('Selected transportation method'),
              value: Transportation.car,
              groupValue: transportationSelected,
              onChanged: (value) {
                setState(() {
                  transportationSelected = value as Transportation;
                });
              },
            ),
            RadioListTile(
              title: Text('Bus'),
              subtitle: Text('Public transportation'),
              value: Transportation.bus,
              groupValue: transportationSelected,
              onChanged: (value) {
                setState(() {
                  transportationSelected = value as Transportation;
                });
              },
            ),
            RadioListTile(
              title: Text('Train'),
              subtitle: Text('Rail transportation'),
              value: Transportation.train,
              groupValue: transportationSelected,
              onChanged: (value) {
                setState(() {
                  transportationSelected = value as Transportation;
                });
              },
            ),
            RadioListTile(
              title: Text('Boat'),
              subtitle: Text('Water transportation'),
              value: Transportation.boat,
              groupValue: transportationSelected,
              onChanged: (value) {
                setState(() {
                  transportationSelected = value as Transportation;
                });
              },
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Desea desayuno?'),
          subtitle: Text(wantsBreakfast ? 'Sí' : 'No'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Desea almuerzo?'),
          subtitle: Text(wantsLunch ? 'Sí' : 'No'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Desea cena?'),
          subtitle: Text(wantsDIner ? 'Sí' : 'No'),
          value: wantsDIner,
          onChanged: (value) {
            setState(() {
              wantsDIner = value!;
            });
          },
        ),
      ],
    );
  }
}
