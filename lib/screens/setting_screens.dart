import 'package:appcook/components/drawer.dart';
import 'package:appcook/models/settings.dart';
import 'package:flutter/material.dart';

class SettingScreens extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingScreens(this.onSettingsChanged, this.settings);

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: DrawerApp(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                    "Sem Glutém",
                    "Só exibie refeições sem glutén!",
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    "Sem Lactose",
                    "Só exibie refeições sem lactose!",
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    "Vegana",
                    "Só exibie refeições veganas!",
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value)),
                _createSwitch(
                    "Vegetariana",
                    "Só exibie refeições vegetarianas!",
                    settings.isVegetarian,
                    (value) => setState(
                          () => settings.isVegetarian = value,
                        ))
              ],
            ))
          ],
        ));
  }
}
