import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/blogs_detail_model.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/viewModels/blogdetail_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../network/api_service.dart';

import '../../strings/strings.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({super.key});
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late BlogDetailViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<BlogDetailViewModel>(context, listen: false);
      // viewModel.getBlogDetailRequest("");
      // viewModel.blogsList(AppConstants.blogsStartLimit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.contactUs),
      // body: FutureBuilder<BlogsDetailDataModel>(
      //   future: viewModel.getBlogDetailRequest("slug");
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData || snapshot.data == null) {
      //       return Center(child: Text('No data found'));
      //     }
      //
      //     final blogData = snapshot.data.data;
      //
      //     return SingleChildScrollView(
      //       child: Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             ClipRRect(
      //               borderRadius: BorderRadius.circular(20.0),
      //               child: Image.network(
      //                 blogData.image,
      //                 height: 200.0,
      //                 width: double.infinity,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //             const SizedBox(height: 16.0),
      //             Text(
      //               blogData.title,
      //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //             ),
      //             const SizedBox(height: 8.0),
      //             Text(
      //               blogData.articleContents[0].description,
      //               style: TextStyle(fontSize: 16),
      //             ),
      //             const SizedBox(height: 24.0),
      //             Text(
      //               'Recent Blogs',
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //             const SizedBox(height: 16.0),
      //             ListView.builder(
      //               shrinkWrap: true,
      //               physics: NeverScrollableScrollPhysics(),
      //               itemCount: blogData..length,
      //               itemBuilder: (context, index) {
      //                 final blog = blogData.blogs[index];
      //                 return Card(
      //                   child: ListTile(
      //                     leading: Image.network(blog.imageUrl),
      //                     title: Text(blog.title),
      //                     subtitle: Text(blog.description),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}