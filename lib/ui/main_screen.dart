import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/main_view_model.dart';
import 'package:image_search_app_practice/ui/widget/image_item_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: () async {
                      await viewModel.searchImage(_textEditingController.text);
                    },
                  ),
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              viewModel.state.isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                        itemCount: viewModel.state.imageItems.length,
                        itemBuilder: (context, index) {
                          return ImageItemWidget(
                              url: viewModel.state.imageItems[index].url);
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
