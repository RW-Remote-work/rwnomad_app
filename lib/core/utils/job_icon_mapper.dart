import 'package:flutter/material.dart';

/// Matches job class name keywords to representative icons.
IconData classIcon(int? jobClassId, String? className) {
  final name = (className ?? '').toLowerCase();
  if (name.contains('dev') || name.contains('engineer') || name.contains('研发')) return Icons.code;
  if (name.contains('design') || name.contains('video') || name.contains('设计') || name.contains('视频')) return Icons.design_services;
  if (name.contains('market') || name.contains('营销') || name.contains('媒体')) return Icons.campaign;
  if (name.contains('product') || name.contains('operation') || name.contains('产品') || name.contains('运营')) return Icons.manage_accounts;
  if (name.contains('support') || name.contains('service') || name.contains('客服') || name.contains('支持') || name.contains('客户')) return Icons.headset_mic;
  if (name.contains('finance') || name.contains('consult') || name.contains('财务') || name.contains('咨询')) return Icons.attach_money;
  if (name.contains('hr') || name.contains('人') || name.contains('recruit')) return Icons.people;
  if (name.contains('write') || name.contains('content') || name.contains('内容') || name.contains('编辑')) return Icons.edit_note;
  if (name.contains('legal') || name.contains('安全') || name.contains('法务')) return Icons.shield;
  if (name.contains('sale') || name.contains('销售') || name.contains('商务')) return Icons.trending_up;
  if (name.contains('data') || name.contains('数据')) return Icons.analytics;
  if (name.contains('manage') || name.contains('管理') || name.contains('行政')) return Icons.admin_panel_settings;
  // Fallback to ID-based for unknown classes
  return _idBasedIcon(jobClassId);
}

Color iconBgColor(int? jobClassId, String? className) {
  final name = (className ?? '').toLowerCase();
  if (name.contains('dev') || name.contains('engineer') || name.contains('研发')) return const Color(0xFFE3F2FD);
  if (name.contains('design') || name.contains('video') || name.contains('设计') || name.contains('视频')) return const Color(0xFFF3E5F5);
  if (name.contains('market') || name.contains('营销') || name.contains('媒体')) return const Color(0xFFFFF3E0);
  if (name.contains('product') || name.contains('operation') || name.contains('产品') || name.contains('运营')) return const Color(0xFFEDE7F6);
  if (name.contains('support') || name.contains('service') || name.contains('客服') || name.contains('支持') || name.contains('客户')) return const Color(0xFFE0F7FA);
  if (name.contains('finance') || name.contains('consult') || name.contains('财务') || name.contains('咨询')) return const Color(0xFFE8EAF6);
  if (name.contains('hr') || name.contains('人') || name.contains('recruit')) return const Color(0xFFFCE4EC);
  if (name.contains('write') || name.contains('content') || name.contains('内容') || name.contains('编辑')) return const Color(0xFFF9FBE7);
  if (name.contains('legal') || name.contains('安全') || name.contains('法务')) return const Color(0xFFECEFF1);
  if (name.contains('sale') || name.contains('销售') || name.contains('商务')) return const Color(0xFFE8F5E9);
  if (name.contains('data') || name.contains('数据')) return const Color(0xFFFFF3E0);
  if (name.contains('manage') || name.contains('管理') || name.contains('行政')) return const Color(0xFFEFEBE9);
  return _idBasedBgColor(jobClassId);
}

Color iconFgColor(int? jobClassId, String? className) {
  final name = (className ?? '').toLowerCase();
  if (name.contains('dev') || name.contains('engineer') || name.contains('研发')) return const Color(0xFF1976D2);
  if (name.contains('design') || name.contains('video') || name.contains('设计') || name.contains('视频')) return const Color(0xFF7B1FA2);
  if (name.contains('market') || name.contains('营销') || name.contains('媒体')) return const Color(0xFFF57C00);
  if (name.contains('product') || name.contains('operation') || name.contains('产品') || name.contains('运营')) return const Color(0xFF512DA8);
  if (name.contains('support') || name.contains('service') || name.contains('客服') || name.contains('支持') || name.contains('客户')) return const Color(0xFF00838F);
  if (name.contains('finance') || name.contains('consult') || name.contains('财务') || name.contains('咨询')) return const Color(0xFF303F9F);
  if (name.contains('hr') || name.contains('人') || name.contains('recruit')) return const Color(0xFFC2185B);
  if (name.contains('write') || name.contains('content') || name.contains('内容') || name.contains('编辑')) return const Color(0xFF9E9D24);
  if (name.contains('legal') || name.contains('安全') || name.contains('法务')) return const Color(0xFF546E7A);
  if (name.contains('sale') || name.contains('销售') || name.contains('商务')) return const Color(0xFF388E3C);
  if (name.contains('data') || name.contains('数据')) return const Color(0xFFF57C00);
  if (name.contains('manage') || name.contains('管理') || name.contains('行政')) return const Color(0xFF5D4037);
  return _idBasedFgColor(jobClassId);
}

IconData _idBasedIcon(int? jobClassId) {
  switch (jobClassId) {
    case 980533567995904: return Icons.code;
    case 980533567995905: return Icons.design_services;
    case 980533567995906: return Icons.campaign;
    case 980533567995907: return Icons.settings;
    case 980533567995908: return Icons.people;
    case 980533567995909: return Icons.attach_money;
    case 980533567995910: return Icons.headset_mic;
    default: return Icons.work_outline;
  }
}

Color _idBasedBgColor(int? jobClassId) {
  switch (jobClassId) {
    case 980533567995904: return const Color(0xFFE3F2FD);
    case 980533567995905: return const Color(0xFFF3E5F5);
    case 980533567995906: return const Color(0xFFFFF3E0);
    case 980533567995907: return const Color(0xFFE8F5E9);
    case 980533567995908: return const Color(0xFFFCE4EC);
    case 980533567995909: return const Color(0xFFE8EAF6);
    case 980533567995910: return const Color(0xFFE0F7FA);
    default: return const Color(0xFFF2F2F2);
  }
}

Color _idBasedFgColor(int? jobClassId) {
  switch (jobClassId) {
    case 980533567995904: return const Color(0xFF1976D2);
    case 980533567995905: return const Color(0xFF7B1FA2);
    case 980533567995906: return const Color(0xFFF57C00);
    case 980533567995907: return const Color(0xFF388E3C);
    case 980533567995908: return const Color(0xFFC2185B);
    case 980533567995909: return const Color(0xFF303F9F);
    case 980533567995910: return const Color(0xFF00838F);
    default: return const Color(0xFF666666);
  }
}
