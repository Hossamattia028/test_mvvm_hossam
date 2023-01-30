


import 'package:flutter/material.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);
  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController _productNameController = TextEditingController();
  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  // MainProvider? _mainProvider;
  @override
  void didChangeDependencies() {
    // _mainProvider = Provider.of<MainProvider>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add new Item",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, opacity: 12, size: 25),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            TextFormField(
              // validator: (value) =>
              // value.isEmpty ? 'item title can\'t be empty' : null,
              controller: _productNameController,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              cursorWidth: 2.0,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                border: OutlineInputBorder(),
                hintText: "title",
              ),
              onTap: () {},
              autofocus: false,
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: Colors.black, decorationColor: Colors.black),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: () async{
                  if(_productNameController.text.toString().trim().isNotEmpty){
                    // await _mainProvider!.addListToSql(ListModel(title: _productNameController.text..trim(),
                    //     imgPath: image!.path)).then((value) {
                    //   if(value==true){
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(content:  Text("Added Successfully",
                    //           style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,));
                    //     _productNameController.text = '';
                    //     image = null;
                    //   }
                    // });
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:  Text("please add all required fields",
                            style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
