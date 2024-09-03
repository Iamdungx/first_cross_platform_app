import 'package:flutter/material.dart';

// Chuyển CreateRow sang StatefulWidget để quản lý trạng thái
class CreateRow extends StatefulWidget {
  const CreateRow({super.key});

  @override
  _CreateRowState createState() => _CreateRowState();
}

class _CreateRowState extends State<CreateRow> {
  // Khai báo biến final để không thay đổi giá trị
  final TextEditingController _controller = TextEditingController();
  final List<int> _numbers = [];

  // Hàm thêm số vào danh sách
  void _addNumber() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Chuyển chuỗi từ TextField thành số
        int count = int.parse(_controller.text);
        // Kiểm tra nếu số nhập vào lớn hơn 0 và nhỏ hơn 10
        if (count <= 0) {
          print('Hãy nhập số lớn hơn 0');
        } else if (count >= 9) {
          print('Hãy nhập số nhỏ hơn 10');
        } else {
          // Nếu hợp lệ, xóa danh sách cũ và tạo danh sách mới
          _numbers.clear();
          _numbers.addAll(List.generate(count, (index) => index + 1));
          _controller.clear();
          print('Bạn vừa sử dụng _addNumber() với giá trị _numbers: $_numbers');
        }
      });
    } else {
      // Nếu không nhập dữ liệu
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
  // Hàm _addNumber() được gọi khi người dùng nhấn nút, 
  // Và được cập nhật dữ liệu vào biến _numbers

  // Hàm _removeList() được gọi khi người dùng nhấn nút (Chưa sử dụng)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo danh sách'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // TextField để nhập số
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nhập số hàng',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button để thêm số vào danh sách
                    ElevatedButton(
                      onPressed: _addNumber,
                      child: const Row(
                        children: [
                          Icon(Icons.library_add),
                          SizedBox(width: 3),
                          Text('Thêm số'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    // Button để xóa danh sách
                    ElevatedButton(
                      onPressed: _removeList,
                      child: const Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 3),
                          Text('Xoá danh sách'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Hiển thị danh sách hoặc thông báo nếu danh sách rỗng
              _numbers.isEmpty
                  ? const Text('Vui lòng nhập số hàng muốn tạo !')
                  : Expanded(
                      child: Column(
                        children: _numbers.map(
                          (number) => ListTile(
                            title: Text('Hàng số: $number'),
                            leading: const Icon(Icons.tag),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              print('Bạn vừa chọn số: $number');
                            },
                          ),
                        ).toList(),
                      ),
                    ),
            ],
          ),
        ),
    );
  }
}
