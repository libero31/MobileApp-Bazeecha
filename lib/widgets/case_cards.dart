import 'package:bazeecha/utils/colors.dart';

import 'package:flutter/material.dart';

class CaseCard extends StatefulWidget {
  final String title;
  final String caseDescription;
  final List<String> clues;
  final List<String> suspects;
  final String solution;
  final VoidCallback onComplete;

  const CaseCard({
    super.key,
    required this.title,
    required this.caseDescription,
    required this.clues,
    required this.suspects,
    required this.solution,
    required this.onComplete,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CaseCardState createState() => _CaseCardState();
}

class _CaseCardState extends State<CaseCard> {
  bool showSolution = false;
  bool showDareCard = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
            SizedBox(height: 12),

            // Case Description
            Text(
              "Case:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
            Text(
              widget.caseDescription,
              style: TextStyle(color: AppColor.white),
            ),
            SizedBox(height: 10),

            // Clues
            Text(
              "Clues:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
            ...widget.clues.map(
              (clue) =>
                  Text("• $clue", style: TextStyle(color: AppColor.white)),
            ),
            SizedBox(height: 10),

            // Suspects
            Text(
              "Suspects:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
            ...widget.suspects.map(
              (s) => Text("• $s", style: TextStyle(color: AppColor.white)),
            ),
            SizedBox(height: 20),

            // Show Answer Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.green,
                ),
                onPressed: () {
                  setState(() {
                    showSolution = !showSolution;
                  });
                },
                child: Text(
                  showSolution ? "Hide Answer" : "Show Answer",
                  style: TextStyle(color: AppColor.white),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Solution (conditionally shown)
            if (showSolution) ...[
              Text(
                "Solution:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                ),
              ),
              Text(widget.solution, style: TextStyle(color: AppColor.white)),
              SizedBox(height: 10),
            ],

            // Case Complete Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
                onPressed: widget.onComplete,
                child: Text(
                  "Case Complete",
                  style: TextStyle(color: AppColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
