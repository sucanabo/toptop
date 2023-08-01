import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:toptop/data/keys.dart';

import './video_response.dart';
import 'package:dio/dio.dart';
class VideoRepository{
  final _client = Dio();
  Future<VideoResponse?> getVideoList({int page = 1, int limit = 10}) async {
    try{
      return await _client.get(
        'https://api.pexels.com/videos/popular',
        options: Options(
          headers: {
            'Authorization': AppKeys.authKey,
          },
        ),
        queryParameters: {
          'per_page':limit,
          'page': page,
        },
      ).then((value) {
        if(value.statusCode == 200){
          debugPrint("json: ${value.data}");
          return VideoResponse.fromJson(jsonDecode(value.data));
        }
        return null;
      });
    }catch(e){
      debugPrint("Error when getVideoList http \n $e");
    }
  }
}