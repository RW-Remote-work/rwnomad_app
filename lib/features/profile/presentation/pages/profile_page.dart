import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/datasources/auth_remote_source.dart';
import '../../../auth/state/auth_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
    final isLoggedIn = authState.isLoggedIn;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('profile'.tr())),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: isLoggedIn
                  ? Column(
                      children: [
                        _AvatarWidget(user: user),
                        const SizedBox(height: 12),
                        Text(
                          user?.displayName ?? user?.email ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        if (user?.email != null) ...[
                          const SizedBox(height: 4),
                          Text(user!.email!,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                        if (user?.membershipType != null) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.purple50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              user!.membershipType!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue100,
                              ),
                            ),
                          ),
                        ],
                      ],
                    )
                  : Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.grey10,
                          child: Icon(Icons.person, size: 40,
                              color: AppColors.grey400),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context.go('/login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 36),
                          ),
                          child: Text('login'.tr()),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 8),
            // Menu items
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  if (isLoggedIn) ...[
                    _MenuItem(
                      icon: Icons.work_history,
                      title: 'appliedJobs'.tr(),
                      onTap: () => context.push('/profile/applied'),
                    ),
                    const Divider(height: 1, indent: 56),
                    _MenuItem(
                      icon: Icons.favorite_border,
                      title: 'favorites'.tr(),
                      onTap: () => context.go('/favorites'),
                    ),
                    const Divider(height: 1, indent: 56),
                  ],
                  _MenuItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'privacyPolicy'.tr(),
                    onTap: () => _launchUrl('https://www.rwnomad.com/privacy'),
                  ),
                  const Divider(height: 1, indent: 56),
                  _MenuItem(
                    icon: Icons.description_outlined,
                    title: 'termsOfService'.tr(),
                    onTap: () => _launchUrl('https://www.rwnomad.com/term'),
                  ),
                  const Divider(height: 1, indent: 56),
                  _LanguageSwitch(),
                  if (isLoggedIn) ...[
                    const Divider(height: 1, indent: 56),
                    _MenuItem(
                      icon: Icons.logout,
                      title: 'logOut'.tr(),
                      onTap: () => _showLogoutDialog(context, ref),
                      textColor: Colors.red,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('confirmLogout'.tr()),
        content: Text('logoutDescription'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('cancel'.tr()),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await ref.read(authNotifierProvider.notifier).logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
            child: Text('logOut'.tr(),
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _AvatarWidget extends ConsumerStatefulWidget {
  final dynamic user;
  const _AvatarWidget({required this.user});

  @override
  ConsumerState<_AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends ConsumerState<_AvatarWidget> {
  final _picker = ImagePicker();
  String? _localAvatarPath;

  Future<void> _pickAndUpload() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 512,
    );
    if (picked == null) return;

    setState(() => _localAvatarPath = picked.path);

    try {
      final source = ref.read(authRemoteSourceProvider);
      final url = await source.uploadAvatar(picked.path);
      if (url.isNotEmpty && mounted) {
        // Refresh profile to get updated avatarUrl
        ref.read(authNotifierProvider.notifier).refreshProfile();
      }
    } catch (_) {
      if (mounted) {
        setState(() => _localAvatarPath = null);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('error'.tr())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickAndUpload,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.grey10,
            backgroundImage: _localAvatarPath != null
                ? FileImage(File(_localAvatarPath!))
                : widget.user?.avatarUrl != null
                    ? NetworkImage(widget.user!.avatarUrl!)
                    : null,
            child: (_localAvatarPath == null && widget.user?.avatarUrl == null)
                ? Text(
                    (widget.user?.displayName ??
                            widget.user?.email ??
                            '?')[0]
                        .toUpperCase(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey500,
                    ),
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.grey800,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.camera_alt,
                  size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    final isZh = currentLocale.languageCode == 'zh';

    return ListTile(
      leading: const Icon(Icons.language, color: AppColors.grey500),
      title: Text('language'.tr(),
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          )),
      trailing: SegmentedButton<String>(
        segments: const [
          ButtonSegment(value: 'en', label: Text('EN')),
          ButtonSegment(value: 'zh', label: Text('中')),
        ],
        selected: {isZh ? 'zh' : 'en'},
        onSelectionChanged: (selection) {
          final lang = selection.first;
          context.setLocale(Locale(lang));
        },
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? AppColors.grey500),
      title: Text(title,
          style: TextStyle(
            color: textColor ?? AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          )),
      trailing: const Icon(Icons.chevron_right, color: AppColors.grey300),
      onTap: onTap,
    );
  }
}
