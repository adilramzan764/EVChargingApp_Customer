import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketManager {
  static final SocketManager _instance = SocketManager._internal();

  factory SocketManager() {
    return _instance;
  }

  SocketManager._internal();

  late IO.Socket socket;

  void initSocket(String serverUrl) {
    socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.connect();

    socket.onConnect((_) {
      print('Connected to server');
    });

    socket.on('disconnect', (_) {
      print('Disconnected from server');
    });
  }

  void joinRoom(String room) {
    socket.emit('join', [room]);
  }

  void sendBookings(Map<String, dynamic> bookingsData) {
    socket.emit('bookings', [bookingsData]);
  }
}
