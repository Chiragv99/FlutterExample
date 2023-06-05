class AddCanvasRate {


  String canvasrate;
  int id;


  AddCanvasRate({required this.canvasrate,required this.id});



  AddCanvasRate.fromMap(Map<String, dynamic> result)
      : canvasrate = result["canvasrate"],
        id = result["id"];

  Map<String, Object> toMap() {
    return {
      'canvasrate': canvasrate,
      'id': id
    };
  }

}