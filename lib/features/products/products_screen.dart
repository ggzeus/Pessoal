import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/async_state_view.dart';
import '../../core/widgets/section_card.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/providers.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _categoryController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _imageController = TextEditingController();
  final _servingSizeController = TextEditingController();
  final _servingUnitController = TextEditingController(text: 'g');
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbohydratesController = TextEditingController();
  final _sugarsController = TextEditingController();
  final _totalFatController = TextEditingController();
  final _saturatedFatController = TextEditingController();
  final _transFatController = TextEditingController();
  final _fiberController = TextEditingController();
  final _sodiumController = TextEditingController();
  final _saltController = TextEditingController();
  final _cholesterolController = TextEditingController();
  final _potassiumController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _notesController = TextEditingController();
  final _priceController = TextEditingController();
  final _purchaseLocationController = TextEditingController();

  Product? _editingProduct;
  DateTime? _expiryDate;
  bool _isSaving = false;

  @override
  void dispose() {
    for (final controller in [
      _nameController,
      _brandController,
      _categoryController,
      _barcodeController,
      _imageController,
      _servingSizeController,
      _servingUnitController,
      _caloriesController,
      _proteinController,
      _carbohydratesController,
      _sugarsController,
      _totalFatController,
      _saturatedFatController,
      _transFatController,
      _fiberController,
      _sodiumController,
      _saltController,
      _cholesterolController,
      _potassiumController,
      _ingredientsController,
      _notesController,
      _priceController,
      _purchaseLocationController,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          if (_editingProduct != null)
            TextButton(
              onPressed: _isSaving ? null : _resetForm,
              child: const Text('Novo'),
            ),
        ],
      ),
      body: AsyncStateView(
        value: products,
        builder: (items) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionTitle(
                          title: 'Dados do produto',
                          subtitle: _editingProduct == null
                              ? 'Cadastre um item com informacoes basicas e nutricionais.'
                              : 'Editando ${_editingProduct!.name}',
                        ),
                        const SizedBox(height: 16),
                        _textField(
                          controller: _nameController,
                          label: 'Nome do produto',
                          validator: _requiredText,
                        ),
                        const SizedBox(height: 12),
                        _textField(
                          controller: _brandController,
                          label: 'Marca',
                        ),
                        const SizedBox(height: 12),
                        _textField(
                          controller: _categoryController,
                          label: 'Categoria',
                        ),
                        const SizedBox(height: 12),
                        _textField(
                          controller: _barcodeController,
                          label: 'Codigo de barras',
                        ),
                        const SizedBox(height: 12),
                        _textField(
                          controller: _imageController,
                          label: 'Imagem do produto',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SectionTitle(
                          title: 'Porcao',
                          subtitle:
                              'Defina a referencia usada para os dados nutricionais.',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _numberField(
                                controller: _servingSizeController,
                                label: 'Porcao',
                                required: true,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _textField(
                                controller: _servingUnitController,
                                label: 'Unidade da porcao',
                                validator: _requiredText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SectionTitle(
                          title: 'Informacoes nutricionais',
                          subtitle: 'Todos os valores devem ser nao negativos.',
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _sizedField(
                              child: _numberField(
                                controller: _caloriesController,
                                label: 'Calorias (kcal)',
                                required: true,
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _proteinController,
                                label: 'Proteinas (g)',
                                required: true,
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _carbohydratesController,
                                label: 'Carboidratos (g)',
                                required: true,
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _sugarsController,
                                label: 'Acucares (g)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _totalFatController,
                                label: 'Gorduras totais (g)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _saturatedFatController,
                                label: 'Gorduras saturadas (g)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _transFatController,
                                label: 'Gorduras trans (g)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _fiberController,
                                label: 'Fibras (g)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _sodiumController,
                                label: 'Sodio (mg)',
                                required: true,
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _saltController,
                                label: 'Sal (g)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _cholesterolController,
                                label: 'Colesterol (mg)',
                              ),
                            ),
                            _sizedField(
                              child: _numberField(
                                controller: _potassiumController,
                                label: 'Potassio (mg)',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SectionTitle(
                          title: 'Informacoes extras',
                          subtitle:
                              'Campos opcionais para contexto e acompanhamento.',
                        ),
                        const SizedBox(height: 16),
                        _textField(
                          controller: _ingredientsController,
                          label: 'Ingredientes',
                          maxLines: 3,
                        ),
                        const SizedBox(height: 12),
                        _textField(
                          controller: _notesController,
                          label: 'Observacoes',
                          maxLines: 3,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _numberField(
                                controller: _priceController,
                                label: 'Preco',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _textField(
                                controller: _purchaseLocationController,
                                label: 'Local de compra',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: _pickExpiryDate,
                          icon: const Icon(Icons.event_rounded),
                          label: Text(
                            _expiryDate == null
                                ? 'Definir validade'
                                : 'Validade: ${DateFormat('dd/MM/yyyy').format(_expiryDate!)}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _isSaving ? null : _saveProduct,
                      icon: _isSaving
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save_rounded),
                      label: Text(
                        _editingProduct == null
                            ? 'Salvar produto'
                            : 'Atualizar produto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const _SectionTitle(
              title: 'Produtos cadastrados',
              subtitle:
                  'Toque em um item para editar ou remova os que nao usa mais.',
            ),
            const SizedBox(height: 12),
            if (items.isEmpty)
              const SectionCard(
                child: Text('Ainda nao ha produtos cadastrados.'),
              )
            else
              for (final product in items) ...[
                _ProductListCard(
                  product: product,
                  onEdit: () => _loadProduct(product),
                  onDelete: () => _deleteProduct(product),
                ),
                const SizedBox(height: 10),
              ],
          ],
        ),
      ),
    );
  }

  Future<void> _pickExpiryDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _expiryDate = picked);
    }
  }

  Future<void> _saveProduct() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);
    final repository = ref.read(personalRepositoryProvider);

    try {
      if (_editingProduct == null) {
        await repository.createProduct(
          name: _nameController.text.trim(),
          brand: _nullableText(_brandController),
          category: _nullableText(_categoryController),
          barcode: _nullableText(_barcodeController),
          imagePath: _nullableText(_imageController),
          servingSize: _parseRequiredNumber(_servingSizeController),
          servingUnit: _servingUnitController.text.trim(),
          calories: _parseRequiredNumber(_caloriesController),
          protein: _parseRequiredNumber(_proteinController),
          carbohydrates: _parseRequiredNumber(_carbohydratesController),
          sugars: _parseNumber(_sugarsController),
          totalFat: _parseNumber(_totalFatController),
          saturatedFat: _parseNumber(_saturatedFatController),
          transFat: _parseNumber(_transFatController),
          fiber: _parseNumber(_fiberController),
          sodium: _parseRequiredNumber(_sodiumController),
          salt: _parseNumber(_saltController),
          cholesterol: _parseNullableNumber(_cholesterolController),
          potassium: _parseNullableNumber(_potassiumController),
          ingredients: _nullableText(_ingredientsController),
          notes: _nullableText(_notesController),
          price: _parseNullableNumber(_priceController),
          purchaseLocation: _nullableText(_purchaseLocationController),
          expiryDate: _expiryDate,
        );
      } else {
        await repository.updateProduct(
          product: _editingProduct!,
          name: _nameController.text.trim(),
          brand: _nullableText(_brandController),
          category: _nullableText(_categoryController),
          barcode: _nullableText(_barcodeController),
          imagePath: _nullableText(_imageController),
          servingSize: _parseRequiredNumber(_servingSizeController),
          servingUnit: _servingUnitController.text.trim(),
          calories: _parseRequiredNumber(_caloriesController),
          protein: _parseRequiredNumber(_proteinController),
          carbohydrates: _parseRequiredNumber(_carbohydratesController),
          sugars: _parseNumber(_sugarsController),
          totalFat: _parseNumber(_totalFatController),
          saturatedFat: _parseNumber(_saturatedFatController),
          transFat: _parseNumber(_transFatController),
          fiber: _parseNumber(_fiberController),
          sodium: _parseRequiredNumber(_sodiumController),
          salt: _parseNumber(_saltController),
          cholesterol: _parseNullableNumber(_cholesterolController),
          potassium: _parseNullableNumber(_potassiumController),
          ingredients: _nullableText(_ingredientsController),
          notes: _nullableText(_notesController),
          price: _parseNullableNumber(_priceController),
          purchaseLocation: _nullableText(_purchaseLocationController),
          expiryDate: _expiryDate,
        );
      }

      ref.invalidate(productsProvider);
      ref.invalidate(dashboardProvider);
      _resetForm();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produto cadastrado com sucesso.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _deleteProduct(Product product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir produto'),
        content: Text('Deseja remover ${product.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      return;
    }

    await ref.read(personalRepositoryProvider).deleteProduct(product);
    ref.invalidate(productsProvider);
    if (_editingProduct?.id == product.id) {
      _resetForm();
    }
  }

  void _loadProduct(Product product) {
    setState(() {
      _editingProduct = product;
      _expiryDate = product.expiryDate;
      _nameController.text = product.name;
      _brandController.text = product.brand ?? '';
      _categoryController.text = product.category ?? '';
      _barcodeController.text = product.barcode ?? '';
      _imageController.text = product.imagePath ?? '';
      _servingSizeController.text = _numberToText(product.servingSize);
      _servingUnitController.text = product.servingUnit;
      _caloriesController.text = _numberToText(product.calories);
      _proteinController.text = _numberToText(product.protein);
      _carbohydratesController.text = _numberToText(product.carbohydrates);
      _sugarsController.text = _numberToText(product.sugars);
      _totalFatController.text = _numberToText(product.totalFat);
      _saturatedFatController.text = _numberToText(product.saturatedFat);
      _transFatController.text = _numberToText(product.transFat);
      _fiberController.text = _numberToText(product.fiber);
      _sodiumController.text = _numberToText(product.sodium);
      _saltController.text = _numberToText(product.salt);
      _cholesterolController.text = product.cholesterol == null
          ? ''
          : _numberToText(product.cholesterol!);
      _potassiumController.text = product.potassium == null
          ? ''
          : _numberToText(product.potassium!);
      _ingredientsController.text = product.ingredients ?? '';
      _notesController.text = product.notes ?? '';
      _priceController.text = product.price == null
          ? ''
          : _numberToText(product.price!);
      _purchaseLocationController.text = product.purchaseLocation ?? '';
    });
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _editingProduct = null;
      _expiryDate = null;
    });
    for (final controller in [
      _nameController,
      _brandController,
      _categoryController,
      _barcodeController,
      _imageController,
      _servingSizeController,
      _caloriesController,
      _proteinController,
      _carbohydratesController,
      _sugarsController,
      _totalFatController,
      _saturatedFatController,
      _transFatController,
      _fiberController,
      _sodiumController,
      _saltController,
      _cholesterolController,
      _potassiumController,
      _ingredientsController,
      _notesController,
      _priceController,
      _purchaseLocationController,
    ]) {
      controller.clear();
    }
    _servingUnitController.text = 'g';
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    bool required = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) => _validateNumber(value, required: required),
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _sizedField({required Widget child}) {
    return SizedBox(width: 220, child: child);
  }

  String? _requiredText(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? _validateNumber(String? value, {required bool required}) {
    if (value == null || value.trim().isEmpty) {
      return required ? 'Campo obrigatorio' : null;
    }
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) {
      return 'Digite um numero valido';
    }
    if (parsed < 0) {
      return 'Valores negativos nao sao permitidos';
    }
    return null;
  }

  String? _nullableText(TextEditingController controller) {
    final text = controller.text.trim();
    return text.isEmpty ? null : text;
  }

  double _parseRequiredNumber(TextEditingController controller) {
    return double.parse(controller.text.replaceAll(',', '.'));
  }

  double _parseNumber(TextEditingController controller) {
    final text = controller.text.trim();
    if (text.isEmpty) {
      return 0;
    }
    return double.parse(text.replaceAll(',', '.'));
  }

  double? _parseNullableNumber(TextEditingController controller) {
    final text = controller.text.trim();
    if (text.isEmpty) {
      return null;
    }
    return double.parse(text.replaceAll(',', '.'));
  }

  String _numberToText(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1);
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}

class _ProductListCard extends StatelessWidget {
  const _ProductListCard({
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  final Product product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_rounded),
                tooltip: 'Editar',
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline_rounded),
                tooltip: 'Excluir',
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${product.brand ?? 'Sem marca'} - ${product.category ?? 'Sem categoria'}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _chip('Porcao', '${product.servingSize}${product.servingUnit}'),
              _chip('Calorias', '${product.calories} kcal'),
              _chip('Proteinas', '${product.protein} g'),
              _chip('Carboidratos', '${product.carbohydrates} g'),
              _chip('Sodio', '${product.sodium} mg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF17202B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF243244)),
      ),
      child: Text('$label: $value'),
    );
  }
}
