import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Mahasiswa"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // =========================
            // CONTAINER 1
            // =========================
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.blue[100],
              child: const Text(
                "Selamat Datang",
                textAlign: TextAlign.center,
              ),
            ),

            // =========================
            // CONTAINER 2
            // =========================
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.green[100],
              child: const Text(
                "Sistem Informasi Mahasiswa",
                textAlign: TextAlign.center,
              ),
            ),

            // =========================
            // ROW 1
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.orange[200],
                  child: const Text("Menu 1"),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.orange[300],
                  child: const Text("Menu 2"),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // =========================
            // ROW 2
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.purple[200],
                  child: const Text("Menu 3"),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.purple[300],
                  child: const Text("Menu 4"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =========================
            // STACK 1
            // =========================
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.grey[300],
                ),
                const Text("Stack 1"),
              ],
            ),

            const SizedBox(height: 15),

            // =========================
            // STACK 2
            // =========================
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.grey[400],
                ),
                const Text("Stack 2"),
              ],
            ),

            const SizedBox(height: 20),

            // =========================
            // GRIDVIEW (min 2 item)
            // =========================
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                children: const [
                  Card(
                    child: Center(child: Text("Grid 1")),
                  ),
                  Card(
                    child: Center(child: Text("Grid 2")),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // LISTVIEW (min 2 item)
            // =========================
            SizedBox(
              height: 150,
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Andi"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Budi"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // COLUMN 2 (Column di dalam Column)
            // =========================
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.teal[100],
                  child: const Text("Column Kedua - 1"),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.teal[200],
                  child: const Text("Column Kedua - 2"),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}