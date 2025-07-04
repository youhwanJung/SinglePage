import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
                  child: Text("DetailScreen"),
                )),
            SizedBox(height: 16,),
            ElevatedButton(
                onPressed: () {
                  print("디테일 스크린 버튼 클릭");
                },
                child: Text("Button")
            )
          ],
        ),
      ),
    );
  }
}
