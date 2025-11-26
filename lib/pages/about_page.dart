import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:my_portfolio/constants/size.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Back Button
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff101030),
                    const Color(0xff003344),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 24),
                color: CustomColor.whitePrimary,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'About Me',
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop =
                    MediaQuery.of(context).size.width >= kMinDesktopWidth;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80.0 : 20.0,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Section
                      _buildHeroSection(isDesktop),
                      const SizedBox(height: 60),

                      // Info Cards
                      _buildInfoCards(isDesktop),
                      const SizedBox(height: 60),

                      // Journey Section
                      _buildJourneySection(isDesktop),
                      const SizedBox(height: 60),

                      // Certificates & Awards Section
                      _buildCertificatesAndAwards(isDesktop),
                      const SizedBox(height: 80),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff101030),
            Color(0xff003344),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.quaternaryColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.quaternaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '👋 Hello!',
                  style: TextStyle(
                    color: AppColors.quaternaryColor,
                    fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'I\'m Ahmed Mo. Elessawy',
            style: TextStyle(
              color: CustomColor.whitePrimary,
              fontSize: isDesktop ? 32 : 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          SelectableText(
            'A 16 yo Developer passionate about crafting beautiful and functional digital experiences. With a strong foundation in Flutter and a keen eye for design, I strive to build applications that not only look great but also provide seamless user experiences.',
            style: TextStyle(
              color: CustomColor.whiteSecondary,
              fontSize: isDesktop ? 18 : 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards(bool isDesktop) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        _buildInfoCard(
          icon: Icons.code_rounded,
          title: 'Experience',
          description: '4 Years',
          color: AppColors.tertiaryColor,
          isDesktop: isDesktop,
        ),
        _buildInfoCard(
          icon: Icons.work_outline_rounded,
          title: 'Projects',
          description: '10+ Completed',
          color: AppColors.secondaryColor,
          isDesktop: isDesktop,
        ),
        _buildInfoCard(
          icon: Icons.emoji_events_rounded,
          title: 'Achievements',
          description: '15+ Awards',
          color: AppColors.tertiaryColor,
          isDesktop: isDesktop,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required bool isDesktop,
  }) {
    return Container(
      width: isDesktop ? 250 : double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: AppColors.quaternaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: CustomColor.whitePrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: CustomColor.whiteSecondary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneySection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Journey',
          style: TextStyle(
            color: CustomColor.whitePrimary,
            fontSize: isDesktop ? 32 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.quaternaryColor,
                AppColors.quaternaryColor.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 32),
        _buildJourneyItem(
          year: '2018',
          title: 'Started Learning',
          description:
              'Began my journey into software development and fell in love with creating digital solutions.',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 24),
        _buildJourneyItem(
          year: '2020',
          title: 'First Professional Role',
          description:
              'Joined a tech startup where I honed my skills in full-stack development and team collaboration.',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 24),
        _buildJourneyItem(
          year: '2023',
          title: 'Freelance Success',
          description:
              'Launched my freelance career, working with clients worldwide on diverse and exciting projects.',
          isDesktop: isDesktop,
        ),
      ],
    );
  }

  Widget _buildJourneyItem({
    required String year,
    required String title,
    required String description,
    required bool isDesktop,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: isDesktop ? 100 : 80,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            year,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.quaternaryColor,
              fontSize: isDesktop ? 18 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontSize: isDesktop ? 20 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: CustomColor.whiteSecondary,
                  fontSize: isDesktop ? 16 : 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCertificatesAndAwards(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certificates & Awards',
          style: TextStyle(
            color: CustomColor.whitePrimary,
            fontSize: isDesktop ? 32 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.quaternaryColor,
                AppColors.quaternaryColor.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 32),

        // Certificates Section
        Text(
          'Certifications',
          style: TextStyle(
            color: CustomColor.whitePrimary,
            fontSize: isDesktop ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildCertificateCard(
              icon: Icons.workspace_premium,
              title: 'Flutter Development',
              issuer: 'Udemy',
              date: '2023',
              color: AppColors.tertiaryColor,
              isDesktop: isDesktop,
            ),
            _buildCertificateCard(
              icon: Icons.verified,
              title: 'Mobile App Development',
              issuer: 'Coursera',
              date: '2022',
              color: AppColors.secondaryColor,
              isDesktop: isDesktop,
            ),
            _buildCertificateCard(
              icon: Icons.school_rounded,
              title: 'UI/UX Design Fundamentals',
              issuer: 'Google',
              date: '2022',
              color: AppColors.tertiaryColor,
              isDesktop: isDesktop,
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Awards Section
        Text(
          'Competition Awards',
          style: TextStyle(
            color: CustomColor.whitePrimary,
            fontSize: isDesktop ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            _buildAwardCard(
              icon: '🥇',
              title: 'First Place - Hackathon 2024',
              description:
                  'Won first place in national coding competition for innovative mobile app solution',
              date: 'Oct 2024',
              isDesktop: isDesktop,
            ),
            const SizedBox(height: 16),
            _buildAwardCard(
              icon: '🏆',
              title: 'Best Design Award',
              description:
                  'Recognized for outstanding UI/UX design in regional developer conference',
              date: 'Aug 2024',
              isDesktop: isDesktop,
            ),
            const SizedBox(height: 16),
            _buildAwardCard(
              icon: '🥈',
              title: 'Second Place - Code Challenge',
              description:
                  'Secured second position in algorithmic problem-solving competition',
              date: 'Jun 2024',
              isDesktop: isDesktop,
            ),
            const SizedBox(height: 16),
            _buildAwardCard(
              icon: '⭐',
              title: 'Innovation Award',
              description:
                  'Awarded for creative approach to solving real-world problems with technology',
              date: 'Mar 2024',
              isDesktop: isDesktop,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCertificateCard({
    required IconData icon,
    required String title,
    required String issuer,
    required String date,
    required Color color,
    required bool isDesktop,
  }) {
    return Container(
      width: isDesktop ? 280 : double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 48,
            color: AppColors.quaternaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: CustomColor.whitePrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                issuer,
                style: TextStyle(
                  color: CustomColor.whiteSecondary,
                  fontSize: 14,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.quaternaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: AppColors.quaternaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAwardCard({
    required String icon,
    required String title,
    required String description,
    required String date,
    required bool isDesktop,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff101030),
            Color(0xff003344),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.quaternaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.quaternaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: CustomColor.whitePrimary,
                          fontSize: isDesktop ? 20 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        date,
                        style: TextStyle(
                          color: AppColors.quaternaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: CustomColor.whiteSecondary,
                    fontSize: isDesktop ? 16 : 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
