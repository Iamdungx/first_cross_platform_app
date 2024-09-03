import 'package:first_app/screen/create_row.dart';
import 'package:first_app/screen/create_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Sử dụng StatefulWidget để thay đổi trạng thái của widget
class MainApp extends StatefulWidget { 
  const MainApp({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainApp> {
  // Biến lưu chỉ số mục được chọn
  int _selectedIndex = 0;

  // Danh sách các màn hình để hiển thị tương ứng với mục trong BottomNavigationBar
  final List<Widget> screens = [
    const CreateRow(),
    const CreateCalendar(),
  ];

  // Hàm thay đổi mục được chọn
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // In ra thông báo tùy vào mục được chọn
    switch(index) {
      case 0:
        print('Bạn vừa chọn mục: Tạo danh sách');
        break;
      case 1:
        print('Bạn vừa chọn mục: Tạo lịch');
        break;
      default:
        print('Bạn vừa chọn mục: Môn học');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tắt banner debug
      debugShowCheckedModeBanner: false,
      // Đặt theme cho ứng dụng
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      home: Scaffold(
        // Hiển thị màn hình tương ứng với mục được chọn
        body: screens[_selectedIndex],
        // Thanh điều hướng dưới cùng
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tạo danh sách',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Tạo lịch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Môn học',
            ),
          ],
          // Chỉ số mục đang được chọn
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 70, 172, 219),
          // Gọi hàm khi người dùng chọn mục
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

