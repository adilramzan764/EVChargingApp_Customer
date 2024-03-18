import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  late IO.Socket socket;

  SocketManager() {
    // Constructor: Call initSocket during object creation
    initSocket('http://192.168.10.8:5000/');
  }

  void initSocket(String serverUrl) {
    print("trying to connect");
    socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.connect();

    socket.onConnect((_) {
      print('Connected to server');
    });

    // socket.on('disconnect', (_) {
    //   print('Disconnected from server');
    // });
  }

  void joinRoom(String room) {
    // Ensure that socket is initialized before using it
    if (socket.connected) {
      socket.emit('join', [room]);
    } else {
      print('Socket not connected. Cannot join room.');
    }
  }

  void sendBookings(Map<String, dynamic> bookingsData) {
    // Ensure that socket is initialized before using it
    if (socket.connected) {
      socket.emit('bookings', [bookingsData]);
    } else {
      print('Socket not connected. Cannot send bookings.');
    }
  }
}
