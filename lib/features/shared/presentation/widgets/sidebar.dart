import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/common/theme/app_text_styles.dart';
import 'package:inventory_tesis/features/shared/presentation/blocs/manager/app_cubit.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: MediaQuery.of(context).size.width * .7,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 200,
              child: Placeholder(),
            ),
            const SideBarLabel(),
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    final appCubit = context.read<AppCubit>().toggleTheme();
                  },
                  child: SideBarItem(
                    label: "Tema",
                    icon: state.themeData?.brightness == Brightness.light
                        ? const Icon(
                            CupertinoIcons.sun_max_fill,
                            color: Colors.amber,
                          )
                        : const Icon(
                            CupertinoIcons.moon_stars_fill,
                            color: Colors.white,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarLabel extends StatelessWidget {
  const SideBarLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Opciones',
        style: AppTextStyle.getAppTextStyle(size: 18, color: Colors.grey),
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
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyle.getAppTextStyle(size: 23),
          ),
          const Spacer(),
          icon!,
        ],
      ),
    );
  }
}
