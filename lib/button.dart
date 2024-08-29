import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Sử dụng cấu trúc điều kiện if else
class MainApp extends StatefulWidget { 
  //Sử dụng stateful widget để thay đổi trạng thái của widget
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
  }

class _MainAppState extends State<MainApp> {
  // Tạo lớp chứa trạng thái của widget

  // Khai báo biến final để không thay đổi giá trị
  final TextEditingController _controller = TextEditingController();
  // TextEditingController để lấy giá trị và kiểm soát TextField
  final List<int> _numbers = [];
  int _selectedIndex = 0;

  // Hàm thêm số vào danh sách
  void _addNumber() {
    if (_controller.text.isNotEmpty){
      // setState() để cập nhật trạng thái của widget khi có dữ liệu trong TextField
      setState(() {
        int count = int.parse(_controller.text);
        if (count <= 0) {
          print('Hãy nhập số lớn hơn 0');
        }
        else if (count >= 9) {
          print('Hãy nhập số nhỏ hơn 10');
        }
        else {
          _numbers.clear();
        _numbers.addAll(List.generate(count, (index) => index + 1));
        _controller.clear();
        print('Bạn vừa sử dụng _addNumber() với giá trị _numbers: $_numbers');
        // Xoá dữ liệu trong TextField sau khi đã cập nhật trạng thái
        }
      });
    }
    else {
      print('Dữ liệu chưa được nhập');
    } 
  }

  // Hàm xoá danh sách
  void _removeList() {
    if (_numbers.isNotEmpty){
      setState(() {
      _numbers.clear();
      print('Bạn vừa sử dụng _removeList()');
    });
    }
    else {
      print('Giá trị tạo hàng rỗng, hãy tạo trước khi xoá');
    }
  }
  // Giải thích liên quan giữa hàm _addNumber() và lớp _MainAppState
  // Hàm _addNumber() được gọi khi người dùng nhấn nút, 
  // Và được cập nhật dữ liệu vào biến _numbers

  // Hàm _removeList() được gọi khi người dùng nhấn nút (Chưa sử dụng)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('Bạn vừa chọn mục: $index');
  }

  @override
  Widget build(BuildContext context) {
    // Hàm build() để xây dựng lại widget mỗi khi reload ứng dụng
    return MaterialApp(
      // Turn off the debug banner
      debugShowCheckedModeBanner: false,
      // Set the theme of the application
      theme: ThemeData(
        // Set the primary color of the application
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: false, 
      ),
      home: Scaffold(
        // Add the app bar
        appBar: AppBar(
          // Set the title of the app bar
          title: const Text('First App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children: [
                // Tạo text field để nhập số
                TextField(
                  controller: _controller, // Gán _controller vào controller cho TextField
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Nhập số hàng muốn tạo',
                    border: OutlineInputBorder(),
                  ),
                ),
                // Tạo button để thêm số vào danh sách
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                      onPressed: _addNumber, // Gán hàm _addNumber vào onPressed cho button
                      child: const Row(
                        children: [
                          Icon(Icons.library_add),
                          SizedBox(width: 3),
                          Text('Thêm số'),
                        ],
                      )
                      ),
                      const SizedBox(width: 25),
                      ElevatedButton(
                        onPressed: _removeList, // Gán hàm _removeList vào onPressed cho button
                        child: const Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(width: 3),
                            Text('Xoá danh sách'),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _numbers.isEmpty ? const Text('Vui lòng nhập số hàng muốn tạo !') : 
                // Expanded để mở rộng danh sách số
                Expanded(
                  child: Column(
                    children: _numbers.map(
                      (number) => ListTile(
                        title: Text('Hàng số: $number'),
                        leading: const Icon(Icons.tag),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: (){
                          print('Bạn vừa chọn số: $number');
                        },
                      )
                    ).toList(),
                  ),
                ),
              ]
          ),
        ),
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
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 70, 172, 219),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
