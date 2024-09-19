import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/viewModels/notification_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/logger_service.dart';
import '../lists/notification_list.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationViewmodel viewModel;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<NotificationViewmodel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchOrderList();
    });
  }

  Future<void> _fetchOrderList() async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'user_id': mainId,
      'filter': "",
      'store_id': 1,
      'type': "notification_short",
      'search': ""
      // Handle the case where guestId is null
    };
    LoggerService.d("main id", 1);
    LoggerService.d("main", mainId);
    LoggerService.d("guest", guestId);
    // viewModel.getPreOrder(49);
    viewModel.getNotificationList(requestBody);
  }

  // Currently selected option
  // String selectedSortOption = "All Product";
  // String sortBy = "";
  // String searchTxt = "";

  // final List<String> orderIds = [
  //   '20240712134358514218',
  //   '20240712134230918265',
  //   '20240712133524149946',
  //   '20240712132456264609',
  //   '20240712125556023857',
  // ];

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.notification),
      body: Container(
        child: Consumer<NotificationViewmodel>(
          builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.fabbyBondiBlue, size: 50.0),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: NotificationList(
                items: viewModel.notificationModel?.data?.data ?? [],
              ),
            );
          },
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//   final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//
//     return Scaffold(
//       appBar: const TopBarDetail(title: AppStrings.products),
//       body: ListView.builder(
//         itemCount: orderIds.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     // Pink dot
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                         color: Colors.pink,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     // Text content
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Order Confirmation',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           RichText(
//                             text: TextSpan(
//                               style: TextStyle(color: Colors.black, fontSize: 14),
//                               children: [
//                                 TextSpan(text: 'Hello Pranay, we have received your order '),
//                                 TextSpan(
//                                   text: '(order ID : ${orderIds[index]})',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 TextSpan(
//                                   text: '. Thank you for choosing Fabby Furever.',
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: OrderConfirmationList(),
//   ));
// }
