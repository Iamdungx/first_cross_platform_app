import 'package:flutter/material.dart';

void main() {
  // Kiểm tra xem hàm printHello() có hoạt động không
  // Lưu ý: sau khi ứng dụng thực thi, muốn gọi các hàm trong main (trước runApp)
  // Thì phải refresh lại ứng dụng 

  // printHello();

  runApp(const MainApp());
}

// Làm quen với các khái niệm cơ bản trong Dart
// 1. Khai báo biến và định nghĩa hàm
// - Thêm hàm printHello() để in ra

// void printHello() {
//   // Đặt break point để debug
//   String name = 'Bui Viet Dung';
//   // print('Hello $name !');
//   if (name == 'Bui Viet Dung') {
//     print('Hello $name !');
//   } else {
//     print('Hello Guest !');
//   }
//   // Thêm vòng lặp for
//   for (var i = 0; i < 5; i++) {
//     print('Vòng lặp thứ $i');
//   }
// }

// Sử dụng cấu trúc điều kiện if else

class MainApp extends StatelessWidget {
  const MainApp({super.key});

void inputField(){
  
}

  @override
  Widget build(BuildContext context) {
    // Hàm build() để xây dựng lại widget mỗi khi reload ứng dụng
    // Kết hợp các ví dụ Dart để tạo giao diện với Column và Row

    // 1. Tạo danh sách các số bằng vòng lặp for
    List<int> numbers = List.generate(5, (index) => index + 1);


    return MaterialApp(
      // Turn off the debug banner
      debugShowCheckedModeBanner: false,
      // Set the theme of the application
      theme: ThemeData(
        // Set the primary color of the application
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        useMaterial3: false, 
      ),
      home: Scaffold(
        // Add the app bar
        appBar: AppBar(
          // Set the title of the app bar
          title: const Text('First App'),
        ),
        body: Center(
          // Sử dụng câu điều kiện rẽ nhánh để hiển thị Widget
          
          child: numbers.isEmpty ? const Text('Không có dữ liệu') : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: numbers.map(
                  (number) => ListTile(
                    title: Text('Number $number'),
                    leading: const Icon(Icons.tag),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      print('Tapped: $number');
                    },
                  ),
                ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
