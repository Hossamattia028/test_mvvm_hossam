import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          // var item = ;
          return GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1,color: Colors.black54)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("#${item.id}",),
                  // SizedBox(width: 10.w,),
                  // Text("${item.title}",),
                ],
              ),
            ),
          );
        }, separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemCount:3);
  }
}
