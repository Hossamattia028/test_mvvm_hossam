import 'package:flutter/material.dart';
import 'package:hossam_test_mvvm/features/presentation/views/pages/insert_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _ShowPageState();
}

class _ShowPageState extends State<HomePage> {
  // MainProvider? _mainProvider;
  @override
  void didChangeDependencies() {
    // _mainProvider = Provider.of<MainProvider>(context);
    // if(_mainProvider!.futureData==null){
    //   _mainProvider!.getAllListFromSQL();
    // }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test ",),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:
                  (context)=>const InsertPage(key: Key("InsertPage"))));
            },
            icon: const Icon(Icons.add),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      // body:
      // _mainProvider!.list!.isEmpty?
      // const Center(child: Text("empty list"),)
      //     :
      //   const ItemList()

    );
  }
}
