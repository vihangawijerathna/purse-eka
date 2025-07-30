import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// App Color Palette
class AppColors {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color secondaryTeal = Color(0xFF0D9488);
  static const Color successGreen = Color(0xFF059669);
  static const Color warningOrange = Color(0xFFEA580C);
  static const Color errorRed = Color(0xFFDC2626);

  // Background Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF1F5F9);

  // Text Colors
  static const Color primaryText = Color(0xFF0F172A);
  static const Color secondaryText = Color(0xFF64748B);
  static const Color mutedText = Color(0xFF94A3B8);

  // Category Colors
  static const Color foodColor = Color(0xFFF97316);
  static const Color transportColor = Color(0xFF3B82F6);
  static const Color shoppingColor = Color(0xFF8B5CF6);
  static const Color billsColor = Color(0xFFEF4444);
  static const Color entertainmentColor = Color(0xFFEC4899);
  static const Color educationColor = Color(0xFF10B981);
  static const Color otherColor = Color(0xFF6B7280);
}

void main() {
  runApp(PurseEkaApp());
}

class PurseEkaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purse Eka',
      theme: ThemeData(
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.cardBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          primary: AppColors.primaryBlue,
          secondary: AppColors.secondaryTeal,
          surface: AppColors.surface,
          background: AppColors.background,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primaryBlue,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColors.cardBackground,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: AppColors.primaryText),
          bodyMedium: TextStyle(fontSize: 16, color: AppColors.primaryText),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LanguageSelectionScreen(),
    );
  }
}

// Language Selection Screen
class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryBlue.withOpacity(0.1),
              AppColors.background,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.account_balance_wallet,
                  size: 80,
                  color: AppColors.primaryBlue,
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Purse Eka',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Smart Expense Tracker',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 48),
              Text(
                'Select Language / භාෂාව තෝරන්න',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _selectLanguage(context, 'en'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'English',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _selectLanguage(context, 'si'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.secondaryTeal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'සිංහල',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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

  void _selectLanguage(BuildContext context, String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(language: language)),
    );
  }
}

// Expense Model
class Expense {
  String id;
  String title;
  double amount;
  String category;
  DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'].toDouble(),
      category: json['category'],
      date: DateTime.parse(json['date']),
    );
  }
}

