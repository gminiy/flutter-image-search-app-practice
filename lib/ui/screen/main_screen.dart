import 'package:flutter/material.dart';
import 'package:image_search_app_practice/repository/pixabay_image_repository.dart';
import 'package:image_search_app_practice/model/pixabay_image.dart';
import 'package:image_search_app_practice/ui/widget/pixabay_image_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PixabayImageRepository _pixabayImageRepository = PixabayImageRepository();
  bool isLoading = false;
  List<PixabayImage> pixabayImages = [];
  final TextEditingController _controller = TextEditingController();

  Future<void> search() async {
    isLoading = true;
    setState(() {});
    pixabayImages =
        await _pixabayImageRepository.searchImages(_controller.text);
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search_outlined),
                    onPressed: () {
                      search();
                    },
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF4FB6B2),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF4FB6B2),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF4FB6B2),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 32,
                            mainAxisSpacing: 32,
                          ),
                          itemCount: pixabayImages.length,
                          itemBuilder: (context, index) {
                            return PixabayImageWidget(
                              url: pixabayImages[index].imageUrl,
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
