import 'package:get/get.dart';
import 'package:mobile/app/data/models/dashboard_model.dart';
import 'package:mobile/app/data/providers/dashboard.provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class HomeController extends GetxController {
  Dashbord? dashboard;
  RxInt notifications = 0.obs;
  final dashboardRepository = Get.find<DashboardRepository>();

  final channel = IOWebSocketChannel.connect('ws://localhost:3000');

  HomeController() {
    channel.stream.listen((message) {
      channel.sink.close(status.goingAway);
    });
    channel.sink
        .add('{ "event": "REGISTER", "key": "rewrw", "connection": "CLIENTE"}');
  }
}