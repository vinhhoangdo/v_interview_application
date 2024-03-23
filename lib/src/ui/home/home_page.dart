import 'package:flutter/material.dart';
import 'package:interview_application/src/src.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _dropDownController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getCardItems();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dropDownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, builder) {
              return Row(
                children: [
                  CircleAvatar(
                    child:  IAImage(imagePath: SharedPrefsUtils().avatar),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(SharedPrefsUtils().name),
                  ),
                  IconButton(
                    onPressed: () async {
                      await authProvider.logout().whenComplete(
                            () => Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.login, (_) => false),
                          );
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, homeProvider, builder) {
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16.0),
              child: DropdownMenu<SortCardItemType>(
                controller: _dropDownController,
                label: const Text('Sort by'),
                onSelected: (SortCardItemType? label) {
                  homeProvider.sortBy(label);
                },
                dropdownMenuEntries: SortCardItemType.values.map<DropdownMenuEntry<SortCardItemType>>(
                  (SortCardItemType item) {
                    return DropdownMenuEntry<SortCardItemType>(
                      value: item,
                      label: item.label,
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: homeProvider.status == Status.loading
                    ? _buildSkeleton
                    : buildCardItemLists(homeProvider),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget get _buildSkeleton => Skeletonizer.zone(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                leading: Bone.circle(size: 48),
                title: Bone.text(words: 2),
                subtitle: Bone.text(),
                trailing: Bone.icon(),
              ),
            );
          },
        ),
      );
}
