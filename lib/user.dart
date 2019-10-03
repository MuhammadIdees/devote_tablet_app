import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String voter;

    User({
        this.voter,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        voter: json["voterId"],
    );

    Map<String, dynamic> toJson() => {
        "voterId": voter,
    };
}

String voteToJson(Vote data) => json.encode(data.toJson());

class Vote {
    String candidate;

    Vote({
        this.candidate,
    });

    factory Vote.fromJson(Map<String, dynamic> json) => Vote(
        candidate: json["candidate"],
    );

    Map<String, dynamic> toJson() => {
        "candidate": candidate,
    };
}