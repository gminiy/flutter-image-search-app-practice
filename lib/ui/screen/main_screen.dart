import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/screen/main_view_model.dart';
import 'package:image_search_app_practice/ui/widget/image_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final MainViewModel viewModel = MainViewModel();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: () async {
                      await viewModel.queryImages(textEditingController.text);
                      setState(() {});
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                    ),
                    itemCount: viewModel.images.length,
                    itemBuilder: (context, index) {
                      return ImageWidget(image: viewModel.images[index]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
