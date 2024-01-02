import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/screen/viewModel/main_view_model.dart';
import 'package:image_search_app_practice/ui/widget/pixabay_image_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final MainViewModel _viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search_outlined),
                      onPressed: () {
                        _viewModel.searchImages(_textEditingController.text);
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFF4FB6B2),
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFF4FB6B2),
                          width: 2,
                        ))),
              ),
              const SizedBox(
                height: 32,
              ),
              StreamBuilder(
                initialData: false,
                stream: _viewModel.isLoadingStream,
                builder: (context, snapshot) {
                  if (snapshot.data != false) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                        itemCount: _viewModel.pixabayImageItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, crossAxisSpacing: 24),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PixabayImageItem(
                              url: _viewModel.pixabayImageItems[index].url,
                            ),
                          );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
