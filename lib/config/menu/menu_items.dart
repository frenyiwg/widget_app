import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String path;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.path,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    path: '/buttons',
    icon: Icons.smart_button_rounded,
  ),
  MenuItems(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    path: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progreso',
    subTitle: 'Indicadores de progreso',
    path: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbar',
    subTitle: 'Mensajes emergentes',
    path: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animado',
    subTitle: 'Widgets animados',
    path: '/animated',
    icon: Icons.animation_rounded,
  ),
  MenuItems(
    title: 'Controles UI',
    subTitle: 'Controles de interfaz de usuario',
    path: '/ui-controls',
    icon: Icons.widgets_rounded,
  ),
  MenuItems(
    title: 'Tutorial',
    subTitle: 'Aprende a utilizar la aplicación',
    path: '/tutorial',
    icon: Icons.school_rounded,
  ),
  MenuItems(
    title: 'Scroll Infinito',
    subTitle: 'Lista con scroll infinito',
    path: '/infinite-scroll',
    icon: Icons.inbox,
  ),
];
