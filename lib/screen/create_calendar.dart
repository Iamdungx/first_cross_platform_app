import 'package:flutter/material.dart';

// Chuyển AddColumn sang StatefulWidget để quản lý trạng thái
class CreateCalendar extends StatefulWidget {
  const CreateCalendar({super.key});

  @override
  _CreateCalendarState createState() => _CreateCalendarState();
}

class _CreateCalendarState extends State<CreateCalendar> {
  // Khai báo biến final để không thay đổi giá trị
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Nhập ngày',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Nhập thời gian',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}