import 'package:flutter/material.dart';

class NotasScreen extends StatefulWidget {
  @override
  _NotasScreenState createState() => _NotasScreenState();
}

class _NotasScreenState extends State<NotasScreen> {
  // Lista de notas (puedes reemplazarla con datos reales)
  List<Map<String, dynamic>> _notas = [];

  // Controladores para los campos de texto
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  // Función para agregar una nueva nota
  void _addNota() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final price = double.tryParse(_priceController.text.trim());

    if (title.isNotEmpty && description.isNotEmpty && price != null) {
      setState(() {
        _notas.add({'title': title, 'description': description, 'price': price});
      });
      _titleController.clear();
      _descriptionController.clear();
      _priceController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Notas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24, // Tamaño de fuente para el título
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campos para agregar una nueva nota
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título de la nota'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción de la nota'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNota,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 8,
              ),
              child: Text(
                'Agregar Nota',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Lista de notas
            Expanded(
              child: ListView.builder(
                itemCount: _notas.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        _notas[index]['title'],
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        _notas[index]['description'],
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                        '\$${_notas[index]['price'].toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        // Al tocar una nota, ir a la pantalla de detalle
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotaDetailScreen(nota: _notas[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotaDetailScreen extends StatelessWidget {
  final Map<String, dynamic> nota;

  NotaDetailScreen({required this.nota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle de la Nota',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${nota['title']}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Descripción: ${nota['description']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Precio: \$${nota['price'].toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
