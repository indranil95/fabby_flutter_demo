// import 'package:flutter/material.dart';
// import '../../models/blogs_model.dart';
// import '../../network/api_service.dart';
//
// class BlogListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Blogs'),
//         backgroundColor: Colors.pink[100],
//       ),
//       // body: FutureBuilder<List<BlogsModel>>(
//       //   future: fetchBlogs(),
//       //   builder: (context, snapshot) {
//       //     if (snapshot.connectionState == ConnectionState.waiting) {
//       //       return Center(child: CircularProgressIndicator());
//       //     } else if (snapshot.hasError) {
//       //       return Center(child: Text('Error: ${snapshot.error}'));
//       //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//       //       return Center(child: Text('No blogs found'));
//       //     }
//       //
//       //     final blogs = snapshot.data!;
//       //
//       //     return ListView.builder(
//       //       padding: EdgeInsets.all(16.0),
//       //       itemCount: blogs.length,
//       //       itemBuilder: (context, index) {
//       //         final blog = blogs[index];
//       //         return Card(
//       //           shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(20.0),
//       //           ),
//       //           elevation: 5,
//       //           margin: EdgeInsets.only(bottom: 16.0),
//       //           child: Padding(
//       //             padding: const EdgeInsets.all(16.0),
//       //             child: Column(
//       //               crossAxisAlignment: CrossAxisAlignment.start,
//       //               children: [
//       //                 ClipRRect(
//       //                   borderRadius: BorderRadius.circular(15.0),
//       //                   child: Image.network(
//       //                     blog.imageUrl,
//       //                     height: 200.0,
//       //                     width: double.infinity,
//       //                     fit: BoxFit.cover,
//       //                   ),
//       //                 ),
//       //                 const SizedBox(height: 12.0),
//       //                 Text(
//       //                   blog.title,
//       //                   style: TextStyle(
//       //                     fontSize: 18,
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //                 const SizedBox(height: 8.0),
//       //                 Text(
//       //                   blog.description,
//       //                   maxLines: 2,
//       //                   overflow: TextOverflow.ellipsis,
//       //                   style: TextStyle(fontSize: 14),
//       //                 ),
//       //                 const SizedBox(height: 12.0),
//       //                 GestureDetector(
//       //                   onTap: () {
//       //                     // Handle "Read More" tap
//       //                   },
//       //                   child: Text(
//       //                     'Read More',
//       //                     style: TextStyle(
//       //                       fontSize: 14,
//       //                       fontWeight: FontWeight.bold,
//       //                       color: Colors.blue[800],
//       //                     ),
//       //                   ),
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         );
//       //       },
//       //     );
//       //   },
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:provider/provider.dart';

import '../../strings/strings.dart';
import '../../utils/navigation_service.dart';
import '../../viewModels/dashboard_viewmodel.dart';
import '../lists/blogs_list_vertical.dart';
import 'blog_detail.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  late DashboardViewModel viewModel;
  // String slug = AppConstants.noData;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<DashboardViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.blogsList("10");
      // if (slug.isNotEmpty && slug != AppConstants.noData) {
      //   viewModel.getBlogDetailRequest(slug);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.blogs),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // Wrap the list with Expanded to allow it to grow and fill the available space
                child: BlogsListVertical(
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
  }
}