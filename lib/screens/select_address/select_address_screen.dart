import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'address_model.dart';
enum AddressLevel{
  province('p'),district('d'),ward('w');
  const AddressLevel(this.value);
  final String value;
}
class AddressSelectScreen extends StatefulWidget {
  const AddressSelectScreen({super.key, this.level = AddressLevel.province});
  final AddressLevel level;

  @override
  State<AddressSelectScreen> createState() => _AddressSelectScreenState();
}

class _AddressSelectScreenState extends State<AddressSelectScreen> {
  final client = Dio(
    BaseOptions(
      baseUrl: 'https://provinces.open-api.vn/api',
      headers: {
        'Content-type': 'application/json'
      },
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            hintText: 'Search...'
          ),
        ),
      ),
      body: FutureBuilder<List<AddressModel>>(
        future: _getAddress(widget.level),
        builder: (context,snapshot) {
          if(snapshot.hasError){
            return const Center(child: Text('Error occured. Try later'));
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            return ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context,index) => ListTile(
                  onTap: (){
                    late AddressLevel? nextLevel;
                    switch(widget.level){
                      case AddressLevel.province: nextLevel = AddressLevel.district;break;
                      case AddressLevel.district: nextLevel = AddressLevel.ward;break;
                      case AddressLevel.ward: nextLevel = null;
                    }
                    if(nextLevel == null){
                      showDialog(context: context, builder: (context) => Center(
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text('Done!'),
                        ),
                      ));
                      return;
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (_) => AddressSelectScreen(level: nextLevel!)));
                  },
                  title: Text('${snapshot.data?[index].name}'),
                ),
              separatorBuilder: (context,index) => const Divider(height: 1,thickness: 1,indent: 16,endIndent: 16),
            );
          }
          return const SizedBox.shrink();

        }
      ),
    );
  }

  Future<List<AddressModel>> _getAddress(AddressLevel level) async {
   try{
     return await client.get('/${level.value}').then((value) {
       if(value.statusCode == HttpStatus.ok){
         return (value.data as List<dynamic>).map((e) => AddressModel.fromJson(e)).toList();
       }
       throw Exception('Another status code');
     });
   } catch(e){
     debugPrint('Exception fetch address: \n$e');
     rethrow;
   }
  }
}
