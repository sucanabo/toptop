import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:toptop/data/keys.dart';

import './video_response.dart';
import 'package:http/http.dart' as http;
class VideoRepository{
  Future<VideoResponse?> getVideoList({int page = 1, int limit = 10}) async {
    try{
      return await http.get(
        Uri.parse('https://api.pexels.com/videos/popular?per_page=$page&page=$limit'),
        headers: {
          'Authorization': AppKeys.authKey,
        }
      ).then((value) {
        if(value.statusCode == 200){
          debugPrint("json: ${value.body}");
          return VideoResponse.fromJson(jsonDecode(value.body));
        }
        return null;
      });
    }catch(e){
      debugPrint("Error when getVideoList http \n $e");
    }
  }
}