import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 


class EmergencyHotlines extends StatefulWidget {
  const EmergencyHotlines({super.key});

  @override
  State<EmergencyHotlines> createState() => _EmergencyHotlines();
}

class _EmergencyHotlines extends State<EmergencyHotlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Emergency Hotlines ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        elevation: 0,
      ),
       body: Center(child: Padding(
         padding: const EdgeInsets.only(top:28.0, bottom: 20.0),
         child: ScrollableTable(),
       )),

    );
  }
}


class ScrollableTable extends StatelessWidget {
  // Data for the table
  final List<Map<String, String>> locations = [
    {'location': 'Alfonso', 'hotline': '(046) 522-0480'},
    {'location': 'Amadeo', 'hotline': '(046) 890-4985'},
    {'location': 'Bacoor', 'hotline': '(046) 417-6060'},
    {'location': 'Carmona', 'hotline': '(046) 430-6634'},
    {'location': 'Cavite City', 'hotline': '(046) 431-0308'},
    {'location': 'Dasmarinas', 'hotline': '(046) 884-6131'},
    {'location': 'General Mariano Alvarez', 'hotline': '09164473598'},
    {'location': 'General Trias', 'hotline': '(046) 850-9024'},
    {'location': 'Imus', 'hotline': '(046) 416-3032'},
    {'location': 'Indang', 'hotline': '(046) 415-1217'},
    {'location': 'Kawit', 'hotline': '(046) 574-2464'},
    {'location': 'Magallanes', 'hotline': '(046) 412-7374'},
    {'location': 'Maragondon', 'hotline': '(046) 890-2367'},
    {'location': 'Mendez', 'hotline': '(046) 482-0712'},
    {'location': 'Naic', 'hotline': '(046) 412-3774'},
    {'location': 'Noveleta', 'hotline': '(046) 438-5684'},
    {'location': 'Rosario', 'hotline': '(046) 438-1616'},
    {'location': 'Silang', 'hotline': '(046) 414-0484'},
    {'location': 'Tagaytay', 'hotline': '(046) 483-1193'},
    {'location': 'Tanza', 'hotline': '(046) 505-6084'},
    {'location': 'Trece Martires', 'hotline': '(046) 419-0057'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20, // Optional: Adjust the spacing between columns
          columns: const [
            DataColumn(
              label: Text(
                'Location',
                style: TextStyle(
                  fontSize: 20.0, // Increase the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(18, 43, 29, 1),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Hotline',
                style: TextStyle(
                  fontSize: 20.0, // Increase the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(18, 43, 29, 1),
                ),
              ),
            ),

          ],
          rows: locations.map((location) {
            return DataRow(cells: [
              DataCell(Container(
                height: 60, // Set height of the cell
                child: Row(
                  children: [
                    Icon(Icons.location_on), // Location icon
                    SizedBox(width: 10),
                    Text(location['location'] ?? ''),
                  ],
                ),
              )),
              DataCell(Container(
                height: 20, // Set height of the cell
                child: Text(location['hotline'] ?? ''),
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}