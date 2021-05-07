import 'package:cash_machine/app/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenViewmodel(),
      child: Consumer<HomeScreenViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: model.ammountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Ammount"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => model.validateInput(context),
                    child: Text("Calculate"),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(
                          model.notesDespensed.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("${model.notesDespensed[index]},"),
                              )),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
