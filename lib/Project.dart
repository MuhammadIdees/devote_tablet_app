import 'dart:convert';

Project projectFromJson(String str){
  final jsonData = json.decode(str);
  return Project.fromMap(jsonData);
}

String projectToJson(Project data){
  final dyn = data.toJson();
  return json.encode(dyn);
}

String castVote(Project data){
  final dyn = data.vote();
  return json.encode(dyn);
}

class Project{
  final String id, projectTitle, projectDescription, supervisorName, groupLeader, projectPoster;

  const Project({
    this.id,
    this.projectTitle,
    this.projectDescription,
    this.supervisorName,
    this.groupLeader,
    this.projectPoster,
  });

  factory Project.fromMap(Map<String, dynamic> json) => new Project(
    id: json["id"],
    projectTitle: json["project_title"],
    projectDescription: json["project_description"],
    supervisorName: json["supervisor_name"],
    groupLeader: json["group_leader_name"],
    projectPoster: json["project_poster"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_title": projectTitle,
    "project_description": projectDescription,
    "supervisor_name": supervisorName,
    "group_leader_name": groupLeader,
    "project_poster": projectPoster,
  };

  Map<String, dynamic> vote() => {
    "id": id,
    "project_title": projectTitle,
  };
}

List<Project> projects = [
  const Project(
    id: "01",
    projectTitle: "3D Human Activity Recognition",
    projectDescription: "",
    supervisorName: "Dr. Sanam Narejo",
    groupLeader: "Fahad Ahmed Siddiqui",
    projectPoster: "",
  ),

  const Project(
    id: "02",
    projectTitle: "Decentralized E-voting using Blockchain",
    projectDescription: "",
    supervisorName: "Dr. Moazzam Javeed",
    groupLeader: "Muhammad Waris Baloch",
    projectPoster: "",
  ),

  const Project(
    id: "03",
    projectTitle: "Effectiveness of Book Prediction Using Data Mining technique",
    projectDescription: "",
    supervisorName: "Engr. Rizwan Badar Baloch",
    groupLeader: "Tabrez Ali",
    projectPoster: "",
  ),

  const Project(
    id: "04",
    projectTitle: "A Fully Automatic Integrate Library Sytem",
    projectDescription: "",
    supervisorName: "Dr. Irfan Ali Bacho",
    groupLeader: "16CS11",
    projectPoster: "",
  ),

  const Project(
    id: "05",
    projectTitle: "Real Time Credit Card Fraud Detection",
    projectDescription: "",
    supervisorName: "Dr. Muhammad Ahsan Ansari",
    groupLeader: "Kiran Mawany",
    projectPoster: "",
  ),

  const Project(
    id: "06",
    projectTitle: "Facial Recognition",
    projectDescription: "",
    supervisorName: "Dr. Sheeraz Memon",
    groupLeader: "Khadim Hussain",
    projectPoster: "",
  ),

  const Project(
    id: "07",
    projectTitle: "Comparision of Segmentaiton Technique for Liver Cancer Detection",
    projectDescription: "",
    supervisorName: "Dr. Liaquat Ali Thebo",
    groupLeader: "Syed Fahad",
    projectPoster: "",
  ),

  const Project(
    id: "08",
    projectTitle: "Fog Removal Assistance System",
    projectDescription: "",
    supervisorName: "Engr. Arbab Ali Samejo",
    groupLeader: "Deepa Kumari",
    projectPoster: "",
  ),

  const Project(
    id: "09",
    projectTitle: "Automatic Machine Translation Using Deep Learning and Image Processing",
    projectDescription: "",
    supervisorName: "Dr. Sanam Narejo",
    groupLeader: "Yusrah Bablani",
    projectPoster: "",
  ),

  const Project(
    id: "10",
    projectTitle: "Smart Ambulance System",
    projectDescription: "",
    supervisorName: "Dr. Tariq Jamil Khanzada",
    groupLeader: "Afaque Ahmed Patoli",
    projectPoster: "",
  ),

  const Project(
    id: "11",
    projectTitle: "Automatic Counting and Classification of Vehicle in Low Lightning Scenario",
    projectDescription: "",
    supervisorName: "Dr. Sheeraz Memon",
    groupLeader: "Jatesh Kumar Maheshwari",
    projectPoster: "",
  ),

  const Project(
    id: "12",
    projectTitle: "ADHOC Wireless Communicaiton Suit Based On Hand Gestures",
    projectDescription: "",
    supervisorName: "Dr. Sammar Zai",
    groupLeader: "Syed Ahsan Ali Jaffri",
    projectPoster: "",
  ),

  const Project(
    id: "13",
    projectTitle: "Smart Liquid Measurement Device",
    projectDescription: "",
    supervisorName: "Dr. Shahnawaz Talpur",
    groupLeader: "Sarrah Husnain",
    projectPoster: "",
  ),

  const Project(
    id: "14",
    projectTitle: "Robust Optical Monitoring For Assistance of MND/Paralyzed Patient",
    projectDescription: "",
    supervisorName: "Dr. Liaquat Ali Thebo",
    groupLeader: "Zaryab Aslam",
    projectPoster: "",
  ),

  const Project(
    id: "15",
    projectTitle: "Flood Level Indicator And Alerting System (IOT Based)",
    projectDescription: "",
    supervisorName: "Dr. Shahnawaz Talpur",
    groupLeader: "Munir Ahmed",
    projectPoster: "",
  ),

  const Project(
    id: "16",
    projectTitle: "IOT Gas Surveillance System",
    projectDescription: "",
    supervisorName: "Engr. Naveed Ahmed Jaffri",
    groupLeader: "Bissam Sheikh",
    projectPoster: "",
  ),
];