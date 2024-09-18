const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);

io.on('connection', (socket) => {
  console.log('a user connected');

  // Listen for chat_message event
  socket.on('chat_message', (msg) => {
    console.log('message: ' + msg);
    io.emit('chat_message', msg); // Broadcast the message to all clients
  });

  // Handle disconnect
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
});

// Listen on a specific IP and port
http.listen(3000, '192.168.0.172', () => {
  console.log('listening on 192.168.0.172:3000');
});