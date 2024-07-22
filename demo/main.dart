import 'package:flutter/material.dart'; 
  
void main() => runApp(const MyApp()); 
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: const HomePage(), 
      theme: ThemeData( 
        brightness: Brightness.dark, 
      ), 
    ); 
  } 
} 
  
class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override 
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState(); 
} 
  
class _HomePageState extends State<HomePage> { 
  final _formKey = GlobalKey<FormState>(); 
  var isLoading = false; 
  
  void _submit() { 
    final isValid = _formKey.currentState!.validate(); 
    if (!isValid) { 
      return; 
    } 
    _formKey.currentState?.save(); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text("Form Validation"), 
        leading: const Icon(Icons.filter_vintage), 
      ), 
      //body 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        //form 
        child: Form( 
          key: _formKey, 
          child: Column( 
            children: <Widget>[ 
              const Text( 
                "Form-Validation In Flutter ", 
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold), 
              ), 
              //styling 
              SizedBox( 
                height: MediaQuery.of(context).size.width * 0.1, 
              ), 
              TextFormField( 
                decoration: const InputDecoration(labelText: 'E-Mail'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) { 
                  //Validator 
                }, 
                validator: (value) { 
                  if (value!.isEmpty || 
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") 
                          .hasMatch(value)) { 
                    return 'Enter a valid email!'; 
                  } 
                  return null; 
                }, 
              ), 
              //box styling 
              SizedBox( 
                height: MediaQuery.of(context).size.width * 0.1, 
              ), 
              //text input  
              TextFormField( 
                decoration: const InputDecoration(labelText: 'Password'), 
                keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                obscureText: true, 
                validator: (value) { 
                  if (value!.isEmpty) { 
                    return 'Enter a valid password!'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox( 
                height: MediaQuery.of(context).size.width * 0.1, 
              ), 
              ElevatedButton( 
                
                child: const Text( 
                  "Submit", 
                  style: TextStyle( 
                    fontSize: 24.0, 
                  ), 
                ), 
                onPressed: () => _submit(), 
              ) 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 