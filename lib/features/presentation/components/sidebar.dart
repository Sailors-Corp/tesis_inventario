// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/common/theme/app_text_styles.dart';
import 'package:inventory_tesis/features/presentation/presentation.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          color: state.themeData?.brightness == Brightness.light
              ? Colors.white
              : AppColors.primaryBlue,
          width: MediaQuery.of(context).size.width * .7,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 200,
                  child: Placeholder(),
                ),
                const SideBarLabel(
                  label: 'Operaciones',
                ),
                const SideBarItem(
                  label: "Realizar Inventario",
                  icon: Icon(
                    CupertinoIcons.cube_box,
                    size: 20,
                  ),
                ),
                const SideBarItem(
                  label: "Generar Reporte",
                  icon: Icon(
                    CupertinoIcons.doc,
                    size: 20,
                  ),
                ),
                const SideBarLabel(
                  label: 'Opciones',
                ),
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        final appCubit = context.read<AppCubit>().toggleTheme();
                      },
                      child: SideBarItem(
                        label: "Cambiar tema",
                        icon: state.themeData?.brightness == Brightness.light
                            ? const Icon(
                                CupertinoIcons.sun_max_fill,
                                color: Colors.amber,
                                size: 20,
                              )
                            : const Icon(
                                CupertinoIcons.moon_stars_fill,
                                color: Colors.white,
                                size: 20,
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
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
      padding: const EdgeInsets.all(10.0),
      child: Text(
        label,
        style: AppTextStyle.getAppTextStyle(size: 16, color: Colors.grey),
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
    );
  }
}
