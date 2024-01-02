import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/screen/main_view_model.dart';

class MainScreen extends StatelessWidget {
  final MainViewModel viewModel = MainViewModel();
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: viewModel.textEditingController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search_outlined),
                    onPressed: () {},
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                    ),
                    itemCount: viewModel.images.length,
                    itemBuilder: (context, index) {
                      return Text('$index');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
