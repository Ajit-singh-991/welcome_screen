// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:welcome_screen/models/albums.dart';
import 'package:welcome_screen/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Albums>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

    getData()async{
     posts = await RemoteServices().getPosts();
     if(posts!= null){
      setState(() {
        isLoaded= true;
      });
     }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
     
     body:Visibility(
      replacement: const Center(
        child: CircularProgressIndicator(),
       ),
      visible: isLoaded,
       child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index){
        return Container(
          padding: const EdgeInsets.all(16),

           child: Row(
             children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 16,),
               Expanded(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts![index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    
                     Text(posts![index].title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                   
                    ),
                    ],
                  ),
               ),
             ],
           ),
         
        );
       }
       ),
       
     )
    );
    
  }
}