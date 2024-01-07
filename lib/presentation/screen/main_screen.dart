import 'package:flutter/material.dart';
import 'package:image_search_app_practice/presentation/view_model/main_view_model.dart';
import 'package:image_search_app_practice/ui/widget/common/image_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

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
                      onPressed: () {
                        viewModel.queryImage(textEditingController.text);
                      }),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              viewModel.state.isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                        ),
                        itemCount: viewModel.state.images.length,
                        itemBuilder: (context, index) {
                          return ImageWidget(
                              url: viewModel.state.images[index].url);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
