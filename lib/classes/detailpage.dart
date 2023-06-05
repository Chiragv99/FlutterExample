import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterapi/model/addCanvasModel.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../database/dbManager.dart';
import '../model/getCanvasRate.dart';
import '../model/invoice.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class DetailPage  extends StatelessWidget{
  final Invoice invoice;
  final DbManager dbManager = DbManager();

    String pdfFile = '';

    DetailPage({Key? key, required this.invoice,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DbManager dbManager = DbManager();
    dbManager.openDb().whenComplete(() async {
      await getCanvasData();
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _createPDF();
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: const Text("invoice"),

      ),
      body:  FutureBuilder(
          future: dbManager.retrievePlanets(),
          builder: (BuildContext context, AsyncSnapshot<List<AddCanvasModel>> snapshot){
            if(snapshot.hasData){
              return  ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),child:
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Area ${snapshot.data![index].area}"),
                          trailing: Text("Canvas ${snapshot.data![index].canvas}",
                          ),
                        ),
                        DefaultTextStyle.merge(
                          style: Theme.of(context).textTheme.headlineMedium,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
                },
              );

            }else{
              return const CircularProgressIndicator(
              );
            }

          })

    );
  }

  Future<List> getCanvasData() async{
    var result = dbManager.retrievePlanets();
    Future<String> rate   = dbManager.getCurrencyRates(0);
    String strRate = await rate;
    return result;
  }


  Future<void> _createPDF() async {

    Future<List<AddCanvasModel>> listCanvas   = dbManager.retrievePlanets();
    List<AddCanvasModel> listmain = await listCanvas;

    PdfDocument document = PdfDocument();

    PdfGrid grid = PdfGrid();
    grid.columns.add(count: 3);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Area';
    header.cells[1].value = 'Canvas';
    header.cells[2].value = 'Total';

    for(int i=0; i<listmain.length; i++){
      print("canvas${listmain[i].canvas}");

      PdfGridRow row = grid.rows.add();
      row.cells[0].value = i.toString();
      row.cells[1].value =  listmain[i].area.toString();
      row.cells[2].value = listmain[i].canvas.toString();
    }
    grid.draw(page: document.pages.add(), bounds: const Rect.fromLTWH(20, 20, 0, 0));
    //Create a new PDF document

    final directory = await getApplicationSupportDirectory();
    final path = directory.path;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    File('$path/'+timestamp.toString()+".pdf").writeAsBytes(await document.save());
    savePdfFile('$path/'+timestamp.toString()+".pdf");
  }

 savePdfFile(String strpath) async {
  //Get external storage directory
  final directory = await getApplicationSupportDirectory();
  final path = directory.path;
//Open the PDF document in mobile
  OpenFile.open(strpath);
}

}