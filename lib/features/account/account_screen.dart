import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/transfer/transfer_screen.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = 'account';
  static const String routePath = '/account';

  final AccountModel account;

  const AccountScreen({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Header con degradado y datos del usuario
          _AccountHeader(account: account),
          // Transacciones recientes
          Expanded(child: _RecentTransactions()),
        ],
      ),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _AccountHeader extends StatelessWidget {
  final AccountModel account;

  const _AccountHeader({required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 56, left: 24, right: 24, bottom: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7B5CFA), Color(0xFF5B8DF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          // Back arrow at top left
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 8), // To give space below the back arrow
              // Nombre del usuario
              Text(
                account.fullName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              // Avatar
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(account.avatarUrl),
              ),
              const SizedBox(height: 24),
              // Card con saldo y botón
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Saldo disponible',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          '\$${account.balance.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.push(TransferScreen.routePath, extra: account);
                      },
                      icon: const Icon(Icons.send, color: Color(0xFF7B5CFA)),
                      label: const Text(
                        'Enviar',
                        style: TextStyle(
                          color: Color(0xFF7B5CFA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecentTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transacciones recientes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Ver todas',
                  style: TextStyle(color: Color(0xFF7B5CFA), fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                _TransactionTile(
                  type: TransactionType.received,
                  title: 'Recibido de Carlos',
                  time: 'Hoy, 10:30 AM',
                  amount: 50.00,
                  status: 'Completado',
                ),
                _TransactionTile(
                  type: TransactionType.sent,
                  title: 'Enviado a Laura',
                  time: 'Ayer, 15:45 PM',
                  amount: -120.00,
                  status: 'Completado',
                ),
                _TransactionTile(
                  type: TransactionType.sent,
                  title: 'Enviado a Miguel',
                  time: '12 Jun, 09:15 AM',
                  amount: -75.50,
                  status: 'Completado',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum TransactionType { sent, received }

class _TransactionTile extends StatelessWidget {
  final TransactionType type;
  final String title;
  final String time;
  final double amount;
  final String status;

  const _TransactionTile({
    required this.type,
    required this.title,
    required this.time,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isReceived = type == TransactionType.received;
    final color = isReceived ? Colors.green : Colors.red;
    final icon =
        isReceived ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icono
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          // Información
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
          // Monto y estado
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isReceived ? '+' : ''}\$${amount.abs().toStringAsFixed(2)}',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            label: 'Inicio',
            isActive: false,
            onTap: () => context.go('/'),
          ),
          _NavItem(
            icon: Icons.bar_chart,
            label: 'Actividad',
            isActive: true,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.credit_card,
            label: 'Tarjetas',
            isActive: false,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.person,
            label: 'Perfil',
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF7B5CFA) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF7B5CFA) : Colors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
