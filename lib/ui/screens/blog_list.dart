import 'package:flutter/material.dart';
import '../../models/blogs_model.dart';
import '../../network/api_service.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
        backgroundColor: Colors.pink[100],
      ),
      // body: FutureBuilder<List<BlogsModel>>(
      //   future: fetchBlogs(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Center(child: Text('No blogs found'));
      //     }
      //
      //     final blogs = snapshot.data!;
      //
      //     return ListView.builder(
      //       padding: EdgeInsets.all(16.0),
      //       itemCount: blogs.length,
      //       itemBuilder: (context, index) {
      //         final blog = blogs[index];
      //         return Card(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20.0),
      //           ),
      //           elevation: 5,
      //           margin: EdgeInsets.only(bottom: 16.0),
      //           child: Padding(
      //             padding: const EdgeInsets.all(16.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 ClipRRect(
      //                   borderRadius: BorderRadius.circular(15.0),
      //                   child: Image.network(
      //                     blog.imageUrl,
      //                     height: 200.0,
      //                     width: double.infinity,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 12.0),
      //                 Text(
      //                   blog.title,
      //                   style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 8.0),
      //                 Text(
      //                   blog.description,
      //                   maxLines: 2,
      //                   overflow: TextOverflow.ellipsis,
      //                   style: TextStyle(fontSize: 14),
      //                 ),
      //                 const SizedBox(height: 12.0),
      //                 GestureDetector(
      //                   onTap: () {
      //                     // Handle "Read More" tap
      //                   },
      //                   child: Text(
      //                     'Read More',
      //                     style: TextStyle(
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.blue[800],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}