// Localization Helper
class LocalizationHelper {
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'wallet_balance': 'Wallet Balance',
      'add_expense': 'Add Expense',
      'add_money': 'Add Money',
      'daily_report': 'Daily Report',
      'monthly_report': 'Monthly Report',
      'expense_title': 'Expense Title',
      'amount': 'Amount',
      'category': 'Category',
      'food': 'Food',
      'transport': 'Transport',
      'shopping': 'Shopping',
      'bills': 'Bills',
      'entertainment': 'Entertainment',
      'education': 'Education',
      'other': 'Other',
      'save': 'Save',
      'cancel': 'Cancel',
      'today_expenses': 'Today\'s Expenses',
      'total_spent': 'Total Spent Today',
      'remaining_balance': 'Remaining Balance',
      'add_money_title': 'Add Money to Wallet',
      'enter_amount': 'Enter Amount',
      'no_expenses_today': 'No expenses recorded today',
      'expense_categories': 'Expense Categories',
      'total_expenses': 'Total Expenses',
      'report_for': 'Report for',
    },
    'si': {
      'wallet_balance': 'පර්ස් එකේ තියෙන සල්ලි',
      'add_expense': 'වියදම එක් කරන්න',
      'add_money': 'සල්ලි එක් කරන්න',
      'daily_report': 'දිනපතා වාර්තාව',
      'monthly_report': 'මාසික වාර්තාව',
      'expense_title': 'වියදමේ නම',
      'amount': 'මුදල',
      'category': 'කාණ්ඩය',
      'food': 'ආහාර',
      'transport': 'ප්‍රවාහනය',
      'shopping': 'සාප්පු සවාරි',
      'bills': 'බිල්පත්',
      'entertainment': 'විනෝදාස්වාදය',
      'education': 'අධ්‍යාපනය',
      'other': 'වෙනත්',
      'save': 'සේව් කරන්න',
      'cancel': 'අවලංගු කරන්න',
      'today_expenses': 'අද වියදම්',
      'total_spent': 'අද වියදම් කළ මුළු මුදල',
      'remaining_balance': 'ඉතුරු මුදල',
      'add_money_title': 'පර්ස් එකට සල්ලි එක් කරන්න',
      'enter_amount': 'මුදල ඇතුළත් කරන්න',
      'no_expenses_today': 'අද වියදමක් නැත',
      'expense_categories': 'වියදම් කාණ්ඩ',
      'total_expenses': 'මුළු වියදම්',
      'report_for': 'වාර්තාව',
    },
  };

  static String getText(String key, String language) {
    return _localizedValues[language]?[key] ?? key;
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  final String language;

  HomeScreen({required this.language});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double walletBalance = 0.0;
  List<Expense> todayExpenses = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadWalletBalance();
    await _loadTodayExpenses();
  }

  Future<void> _loadWalletBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      walletBalance = prefs.getDouble('wallet_balance') ?? 0.0;
    });
  }

  Future<void> _loadTodayExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String today = DateFormat('yyyy-MM-dd').format(selectedDate);
    String? expensesJson = prefs.getString('expenses_$today');

    if (expensesJson != null) {
      List<dynamic> expensesList = json.decode(expensesJson);
      setState(() {
        todayExpenses = expensesList.map((e) => Expense.fromJson(e)).toList();
      });
    } else {
      setState(() {
        todayExpenses = [];
      });
    }
  }

  Future<void> _saveWalletBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('wallet_balance', walletBalance);
  }

  Future<void> _saveTodayExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String today = DateFormat('yyyy-MM-dd').format(selectedDate);
    String expensesJson = json.encode(
      todayExpenses.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('expenses_$today', expensesJson);
  }

  double get totalSpentToday {
    return todayExpenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Purse Eka',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LanguageSelectionScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wallet Balance Card
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primaryBlue, AppColors.secondaryTeal],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    LocalizationHelper.getText(
                      'wallet_balance',
                      widget.language,
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Rs. ${walletBalance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Available Balance',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: _showAddExpenseDialog,
                      icon: Icon(Icons.remove_circle_outline, size: 22),
                      label: Text(
                        LocalizationHelper.getText(
                          'add_expense',
                          widget.language,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.warningOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: _showAddMoneyDialog,
                      icon: Icon(Icons.add_circle_outline, size: 22),
                      label: Text(
                        LocalizationHelper.getText(
                          'add_money',
                          widget.language,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.successGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Today's Expenses
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.today,
                            color: AppColors.primaryBlue,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          LocalizationHelper.getText(
                            'today_expenses',
                            widget.language,
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.warningOrange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.warningOrange.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.trending_down,
                            color: AppColors.warningOrange,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${LocalizationHelper.getText('total_spent', widget.language)}: Rs. ${totalSpentToday.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.warningOrange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    todayExpenses.isEmpty
                        ? Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.receipt_long_outlined,
                                  size: 48,
                                  color: AppColors.mutedText,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  LocalizationHelper.getText(
                                    'no_expenses_today',
                                    widget.language,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.mutedText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        : Column(
                          children:
                              todayExpenses.map((expense) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.mutedText.withOpacity(
                                        0.1,
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: _getCategoryColor(
                                        expense.category,
                                      ),
                                      radius: 24,
                                      child: Icon(
                                        _getCategoryIcon(expense.category),
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    title: Text(
                                      expense.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryText,
                                      ),
                                    ),
                                    subtitle: Text(
                                      LocalizationHelper.getText(
                                        expense.category.toLowerCase(),
                                        widget.language,
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryText,
                                      ),
                                    ),
                                    trailing: Text(
                                      'Rs. ${expense.amount.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.warningOrange,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Report Buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => _showDailyReport(),
                      icon: Icon(Icons.today_outlined, size: 20),
                      label: Text(
                        LocalizationHelper.getText(
                          'daily_report',
                          widget.language,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryTeal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => _showMonthlyReport(),
                      icon: Icon(Icons.calendar_month_outlined, size: 20),
                      label: Text(
                        LocalizationHelper.getText(
                          'monthly_report',
                          widget.language,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExpenseDialog() {
    String title = '';
    double amount = 0.0;
    String selectedCategory = 'Food';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                LocalizationHelper.getText('add_expense', widget.language),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: LocalizationHelper.getText(
                        'expense_title',
                        widget.language,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => title = value,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: LocalizationHelper.getText(
                        'amount',
                        widget.language,
                      ),
                      border: OutlineInputBorder(),
                      prefixText: 'Rs. ',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged:
                        (value) => amount = double.tryParse(value) ?? 0.0,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      labelText: LocalizationHelper.getText(
                        'category',
                        widget.language,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items:
                        [
                              'Food',
                              'Transport',
                              'Shopping',
                              'Bills',
                              'Entertainment',
                              'Education',
                              'Other',
                            ]
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  LocalizationHelper.getText(
                                    category.toLowerCase(),
                                    widget.language,
                                  ),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (value) => setState(() => selectedCategory = value!),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    LocalizationHelper.getText('cancel', widget.language),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (title.isNotEmpty && amount > 0) {
                      _addExpense(title, amount, selectedCategory);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    LocalizationHelper.getText('save', widget.language),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showAddMoneyDialog() {
    double amount = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            LocalizationHelper.getText('add_money_title', widget.language),
          ),
          content: TextField(
            decoration: InputDecoration(
              labelText: LocalizationHelper.getText(
                'enter_amount',
                widget.language,
              ),
              border: OutlineInputBorder(),
              prefixText: 'Rs. ',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => amount = double.tryParse(value) ?? 0.0,
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                LocalizationHelper.getText('cancel', widget.language),
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (amount > 0) {
                  _addMoney(amount);
                  Navigator.pop(context);
                }
              },
              child: Text(
                LocalizationHelper.getText('save', widget.language),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  void _addExpense(String title, double amount, String category) {
    final expense = Expense(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      amount: amount,
      category: category,
      date: selectedDate,
    );

    setState(() {
      todayExpenses.add(expense);
      walletBalance -= amount; // Deduct expense amount from wallet balance
    });

    _saveTodayExpenses();
    _saveWalletBalance(); // Save the updated wallet balance
  }

  void _addMoney(double amount) {
    setState(() {
      walletBalance += amount;
    });
    _saveWalletBalance();
  }

  void _showDailyReport() {
    // Calculate category-wise expenses for today
    Map<String, double> categoryTotals = {};
    for (var expense in todayExpenses) {
      categoryTotals[expense.category] =
          (categoryTotals[expense.category] ?? 0.0) + expense.amount;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${LocalizationHelper.getText('daily_report', widget.language)} - ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.maxFinite,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Summary Card
                  Card(
                    color: Colors.blue[50],
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summary',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Total Expenses: Rs. ${totalSpentToday.toStringAsFixed(2)}',
                          ),
                          Text(
                            'Number of Transactions: ${todayExpenses.length}',
                          ),
                          Text(
                            'Wallet Balance: Rs. ${walletBalance.toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Category Breakdown
                  if (categoryTotals.isNotEmpty) ...[
                    Text(
                      'Category Breakdown',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...categoryTotals.entries.map((entry) {
                      double percentage = (entry.value / totalSpentToday) * 100;
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getCategoryColor(entry.key),
                            radius: 20,
                            child: Icon(
                              _getCategoryIcon(entry.key),
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            LocalizationHelper.getText(
                              entry.key.toLowerCase(),
                              widget.language,
                            ),
                          ),
                          subtitle: Text(
                            '${percentage.toStringAsFixed(1)}% of total',
                          ),
                          trailing: Text(
                            'Rs. ${entry.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 16),
                  ],

                  // Individual Expenses
                  Text(
                    'Individual Expenses',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  if (todayExpenses.isEmpty)
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          LocalizationHelper.getText(
                            'no_expenses_today',
                            widget.language,
                          ),
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    )
                  else
                    ...todayExpenses.map((expense) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getCategoryColor(
                              expense.category,
                            ),
                            child: Icon(
                              _getCategoryIcon(expense.category),
                              color: Colors.white,
                            ),
                          ),
                          title: Text(expense.title),
                          subtitle: Text(
                            '${LocalizationHelper.getText(expense.category.toLowerCase(), widget.language)} • ${DateFormat('HH:mm').format(expense.date)}',
                          ),
                          trailing: Text(
                            'Rs. ${expense.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showMonthlyReport() async {
    // Get current month and year
    DateTime now = DateTime.now();

    // Load all expenses for the current month
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Expense> monthlyExpenses = [];
    Map<String, double> dailyTotals = {};
    Map<String, double> categoryTotals = {};

    // Check each day of the current month
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime checkDate = DateTime(now.year, now.month, day);
      String dateKey = DateFormat('yyyy-MM-dd').format(checkDate);
      String? dayExpensesJson = prefs.getString('expenses_$dateKey');

      if (dayExpensesJson != null) {
        List<dynamic> dayExpensesList = json.decode(dayExpensesJson);
        List<Expense> dayExpenses =
            dayExpensesList.map((e) => Expense.fromJson(e)).toList();
        monthlyExpenses.addAll(dayExpenses);

        // Calculate daily total
        double dayTotal = dayExpenses.fold(
          0.0,
          (sum, expense) => sum + expense.amount,
        );
        if (dayTotal > 0) {
          dailyTotals[DateFormat('dd/MM').format(checkDate)] = dayTotal;
        }

        // Calculate category totals
        for (var expense in dayExpenses) {
          categoryTotals[expense.category] =
              (categoryTotals[expense.category] ?? 0.0) + expense.amount;
        }
      }
    }

    double monthlyTotal = monthlyExpenses.fold(
      0.0,
      (sum, expense) => sum + expense.amount,
    );
    double averageDaily = monthlyTotal / now.day; // Average up to current day

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${LocalizationHelper.getText('monthly_report', widget.language)} - ${DateFormat('MMMM yyyy').format(now)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.maxFinite,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Monthly Summary Card
                  Card(
                    color: Colors.green[50],
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly Summary',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Total Monthly Expenses: Rs. ${monthlyTotal.toStringAsFixed(2)}',
                          ),
                          Text('Total Transactions: ${monthlyExpenses.length}'),
                          Text(
                            'Average Daily Spending: Rs. ${averageDaily.toStringAsFixed(2)}',
                          ),
                          Text(
                            'Days with Expenses: ${dailyTotals.length}/${now.day}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Category Breakdown
                  if (categoryTotals.isNotEmpty) ...[
                    Text(
                      'Monthly Category Breakdown',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...categoryTotals.entries.map((entry) {
                      double percentage = (entry.value / monthlyTotal) * 100;
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getCategoryColor(entry.key),
                            radius: 20,
                            child: Icon(
                              _getCategoryIcon(entry.key),
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            LocalizationHelper.getText(
                              entry.key.toLowerCase(),
                              widget.language,
                            ),
                          ),
                          subtitle: Text(
                            '${percentage.toStringAsFixed(1)}% of monthly total',
                          ),
                          trailing: Text(
                            'Rs. ${entry.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 16),
                  ],

                  // Daily Breakdown
                  if (dailyTotals.isNotEmpty) ...[
                    Text(
                      'Daily Spending This Month',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...dailyTotals.entries.map((entry) {
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            color: Colors.blue[600],
                          ),
                          title: Text(entry.key),
                          trailing: Text(
                            'Rs. ${entry.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ] else ...[
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'No expenses recorded this month',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return AppColors.foodColor;
      case 'transport':
        return AppColors.transportColor;
      case 'shopping':
        return AppColors.shoppingColor;
      case 'bills':
        return AppColors.billsColor;
      case 'entertainment':
        return AppColors.entertainmentColor;
      case 'education':
        return AppColors.educationColor;
      default:
        return AppColors.otherColor;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'transport':
        return Icons.directions_car;
      case 'shopping':
        return Icons.shopping_bag;
      case 'bills':
        return Icons.receipt;
      case 'entertainment':
        return Icons.movie;
      case 'education':
        return Icons.school;
      default:
        return Icons.category;
    }
  }
}
