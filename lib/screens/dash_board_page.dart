import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final _noteStream = Supabase.instance.client.from('notes').stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _noteStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
              itemBuilder: (context, index) {
              //final note = data![index];
              return ListTile(
                title: Text(data[index]['body']),
              );
            });
        }
      )
    );
  }
}
