import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:youtube_shorts_clone/bloc/models.dart';
import 'package:youtube_shorts_clone/bloc/shorts_state.dart';
import 'package:youtube_shorts_clone/utils/constants.dart' as constants;

class ShortService {
  static String hostURL = constants.hostURL;
  static const videosList = ['1', '2'];
  Uri getUriForPath(String baseUrl, String path, Map<String, String> queryParameters) {
    return Uri.https(baseUrl, path, queryParameters);
  }
  Future<List<YoutubeShort>> getVideosFn(int page) async{
    final http.Client httpClient = http.Client();
    List<YoutubeShort> shortList = [];
    try{
      final Map<String, String> _queryParameters = <String, String>{
        'page': page.toString(),
      };
      print(" <><><><><><> ${getUriForPath(hostURL, constants.getVideos, _queryParameters)}");
    final response = await httpClient.get(getUriForPath(hostURL, constants.getVideos, _queryParameters), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'},);
    if (response.statusCode == 200) {
       final responseBody = jsonDecode(response.body);

       final list = responseBody['data']['posts'];
       for (var element in list) {
         shortList.add(YoutubeShort.fromJson(element as Map<String, dynamic> ));
       }
      return shortList;
    }
    }catch(e) {
      debugPrint('<<<<<<<<<<<<<<<ERROR');
      //Todo: Error occurred boolean  variable "true"
    }
    return <YoutubeShort>[YoutubeShort(postId: '-1')];
  }
}