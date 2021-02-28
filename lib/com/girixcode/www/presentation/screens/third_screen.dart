import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/presentation/screens/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title, this.color}) : super(key: key);
  final Color color;

  final String title;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (BuildContext context, state) => Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  heroTag: "Homej",
                ),
                // SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.bloc<CounterCubit>().increment();
                  },
                  heroTag: "Home",
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext _context) => BlocProvider.value(
                        value: BlocProvider.of<CounterCubit>(context),
                        child: SecondScreen(
                          title: "Second Screen",
                        ),
                      ))),
              child: Text("Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
