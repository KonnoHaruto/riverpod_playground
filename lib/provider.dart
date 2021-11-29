import 'package:flutter_riverpod/flutter_riverpod.dart';


// 外部からは変更できない値を公開できる基本的なProvider.
// 内部からは変更可能。
final appNameProvider = Provider((ref) => 'My Todo');


// 外部から変更可能な値を公開できるProvider.
// 現在選択されているアイテムやフィルタリングの状態など、
// 単純な状態を保持するのに適している。
final counterProvider = StateProvider((ref) => 0);