import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Dark Brown Background - SaddleBrown
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ----------------------------------------------------
            // HEADER SECTION - Light Brown Card
            // ----------------------------------------------------
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent, // Light Brown - BurlyWood
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // 9:41 and Signal
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '9:41',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.signal_cellular_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Available Balance
                      const Text(
                        'Available Balance',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '\$12,253.70',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // MONEY SPEND CARD - Light Brown Container
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5DEB3), // Wheat - Light Brown
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Money Spend Row
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD2691E).withOpacity(0.2), // Chocolate with opacity
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.trending_up,
                                    color: Color(0xFF8B4513), // SaddleBrown
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Money Spend',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF8B4513), // SaddleBrown
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      '\$6,234.00',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5D3A1A), // Dark Brown
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),

                                // Yellow Container
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFC107), // Yellow
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '3.2%',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // BLACK BACKGROUND GRAPH
                            Container(
                              height: 200,
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF000000), // Pure black
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Graph Title
                                  const Text(
                                    'Money Spend',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFCCCCCC), // Light grey
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '\$6,234.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Bar Chart
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        // Y-Axis Labels
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: const [
                                            Text('\$100', style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 11)),
                                            Text('\$50', style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 11)),
                                            Text('\$0', style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 11)),
                                          ],
                                        ),
                                        const SizedBox(width: 12),

                                        // Bars
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              _buildBar(label: 'Mon', height: 0.7),
                                              _buildBar(label: 'Tue', height: 0.5),
                                              _buildBar(label: 'Wed', height: 0.9),
                                              _buildBar(label: 'Thu', height: 0.6),
                                              _buildBar(label: 'Fri', height: 0.8),
                                              _buildBar(label: 'Sat', height: 0.4),
                                              _buildBar(label: 'Sun', height: 0.65),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // My Saving Plans Header
                      const Text(
                        'My Saving Plans',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // SAVING PLANS CARDS - Light Brown
                      Row(
                        children: [
                          Expanded(
                            child: _buildSavingPlanCard(
                              title: 'New Car',
                              amount: '\$5,000.00',
                              icon: Icons.directions_car,
                              color: const Color(0xFFCD853F), // Peru - Brown shade
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSavingPlanCard(
                              title: 'New Home',
                              amount: '\$5,000.00',
                              icon: Icons.home,
                              color: const Color(0xFFB8860B), // DarkGoldenrod - Brown shade
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSavingPlanCard(
                              title: 'New Cloth',
                              amount: '\$5,000.00',
                              icon: Icons.shopping_bag,
                              color: const Color(0xFFA0522D), // Sienna - Brown shade
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            // ----------------------------------------------------
            // RECENT TRANSACTIONS HEADER
            // ----------------------------------------------------
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: const [
                    Icon(
                      Icons.history,
                      size: 24,
                      color: Colors.white70, // White for dark background
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White for dark background
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ----------------------------------------------------
            // TRANSACTION CARDS - Light Brown
            // ----------------------------------------------------
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildTransactionCard(
                    title: 'Receive',
                    subtitle: 'Fiver International',
                    amount: '\$100.00',
                    time: '12:00pm',
                    icon: Icons.arrow_downward,
                    iconColor: const Color(0xFF2E7D32), // Dark Green
                  ),
                  const SizedBox(height: 12),
                  _buildTransactionCard(
                    title: 'Transfer',
                    subtitle: 'Fiver International',
                    amount: '\$50.00',
                    time: '12:00pm',
                    icon: Icons.arrow_upward,
                    iconColor: const Color(0xFFC62828), // Dark Red
                  ),
                  const SizedBox(height: 12),
                  _buildTransactionCard(
                    title: 'New Car',
                    subtitle: 'Saving Plan',
                    amount: '\$5,000.',
                    time: 'Pending',
                    icon: Icons.directions_car,
                    iconColor: const Color(0xFFCD853F), // Peru
                  ),
                  const SizedBox(height: 12),
                  _buildTransactionCard(
                    title: 'New Home',
                    subtitle: 'Saving Plan',
                    amount: '\$5,000.',
                    time: 'Pending',
                    icon: Icons.home,
                    iconColor: const Color(0xFFB8860B), // DarkGoldenrod
                  ),
                  const SizedBox(height: 12),
                  _buildTransactionCard(
                    title: 'New Cloth',
                    subtitle: 'Saving Plan',
                    amount: '\$5,000.',
                    time: 'Pending',
                    icon: Icons.shopping_bag,
                    iconColor: const Color(0xFFA0522D), // Sienna
                  ),
                  const SizedBox(height: 30),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BAR BUILDER
  Widget _buildBar({required String label, required double height}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bar
          Container(
            height: 70 * height,
            width: 14,
            decoration: BoxDecoration(
              color: const Color(0xFFD2B48C), // Tan - Light Brown bars
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(height: 8),
          // Label
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFCCCCCC), // Light grey
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // SAVING PLAN CARD - Light Brown
  Widget _buildSavingPlanCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5DEB3), // Wheat - Light Brown
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5D3A1A), // Dark Brown
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF8B4513), // SaddleBrown
            ),
          ),
        ],
      ),
    );
  }

  // TRANSACTION CARD - Light Brown
  Widget _buildTransactionCard({
    required String title,
    required String subtitle,
    required String amount,
    required String time,
    required IconData icon,
    required Color iconColor,
  }) {
    // Determine amount color based on transaction type
    Color amountColor;
    if (title == 'Receive') {
      amountColor = const Color(0xFF2E7D32); // Dark Green
    } else if (title == 'Transfer') {
      amountColor = const Color(0xFFC62828); // Dark Red
    } else {
      amountColor = const Color(0xFF5D3A1A); // Dark Brown for others
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5DEB3), // Wheat - Light Brown
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
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
                    color: Color(0xFF5D3A1A), // Dark Brown
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8B4513), // SaddleBrown
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA0522D), // Sienna
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}