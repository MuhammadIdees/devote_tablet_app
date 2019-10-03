import 'dart:io';
import 'package:devote_app/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'http://10.0.2.2:4000';

Future<User> getUser() async{
  final response = await http.get('$url');
  return userFromJson(response.body);
}

Future<http.Response> createPost(User user) async{
  final response = await http.post('$url/wallet',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: userToJson(user)
  );
  return response;
}

Future<http.Response> castVote(Vote vote) async{
  final response = await http.post('$url/ballot',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: voteToJson(vote)
  );
  return response;
}