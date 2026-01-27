import 'package:flutter/material.dart';

const cardList = <Map<String, dynamic>>[
  {"title": "Elevation 0", "elevation": 0.0},
  {"title": "Elevation 1", "elevation": 1.0},
  {"title": "Elevation 2", "elevation": 2.0},
  {"title": "Elevation 3", "elevation": 3.0},
  {"title": "Elevation 4", "elevation": 4.0},
  {"title": "Elevation 5", "elevation": 5.0},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cardList
              .map(
                (card) => _CardType1(
                  label: card['title'] as String,
                  elevation: card['elevation'] as double,
                ),
              )
              .toList(),

          ...cardList
              .map(
                (card) => _CardType2(
                  label: card['title'] as String,
                  elevation: card['elevation'] as double,
                ),
              )
              .toList(),

          ...cardList
              .map(
                (card) => _CardType3(
                  label: card['title'] as String,
                  elevation: card['elevation'] as double,
                ),
              )
              .toList(),

          ...cardList
              .map(
                (card) => _CardType4(
                  label: card['title'] as String,
                  elevation: card['elevation'] as double,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: ListTile(title: Text(label)),
          ),
        ],
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: color.outline),
      ),
      elevation: elevation,
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: ListTile(title: Text('$label - Outlined')),
          ),
        ],
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card(
      color: color.primary,
      elevation: elevation,
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          ),
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: ListTile(title: Text('$label - Filled')),
          ),
        ],
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            "https://picsum.photos/id/${elevation.toInt()}/600/350",
            height: 350,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: AlignmentGeometry.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
