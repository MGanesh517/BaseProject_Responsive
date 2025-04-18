import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';

class GirdExamples extends StatelessWidget {
  const GirdExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      // showEndDrawer: true,
      // showLeadingDrawer: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Single One", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(
                columns: [
                  ResponsiveColumn(
                    ResponsiveConstants().fullScreen,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 12",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
          SizedBox(height: 20.0),
              Text("Two Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(columns: [
                ResponsiveColumn(
                    ResponsiveConstants().twoGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 6",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().twoGridRes,
                    child: Container(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 6",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),
          
          SizedBox(height: 20.0),
          
            Text("Three Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(columns: [
                ResponsiveColumn(
                    ResponsiveConstants().threeGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 4",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().threeGridRes,
                    child: Container(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 4",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().threeGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 4",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),
          
          SizedBox(height: 20.0),
          
            Text("Four Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(columns: [
                ResponsiveColumn(
                    ResponsiveConstants().fourGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 3",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().fourGridRes,
                    child: Container(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 3",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().fourGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 3",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().fourGridRes,
                    child: Container(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 3",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),
          
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
            Text("Two Containers Space Between", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(
                alignment: ResponsiveAlignment.spaceBetween,
                runAlignment: ResponsiveAlignment.spaceBetween,
                columns: [
                ResponsiveColumn(
                    ResponsiveConstants().threeGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 6",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().threeGridRes,
                    child: Container(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 6",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),
          
          SizedBox(height: 20.0),
            Text("Single One Container", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(
                runAlignment: ResponsiveAlignment.spaceEvenly,
                columns: [
                  ResponsiveColumn(
                    ResponsiveConstants().threeGridRes,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 12",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
          SizedBox(height: 20.0),
            Text("Different BreakPoints", style: TextStyle(fontWeight: FontWeight.bold)),
              ResponsiveRow(
                columns: [
                  ResponsiveColumn(
                    ResponsiveConstants().fourGridRes,
                    child: Container(
                      color: Colors.blue[300],
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 3",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().nineBreakPoint,
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Col 6",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
          SizedBox(height: 20.0),
            Text("Spacing Evenly the Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: double.infinity,
                child: ResponsiveRow(
                  /////// to make this work we have to wrap this with sizedbox or Container and give the width
                  // runAlignment: ResponsiveAlignment.spaceEvenly,
                  alignment: ResponsiveAlignment.spaceEvenly,
                  breakOnConstraints: false,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 1",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 2",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 3",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 4",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

SizedBox(height: 20.0),
            Text("Spacing Around the Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: double.infinity,
                child: ResponsiveRow(
                  /////// to make this work we have to wrap this with sizedbox or Container and give the width
                  // runAlignment: ResponsiveAlignment.spaceEvenly,
                  alignment: ResponsiveAlignment.spaceAround,
                  breakOnConstraints: false,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 1",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 2",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 3",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 4",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

SizedBox(height: 20.0),
            Text("Spacing Between the Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: double.infinity,
                child: ResponsiveRow(
                  /////// to make this work we have to wrap this with sizedbox or Container and give the width
                  alignment: ResponsiveAlignment.spaceBetween,
                  breakOnConstraints: false,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 1",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 2",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 3",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 4",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



SizedBox(height: 20.0),
            Text("Spacing End the Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: double.infinity,
                child: ResponsiveRow(
                  alignment: ResponsiveAlignment.end,
                  breakOnConstraints: false,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 1",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 2",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 3",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 4",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



SizedBox(height: 20.0),
            Text("Spacing End the Containers", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: double.infinity,
                child: ResponsiveRow(
                  alignment: ResponsiveAlignment.center,
                  breakOnConstraints: false,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 1",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 2",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue[300],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 3",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().twoBreakPoint,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
                          child: Text(
                            "Col 4",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
