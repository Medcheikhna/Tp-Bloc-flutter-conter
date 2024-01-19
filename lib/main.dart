import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_project/bloc/bloc_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocBloc(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Icons Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Conter value is : ",
              style: TextStyle(fontSize: 18),
            ),
            BlocBuilder<BlocBloc, BlocState>(
              builder: (context, state) {
                if (state is BlocInitial) {
                  return Text(
                    "0",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  );
                } else if (state is CounterValueChangedState) {
                  return Text(
                    state.counter.toString(),
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  );
                }
                return SizedBox();
              },
            ),
            //les debus des button
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<BlocBloc>(context).add(IncrementEvent());
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                BlocProvider.of<BlocBloc>(context).add(DecrementEvent());
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                BlocProvider.of<BlocBloc>(context).add(RestEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
