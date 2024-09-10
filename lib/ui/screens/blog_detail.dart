import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/custom_network_image.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:flutter_fabby_demo/viewModels/blogdetail_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';

import '../../strings/strings.dart';
import '../../utils/html_renderer.dart';
import '../../utils/navigation_service.dart';
import '../lists/RecentBlog_list.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late BlogDetailViewModel viewModel;
  String slug = AppConstants.noData;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<BlogDetailViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (slug.isNotEmpty && slug != AppConstants.noData) {
        viewModel.getBlogDetailRequest(slug);
        viewModel.blogsList("10");
        LoggerService.d("init State","I am running");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    slug =data?['slug'] ?? AppConstants.noData;
    LoggerService.d("slug $slug");
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.blogs),
      body: Consumer<BlogDetailViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return  Center(
              child: LoadingAnimationWidget.staggeredDotsWave(color: AppColors.fabbyBondiBlue, size: 50.0),
            );
          }


          final blogData = viewModel.blogsDetailData?.data;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CustomNetworkImage(
                      imageUrl:blogData!.image,
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextUtils.display(blogData.title,fontSize: 24, fontWeight: FontWeight.bold, maxLines: 2),
                  const SizedBox(height: 8.0),
                  HtmlRenderer(
                    htmlData: blogData.articleContents[0].description,
                  ),
                  const SizedBox(height: 24.0),
                  TextUtils.display(AppStrings.recentBlogs,fontSize: 20, fontWeight: FontWeight.bold),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 300.0, // or any height you want
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      // Wrap the list with Expanded to allow it to grow and fill the available space
                      child: RecentblogList(
                        items: viewModel.blogsModelData?.data.articles ?? [],
                        onMoveToBlogDetail: (int index) {
                          LoggerService.d('Blog Detail clicked at index: $index');
                          final items = viewModel.blogsModelData?.data.articles ?? [];
                          final item = items[index];
                          NavigationService.navigateToWithData(const BlogScreen(), data: {"slug": item.slug});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}