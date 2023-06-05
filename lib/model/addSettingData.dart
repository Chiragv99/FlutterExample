class AddSettingData {


  String meter;
  String frame;
  String work;
  String rate;
  int id;


  AddSettingData({required this.meter,required this.frame,required this.work,required this.rate,required this.id});



  AddSettingData.fromMap(Map<String, dynamic> result)
      : meter = result["meter"],
        frame = result["frame"],
        work = result["work"],
        rate = result["rate"],
        id = result["id"];

  Map<String, Object> toMap() {
    return {
      'meter': meter,
      'frame': frame,
      'work': work,
      'rate': rate,
      'id': id
    };
  }

}