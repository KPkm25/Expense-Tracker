import 'package:flutter/material.dart';

class AddDescriptions extends StatefulWidget {
  final Function addDescription;

  const AddDescriptions({super.key, required this.addDescription});

  @override
  State<AddDescriptions> createState() => _AddDescriptionsState();
}

class _AddDescriptionsState extends State<AddDescriptions> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitdata() {
    String titleControllerText = titleController.text;
    int amountControllerText = int.parse(amountController.text);
    if (titleControllerText.isEmpty ||
        amountControllerText.toString().isEmpty) {
      return;
    }
    titleController.clear();
    amountController.clear();
    widget.addDescription(titleControllerText, amountControllerText);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Add description'),
              controller: titleController,
              onSubmitted: (_) => submitdata,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Value'),
              controller: amountController,
              onSubmitted: (_) => submitdata,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10, top: 6, bottom: 4),
              width: 41,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.lightBlue, width: 1.8),
              ),
              child: IconButton(
                onPressed: submitdata,
                icon: const Icon(
                  Icons.check,
                  color: Colors.lightBlue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
