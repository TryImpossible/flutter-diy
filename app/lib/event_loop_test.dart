import 'dart:async';

import 'dart:isolate';

// void main() {
//   Future(() => print('Running in Future 1')); // 下一个事件循环输出字符串
//
//   Future(() => print('Running in Future 2'))
//       .then((_) => print('and then 1'))
//       .then((_) => print('and then 2')); // 上一个事件循环结束后，连续输出三段字符串
// }

// void main() {
//   //f1 比 f2 先执行
//   Future(() => print('f1'));
//   Future(() => print('f2'));
//
//   //f3 执行后会立刻同步执行 then 3
//   Future(() => print('f3')).then((_) => print('then 3'));
//
//   //then 4 会加入微任务队列，尽快执行
//   Future(() => null).then((_) => print('then 4'));
// }

// void main() {
//   Future(() => print('f1')); // 声明一个匿名 Future
//   Future fx = Future(() => null); // 声明 Future fx，其执行体为 null
//
// // 声明一个匿名 Future，并注册了两个 then。在第一个 then 回调里启动了一个微任务
//   Future(() => print('f2')).then((_) {
//     print('f3');
//     scheduleMicrotask(() => print('f4'));
//   }).then((_) => print('f5'));
//
// // 声明了一个匿名 Future，并注册了两个 then。第一个 then 是一个 Future
//   Future(() => print('f6'))
//       .then((_) => Future(() => print('f7')))
//       .then((_) => print('f8'));
//
// // 声明了一个匿名 Future
//   Future(() => print('f9'));
//
// // 往执行体为 null 的 fx 注册了了一个 then
//   fx.then((_) => print('f10'));
//
// // 启动一个微任务
//   scheduleMicrotask(() => print('f11'));
//   print('f12');
// }

// doSth(msg) => print(msg);
// void main() {
//   Isolate.spawn(doSth, "Hi");
// }

// main() async {
//   ReceivePort receivePort= ReceivePort();// 创建管道
//   // 创建并发 Isolate，并传入发送管道
//   Isolate? isolate = await Isolate.spawn(getMsg, receivePort.sendPort);
//   // 监听管道消息
//   receivePort.listen((data) {
//     print('Data：$data');
//     receivePort.close();// 关闭管道
//     isolate?.kill(priority: Isolate.immediate);// 杀死并发 Isolate
//     isolate = null;
//   });
// }
// // 并发 Isolate 往管道发送一个字符串
// getMsg(sendPort) => sendPort.send("Hello");

// // 并发计算阶乘
// Future<dynamic> asyncFactoriali(n) async{
//   final response = ReceivePort();// 创建管道
//   // 创建并发 Isolate，并传入管道
//   await Isolate.spawn(_isolate,response.sendPort);
//   // 等待 Isolate 回传管道
//   final sendPort = await response.first as SendPort;
//   // 创建了另一个管道 answer
//   final answer = ReceivePort();
//   // 往 Isolate 回传的管道中发送参数，同时传入 answer 管道
//   sendPort.send([n,answer.sendPort]);
//   return answer.first;// 等待 Isolate 通过 answer 管道回传执行结果
// }
//
// //Isolate 函数体，参数是主 Isolate 传入的管道
// _isolate(initialReplyTo) async {
//   final port = ReceivePort();// 创建管道
//   initialReplyTo.send(port.sendPort);// 往主 Isolate 回传管道
//   final message = await port.first as List;// 等待主 Isolate 发送消息 (参数和回传结果的管道)
//   final data = message[0] as int;// 参数
//   final send = message[1] as SendPort;// 回传结果的管道
//   send.send(syncFactorial(data));// 调用同步计算阶乘的函数回传结果
// }
// // 同步计算阶乘
// int syncFactorial(n) => n < 2 ? n : n * syncFactorial(n-1);
// main() async => print(await asyncFactoriali(4));// 等待并发计算阶乘结果

// // 同步计算阶乘
// int syncFactorial(n) => n < 2 ? n : n * syncFactorial(n-1);
// // 使用 compute 函数封装 Isolate 的创建和结果的返回
// main() async => print(await compute(syncFactorial, 4));
