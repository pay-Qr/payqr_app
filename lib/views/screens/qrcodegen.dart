import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/qrcodegenrateur.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrcodeGen extends StatelessWidget {
  const QrcodeGen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
     QrCodeGenerateurControllerImp controller =
         Get.put(QrCodeGenerateurControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body:   Center(
          child: PrettyQr(
           
            
            size: 200,
            data: controller.data,
            errorCorrectLevel: QrErrorCorrectLevel.H,
            roundEdges: true,
          ),
        ),
      
    );
   
  }
}