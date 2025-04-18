
import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';

class PaginationExamples extends StatefulWidget {
  const PaginationExamples({super.key});

  @override
  State<PaginationExamples> createState() => _PaginationExamplesState();
}

class _PaginationExamplesState extends State<PaginationExamples> {
  int basicPage = 1;
  int changerPage = 1;
  int jumperPage = 2;
  int totalInfoPage = 1;
  int allOptionsPage = 1;
  int miniPage = 2;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Basic Pagination", style: TextStyle(fontWeight: FontWeight.bold)),
              CommonPagination(
                currentPage: basicPage,
                totalPages: 50,
                pageSize: 10,
                onPageChanged: (page) => setState(() {
                  basicPage = page;
                  print('Basic -> Page: $page');
                }),
              ),
              const SizedBox(height: 24),

              const Text("Pagination with Changer (Page Size Dropdown)", style: TextStyle(fontWeight: FontWeight.bold)),
              CommonPagination(
                currentPage: changerPage,
                totalPages: 50,
                pageSize: 10,
                showPageSizeChanger: true,
                onPageChanged: (page) => setState(() {
                  changerPage = page;
                  print('Changer -> Page: $page');
                }),
              ),
              const SizedBox(height: 24),

              const Text("Pagination with Jumper", style: TextStyle(fontWeight: FontWeight.bold)),
              CommonPagination(
                currentPage: jumperPage,
                totalPages: 50,
                pageSize: 10,
                showJumper: true,
                onPageChanged: (page) => setState(() {
                  jumperPage = page;
                  print('Jumper -> Page: $page');
                }),
              ),
              const SizedBox(height: 24),

              const Text("Pagination with Total Info", style: TextStyle(fontWeight: FontWeight.bold)),
              CommonPagination(
                currentPage: totalInfoPage,
                totalPages: 50,
                pageSize: 10,
                showTotal: true,
                onPageChanged: (page) => setState(() {
                  totalInfoPage = page;
                  print('Total Info -> Page: $page');
                }),
              ),
              const SizedBox(height: 24),

              const Text("Pagination with Changer ++   Jumper + Total", style: TextStyle(fontWeight: FontWeight.bold)),
              CommonPagination(
                currentPage: allOptionsPage,
                totalPages: 50,
                pageSize: 10,
                showPageSizeChanger: true,
                showJumper: true,
                showTotal: true,
                onPageChanged: (page) => setState(() {
                  allOptionsPage = page;
                  print('All Options -> Page: $page');
                }),
              ),
              const SizedBox(height: 24),

              const Text("Mini Size Pagination", style: TextStyle(fontWeight: FontWeight.bold)),
              CommonPagination(
                currentPage: miniPage,
                totalPages: 5,
                pageSize: 10,
                mini: true,
                onPageChanged: (page) => setState(() {
                  miniPage = page;
                  print('Mini -> Page: $page');
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Base pagination widget
class CommonPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final ValueChanged<int> onPageChanged;
  final bool showPageSizeChanger;
  final bool showJumper;
  final bool showTotal;
  final bool mini;

  const CommonPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
    required this.onPageChanged,
    this.showPageSizeChanger = false,
    this.showJumper = false,
    this.showTotal = false,
    this.mini = false,
  });

  Widget pageButton(int page, bool isSelected) => TextButton(
        onPressed: () => onPageChanged(page),
        style: TextButton.styleFrom(
          minimumSize: mini ? Size(30, 30) : Size(40, 40),
          backgroundColor: isSelected ? Colors.blue.shade100 : null,
        ),
        child: Text(
          '$page',
          style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontSize: mini ? 12 : 14),
        ),
      );

  List<Widget> buildPages() {
    List<Widget> buttons = [];
    int start = (currentPage - 2).clamp(1, totalPages);
    int end = (currentPage + 2).clamp(1, totalPages);

    if (start > 1) buttons.add(const Text('...'));

    for (int i = start; i <= end; i++) {
      buttons.add(pageButton(i, i == currentPage));
    }

    if (end < totalPages) buttons.add(const Text('...'));

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        ...buildPages(),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
        if (showPageSizeChanger)
          DropdownButton<int>(
            value: pageSize,
            items: [10, 20, 30, 50]
                .map((e) => DropdownMenuItem(value: e, child: Text("$e / page")))
                .toList(),
            onChanged: (val) {},
          ),
        if (showJumper)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Go to"),
              const SizedBox(width: 4),
              SizedBox(
                width: 50,
                child: TextField(
                  onSubmitted: (val) {
                    final page = int.tryParse(val);
                    if (page != null && page > 0 && page <= totalPages) {
                      onPageChanged(page);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        if (showTotal) Text("Total $totalPages pages"),
      ],
    );
  }
}
