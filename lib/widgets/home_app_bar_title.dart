import 'package:flutter/material.dart';
import 'package:test_app/design/colors.dart';

class HomeAppBarTitle extends StatelessWidget {
  final String storeName;
  const HomeAppBarTitle({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/user.png'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        Expanded(
          child: Text(
            storeName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
            onPressed: () =>
                print('Hola, presionaron el icono de notificaciones'),
            icon: const Icon(
              Icons.notifications,
              color: TestColors.brandPrimaryColor,
            ),
          ),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
            onPressed: () => print('Hola, presionaron el icono de mas'),
            icon: const Icon(
              Icons.more_vert,
              color: TestColors.brandPrimaryColor,
            ),
          ),
          edgeInsets: const EdgeInsets.only(left: 12.0),
        )
      ],
    );
  }
}

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? edgeInsets;
  const ContainerHeaderIcon(
      {super.key, required this.iconButton, this.edgeInsets});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      margin: edgeInsets,
      decoration: BoxDecoration(
        border: Border.all(color: TestColors.brandLightColorBorder),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: iconButton,
    );
  }
}
