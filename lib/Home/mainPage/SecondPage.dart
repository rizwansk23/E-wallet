import 'package:flutter/material.dart';



class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ----------------------------------------------------
            // PAGE 1 - Hello + Balance + Spending Graph + Recent Transactions
            // ----------------------------------------------------
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Header with 9:41 and Profile
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '9:41',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Hello User
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Hello, Ali Husni 👋',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Available Balance
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Available Balance',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '\$12,253.70',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // SPENDING CARD WITH GRAPH ON RIGHT
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Left Side - Spending Info
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total Spending',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Text(
                                        '\$6,234.00',
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.amber.shade400,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_upward,
                                              color: Colors.black,
                                              size: 12,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              '3.2%',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Right Side - Mini Graph
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildMiniBar(height: 0.9, color: Colors.blue.shade300),
                                    _buildMiniBar(height: 0.5, color: Colors.blue.shade300),
                                    _buildMiniBar(height: 0.7, color: Colors.blue.shade300),
                                    _buildMiniBar(height: 0.4, color: Colors.blue.shade300),
                                    _buildMiniBar(height: 0.8, color: Colors.blue.shade600),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Recent Transactions Header
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Recent Transactions List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _buildTransactionItem(
                            icon: Icons.language,
                            iconColor: Colors.blue,
                            title: 'Fiver International',
                            subtitle: '12:00pm • Online Service',
                            amount: '\$100.00',
                            isPositive: true,
                          ),
                          const SizedBox(height: 12),
                          _buildTransactionItem(
                            icon: Icons.shopping_cart,
                            iconColor: Colors.orange,
                            title: 'Amazon Shop',
                            subtitle: '09:30am • Shopping',
                            amount: '\$50.00',
                            isPositive: false,
                          ),
                          const SizedBox(height: 12),
                          _buildTransactionItem(
                            icon: Icons.flight,
                            iconColor: Colors.purple,
                            title: 'Vacation',
                            subtitle: 'Yesterday • Travel',
                            amount: '\$5,000.00',
                            isPositive: false,
                          ),
                          const SizedBox(height: 12),
                          _buildTransactionItem(
                            icon: Icons.restaurant,
                            iconColor: Colors.green,
                            title: 'Restaurant',
                            subtitle: 'Yesterday • Dinner',
                            amount: '\$45.50',
                            isPositive: false,
                          ),
                          const SizedBox(height: 12),
                          _buildTransactionItem(
                            icon: Icons.directions_car,
                            iconColor: Colors.blue,
                            title: 'Uber',
                            subtitle: '2 days ago • Transport',
                            amount: '\$25.00',
                            isPositive: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // ----------------------------------------------------
            // PAGE 2 - MY SAVING PLANS (Scroll karne par dikhega)
            // ----------------------------------------------------
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.savings,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'My Saving Plans',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // 🔥 FIXED: Pass context to the function
                    _buildSavingPlanCard(
                      context: context,
                      title: 'New Car',
                      amount: '\$5,000.00',
                      saved: '\$2,350.00',
                      progress: 0.47,
                      icon: Icons.directions_car,
                      color: Colors.orange,
                    ),

                    const SizedBox(height: 16),

                    _buildSavingPlanCard(
                      context: context,
                      title: 'New Home',
                      amount: '\$5,000.00',
                      saved: '\$1,800.00',
                      progress: 0.36,
                      icon: Icons.home,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 16),

                    _buildSavingPlanCard(
                      context: context,
                      title: 'New Cloth',
                      amount: '\$5,000.00',
                      saved: '\$3,200.00',
                      progress: 0.64,
                      icon: Icons.shopping_bag,
                      color: Colors.purple,
                    ),

                    const SizedBox(height: 16),

                    _buildSavingPlanCard(
                      context: context,
                      title: 'Vacation',
                      amount: '\$3,000.00',
                      saved: '\$1,500.00',
                      progress: 0.5,
                      icon: Icons.flight,
                      color: Colors.green,
                    ),

                    const SizedBox(height: 16),

                    _buildSavingPlanCard(
                      context: context,
                      title: 'Emergency Fund',
                      amount: '\$10,000.00',
                      saved: '\$4,500.00',
                      progress: 0.45,
                      icon: Icons.security,
                      color: Colors.red,
                    ),

                    const SizedBox(height: 40),

                    // Savings Tips
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade400,
                            Colors.blue.shade600,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.lightbulb,
                                color: Colors.amber,
                                size: 28,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Savings Tip',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Save 20% of your monthly income to reach your goals faster!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mini Bar for Graph
  Widget _buildMiniBar({required double height, required Color color}) {
    return Container(
      width: 8,
      height: 50 * height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color,
            color.withOpacity(0.6),
          ],
        ),
      ),
    );
  }

  // Transaction Item Widget
  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required bool isPositive,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 FIXED: Saving Plan Card Widget with context parameter
  Widget _buildSavingPlanCard({
    required BuildContext context,
    required String title,
    required String amount,
    required String saved,
    required double progress,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Target: $amount',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                saved,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Progress Bar - FIXED: context issue solved
          Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: 8,
                // FIXED: Using MediaQuery with passed context
                width: MediaQuery.of(context).size.width * 0.7 * progress,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color,
                      color.withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Progress Percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saved: $saved',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}