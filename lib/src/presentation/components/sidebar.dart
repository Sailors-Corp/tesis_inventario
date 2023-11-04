// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/common/theme/app_text_styles.dart';
import 'package:inventory_tesis/src/presentation/generated/assets/assets.gen.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * .7,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(Assets.svg.logoUci.path),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(height: 2, color: Colors.black),
              const SideBarLabel(
                label: 'Operaciones',
              ),
              SideBarItem(
                onPressed: () =>
                    context.router.push(const GenerateQRRoute()),
                label: "Generar QR",
                icon: const Icon(
                  color: AppColors.primaryColor,
                  CupertinoIcons.qrcode,
                  size: 20,
                ),
              ),
              SideBarItem(
                onPressed: () =>
                    context.router.push(const TakeInventoryRoute()),
                label: "Realizar inventario",
                icon: const Icon(
                  CupertinoIcons.cube_box,
                  size: 20,
                ),
              ),
              SideBarItem(
                onPressed: () => context.router.push(const MovementRoute()),
                label: "Realizar movimiento",
                icon: const Icon(
                  CupertinoIcons.move,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
              SideBarItem(
                onPressed: () => context.router.push(const ReportsRoute()),
                label: "Generar reportes",
                icon: const Icon(
                  CupertinoIcons.doc,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideBarLabel extends StatelessWidget {
  const SideBarLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: AppTextStyle.getAppTextStyle(size: 16, color: Colors.grey),
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Icon? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                icon!,
                const SizedBox(width: 10),
                Text(
                  label,
                  style: AppTextStyle.getAppTextStyle(size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
