import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: Future.delayed(const Duration(
                  milliseconds: 100,
                )).then((value) {
                  return rootBundle.loadString("assets/guide.md");
                }),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Markdown(
                      data: snapshot.data!,
                      styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          color: Colors.orange[700],
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                  "CLOSE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.button!.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
