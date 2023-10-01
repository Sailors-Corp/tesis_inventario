import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/features/shared/presentation/widgets/sidebar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      ItemGrid(
        label: "Escanear",
        icon: Icons.qr_code_scanner_outlined,
        onTap: () {},
      ),
      ItemGrid(
        label: "Generar",
        icon: Icons.qr_code_2_outlined,
        onTap: () {},
      ),
      ItemGrid(
        label: "Buscar",
        icon: Icons.search_outlined,
        onTap: () {},
      ),
      ItemGrid(
        label: "Ajustes",
        icon: Icons.settings_outlined,
        onTap: () {},
      ),
    ];

    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text("UCInventory"),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              // context.router.push(ScanRoute());
            },
            icon: const Icon(Icons.qr_code_scanner_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.qr_code_2_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              // mainAxisExtent: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return items[index];
            },
          ),
        ),
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 120,
                color: AppColors.primaryColor,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     final homeBloc = BlocProvider.of<HomeBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("UCInventory"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: BlocBuilder<HomeBloc, HomeState>(
//             builder: (context, state) {
//               if (state is SuccessHomeState) {}
//               if (state is FailureHomeState) {
//                 showToast(
//                   'Ha ocurrido algun error inesperado',
//                   backgroundColor: Colors.red,
//                 );
//               }
//               return ElevatedButton(
//                 onPressed: () {
//                   homeBloc.add(OnChargedBD());
//                 },
//                 child: const Row(
//                   children: [
//                     Icon(Icons.import_export),
//                     Text('Importar BD'),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
