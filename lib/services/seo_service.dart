
class SEOService {
  // Language-specific SEO data
  static const Map<String, Map<String, String>> seoData = {
    'en': {
      'title': 'Sara Baby Tracker & Sounds - Complete Baby Care Companion | Track Sleep, Feeding & Growth',
      'description': 'Track every precious moment with Sara Baby. Complete baby care companion for sleep tracking, feeding schedules, growth monitoring, and soothing sounds. 100% free, forever. Download now!',
      'keywords': 'baby tracker app, baby sleep tracker, feeding tracker, baby growth tracker, baby care app, parenting app, baby sounds, sleep sounds, baby monitoring, newborn tracker, infant care, baby development, parenting tools, baby schedule, baby routine, Flutter app, free baby app',
      'ogTitle': 'Sara Baby Tracker & Sounds - Complete Baby Care Companion',
      'ogDescription': 'Track every precious moment with Sara Baby. Complete baby care companion for sleep tracking, feeding schedules, growth monitoring, and soothing sounds. 100% free, forever.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Complete Baby Care Companion',
      'twitterDescription': 'Track every precious moment with Sara Baby. Complete baby care companion for sleep tracking, feeding schedules, growth monitoring, and soothing sounds. 100% free, forever.',
      'locale': 'en_US',
      'language': 'English',
    },
    'tr': {
      'title': 'Sara Bebek Takipçisi ve Sesler - Kapsamlı Bebek Bakım Arkadaşı | Uyku, Beslenme ve Büyüme Takibi',
      'description': 'Sara Bebek ile her değerli anı takip edin. Uyku takibi, beslenme programları, büyüme izleme ve sakinleştirici sesler için kapsamlı bebek bakım arkadaşı. %100 ücretsiz, sonsuza kadar. Hemen indirin!',
      'keywords': 'bebek takip uygulaması, bebek uyku takipçisi, beslenme takipçisi, bebek büyüme takipçisi, bebek bakım uygulaması, ebeveynlik uygulaması, bebek sesleri, uyku sesleri, bebek izleme, yenidoğan takipçisi, bebek bakımı, bebek gelişimi, ebeveynlik araçları, bebek programı, bebek rutini, Flutter uygulaması, ücretsiz bebek uygulaması',
      'ogTitle': 'Sara Bebek Takipçisi ve Sesler - Kapsamlı Bebek Bakım Arkadaşı',
      'ogDescription': 'Sara Bebek ile her değerli anı takip edin. Uyku takibi, beslenme programları, büyüme izleme ve sakinleştirici sesler için kapsamlı bebek bakım arkadaşı. %100 ücretsiz, sonsuza kadar.',
      'twitterTitle': 'Sara Bebek Takipçisi ve Sesler - Kapsamlı Bebek Bakım Arkadaşı',
      'twitterDescription': 'Sara Bebek ile her değerli anı takip edin. Uyku takibi, beslenme programları, büyüme izleme ve sakinleştirici sesler için kapsamlı bebek bakım arkadaşı. %100 ücretsiz, sonsuza kadar.',
      'locale': 'tr_TR',
      'language': 'Turkish',
    },
    'de': {
      'title': 'Sara Baby Tracker & Sounds - Kompletter Baby-Pflege-Begleiter | Schlaf-, Fütterungs- und Wachstumsverfolgung',
      'description': 'Verfolgen Sie jeden kostbaren Moment mit Sara Baby. Kompletter Baby-Pflege-Begleiter für Schlafverfolgung, Fütterungspläne, Wachstumsüberwachung und beruhigende Klänge. 100% kostenlos, für immer. Jetzt herunterladen!',
      'keywords': 'baby tracker app, baby schlaf tracker, fütterung tracker, baby wachstum tracker, baby pflege app, elternschaft app, baby sounds, schlaf sounds, baby überwachung, neugeborenes tracker, säuglingspflege, baby entwicklung, elternschaft tools, baby zeitplan, baby routine, Flutter app, kostenlose baby app',
      'ogTitle': 'Sara Baby Tracker & Sounds - Kompletter Baby-Pflege-Begleiter',
      'ogDescription': 'Verfolgen Sie jeden kostbaren Moment mit Sara Baby. Kompletter Baby-Pflege-Begleiter für Schlafverfolgung, Fütterungspläne, Wachstumsüberwachung und beruhigende Klänge. 100% kostenlos, für immer.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Kompletter Baby-Pflege-Begleiter',
      'twitterDescription': 'Verfolgen Sie jeden kostbaren Moment mit Sara Baby. Kompletter Baby-Pflege-Begleiter für Schlafverfolgung, Fütterungspläne, Wachstumsüberwachung und beruhigende Klänge. 100% kostenlos, für immer.',
      'locale': 'de_DE',
      'language': 'German',
    },
    'es': {
      'title': 'Sara Baby Tracker & Sounds - Compañero Completo de Cuidado del Bebé | Seguimiento de Sueño, Alimentación y Crecimiento',
      'description': 'Rastrea cada momento precioso con Sara Baby. Compañero completo de cuidado del bebé para seguimiento del sueño, horarios de alimentación, monitoreo del crecimiento y sonidos relajantes. 100% gratis, para siempre. ¡Descarga ahora!',
      'keywords': 'app rastreador bebé, rastreador sueño bebé, rastreador alimentación, rastreador crecimiento bebé, app cuidado bebé, app paternidad, sonidos bebé, sonidos sueño, monitoreo bebé, rastreador recién nacido, cuidado infantil, desarrollo bebé, herramientas paternidad, horario bebé, rutina bebé, app Flutter, app bebé gratis',
      'ogTitle': 'Sara Baby Tracker & Sounds - Compañero Completo de Cuidado del Bebé',
      'ogDescription': 'Rastrea cada momento precioso con Sara Baby. Compañero completo de cuidado del bebé para seguimiento del sueño, horarios de alimentación, monitoreo del crecimiento y sonidos relajantes. 100% gratis, para siempre.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Compañero Completo de Cuidado del Bebé',
      'twitterDescription': 'Rastrea cada momento precioso con Sara Baby. Compañero completo de cuidado del bebé para seguimiento del sueño, horarios de alimentación, monitoreo del crecimiento y sonidos relajantes. 100% gratis, para siempre.',
      'locale': 'es_ES',
      'language': 'Spanish',
    },
    'fr': {
      'title': 'Sara Baby Tracker & Sounds - Compagnon Complet de Soins Bébé | Suivi Sommeil, Alimentation et Croissance',
      'description': 'Suivez chaque moment précieux avec Sara Baby. Compagnon complet de soins bébé pour le suivi du sommeil, les horaires d\'alimentation, la surveillance de la croissance et les sons apaisants. 100% gratuit, pour toujours. Téléchargez maintenant !',
      'keywords': 'app suivi bébé, tracker sommeil bébé, tracker alimentation, tracker croissance bébé, app soins bébé, app parentalité, sons bébé, sons sommeil, surveillance bébé, tracker nouveau-né, soins nourrisson, développement bébé, outils parentalité, planning bébé, routine bébé, app Flutter, app bébé gratuite',
      'ogTitle': 'Sara Baby Tracker & Sounds - Compagnon Complet de Soins Bébé',
      'ogDescription': 'Suivez chaque moment précieux avec Sara Baby. Compagnon complet de soins bébé pour le suivi du sommeil, les horaires d\'alimentation, la surveillance de la croissance et les sons apaisants. 100% gratuit, pour toujours.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Compagnon Complet de Soins Bébé',
      'twitterDescription': 'Suivez chaque moment précieux avec Sara Baby. Compagnon complet de soins bébé pour le suivi du sommeil, les horaires d\'alimentation, la surveillance de la croissance et les sons apaisants. 100% gratuit, pour toujours.',
      'locale': 'fr_FR',
      'language': 'French',
    },
    'ar': {
      'title': 'سارة بيبي تراكر وأصوات - رفيق رعاية الطفل الشامل | تتبع النوم والتغذية والنمو',
      'description': 'تتبع كل لحظة ثمينة مع سارة بيبي. رفيق رعاية الطفل الشامل لتتبع النوم وجداول التغذية ومراقبة النمو والأصوات المهدئة. 100% مجاني، إلى الأبد. حمل الآن!',
      'keywords': 'تطبيق تتبع الطفل، متتبع نوم الطفل، متتبع التغذية، متتبع نمو الطفل، تطبيق رعاية الطفل، تطبيق الأبوة، أصوات الطفل، أصوات النوم، مراقبة الطفل، متتبع المولود الجديد، رعاية الرضيع، تطور الطفل، أدوات الأبوة، جدول الطفل، روتين الطفل، تطبيق Flutter، تطبيق طفل مجاني',
      'ogTitle': 'سارة بيبي تراكر وأصوات - رفيق رعاية الطفل الشامل',
      'ogDescription': 'تتبع كل لحظة ثمينة مع سارة بيبي. رفيق رعاية الطفل الشامل لتتبع النوم وجداول التغذية ومراقبة النمو والأصوات المهدئة. 100% مجاني، إلى الأبد.',
      'twitterTitle': 'سارة بيبي تراكر وأصوات - رفيق رعاية الطفل الشامل',
      'twitterDescription': 'تتبع كل لحظة ثمينة مع سارة بيبي. رفيق رعاية الطفل الشامل لتتبع النوم وجداول التغذية ومراقبة النمو والأصوات المهدئة. 100% مجاني، إلى الأبد.',
      'locale': 'ar_SA',
      'language': 'Arabic',
    },
    'zh': {
      'title': 'Sara Baby Tracker & Sounds - 完整婴儿护理伴侣 | 睡眠、喂养和成长追踪',
      'description': '用Sara Baby追踪每一个珍贵时刻。完整的婴儿护理伴侣，用于睡眠追踪、喂养计划、成长监测和舒缓声音。100%免费，永远。立即下载！',
      'keywords': '婴儿追踪应用，婴儿睡眠追踪器，喂养追踪器，婴儿成长追踪器，婴儿护理应用，育儿应用，婴儿声音，睡眠声音，婴儿监测，新生儿追踪器，婴儿护理，婴儿发育，育儿工具，婴儿时间表，婴儿例行程序，Flutter应用，免费婴儿应用',
      'ogTitle': 'Sara Baby Tracker & Sounds - 完整婴儿护理伴侣',
      'ogDescription': '用Sara Baby追踪每一个珍贵时刻。完整的婴儿护理伴侣，用于睡眠追踪、喂养计划、成长监测和舒缓声音。100%免费，永远。',
      'twitterTitle': 'Sara Baby Tracker & Sounds - 完整婴儿护理伴侣',
      'twitterDescription': '用Sara Baby追踪每一个珍贵时刻。完整的婴儿护理伴侣，用于睡眠追踪、喂养计划、成长监测和舒缓声音。100%免费，永远。',
      'locale': 'zh_CN',
      'language': 'Chinese',
    },
    'nl': {
      'title': 'Sara Baby Tracker & Sounds - Complete Babyzorg Companion | Slaap-, Voeding- en Groeitracking',
      'description': 'Volg elk kostbaar moment met Sara Baby. Complete babyzorg companion voor slaaptracking, voedingsschema\'s, groeimonitoring en kalmerende geluiden. 100% gratis, voor altijd. Download nu!',
      'keywords': 'baby tracker app, baby slaap tracker, voeding tracker, baby groei tracker, babyzorg app, ouderschap app, baby geluiden, slaap geluiden, baby monitoring, pasgeborene tracker, zuigelingenzorg, baby ontwikkeling, ouderschap tools, baby schema, baby routine, Flutter app, gratis baby app',
      'ogTitle': 'Sara Baby Tracker & Sounds - Complete Babyzorg Companion',
      'ogDescription': 'Volg elk kostbaar moment met Sara Baby. Complete babyzorg companion voor slaaptracking, voedingsschema\'s, groeimonitoring en kalmerende geluiden. 100% gratis, voor altijd.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Complete Babyzorg Companion',
      'twitterDescription': 'Volg elk kostbaar moment met Sara Baby. Complete babyzorg companion voor slaaptracking, voedingsschema\'s, groeimonitoring en kalmerende geluiden. 100% gratis, voor altijd.',
      'locale': 'nl_NL',
      'language': 'Dutch',
    },
    'ru': {
      'title': 'Sara Baby Tracker & Sounds - Полный Спутник Ухода за Ребенком | Отслеживание Сна, Кормления и Роста',
      'description': 'Отслеживайте каждый драгоценный момент с Sara Baby. Полный спутник ухода за ребенком для отслеживания сна, графиков кормления, мониторинга роста и успокаивающих звуков. 100% бесплатно, навсегда. Скачать сейчас!',
      'keywords': 'приложение отслеживания ребенка, трекер сна ребенка, трекер кормления, трекер роста ребенка, приложение ухода за ребенком, приложение родительства, звуки ребенка, звуки сна, мониторинг ребенка, трекер новорожденного, уход за младенцем, развитие ребенка, инструменты родительства, расписание ребенка, рутина ребенка, Flutter приложение, бесплатное приложение для ребенка',
      'ogTitle': 'Sara Baby Tracker & Sounds - Полный Спутник Ухода за Ребенком',
      'ogDescription': 'Отслеживайте каждый драгоценный момент с Sara Baby. Полный спутник ухода за ребенком для отслеживания сна, графиков кормления, мониторинга роста и успокаивающих звуков. 100% бесплатно, навсегда.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Полный Спутник Ухода за Ребенком',
      'twitterDescription': 'Отслеживайте каждый драгоценный момент с Sara Baby. Полный спутник ухода за ребенком для отслеживания сна, графиков кормления, мониторинга роста и успокаивающих звуков. 100% бесплатно, навсегда.',
      'locale': 'ru_RU',
      'language': 'Russian',
    },
    'ko': {
      'title': 'Sara Baby Tracker & Sounds - 완전한 아기 돌봄 동반자 | 수면, 수유 및 성장 추적',
      'description': 'Sara Baby와 함께 모든 소중한 순간을 추적하세요. 수면 추적, 수유 일정, 성장 모니터링 및 진정 소리를 위한 완전한 아기 돌봄 동반자. 100% 무료, 영원히. 지금 다운로드하세요!',
      'keywords': '아기 추적 앱, 아기 수면 추적기, 수유 추적기, 아기 성장 추적기, 아기 돌봄 앱, 육아 앱, 아기 소리, 수면 소리, 아기 모니터링, 신생아 추적기, 유아 돌봄, 아기 발달, 육아 도구, 아기 일정, 아기 루틴, Flutter 앱, 무료 아기 앱',
      'ogTitle': 'Sara Baby Tracker & Sounds - 완전한 아기 돌봄 동반자',
      'ogDescription': 'Sara Baby와 함께 모든 소중한 순간을 추적하세요. 수면 추적, 수유 일정, 성장 모니터링 및 진정 소리를 위한 완전한 아기 돌봄 동반자. 100% 무료, 영원히.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - 완전한 아기 돌봄 동반자',
      'twitterDescription': 'Sara Baby와 함께 모든 소중한 순간을 추적하세요. 수면 추적, 수유 일정, 성장 모니터링 및 진정 소리를 위한 완전한 아기 돌봄 동반자. 100% 무료, 영원히.',
      'locale': 'ko_KR',
      'language': 'Korean',
    },
    'id': {
      'title': 'Sara Baby Tracker & Sounds - Pendamping Perawatan Bayi Lengkap | Pelacakan Tidur, Makan & Tumbuh Kembang',
      'description': 'Lacak setiap momen berharga dengan Sara Baby. Pendamping perawatan bayi lengkap untuk pelacakan tidur, jadwal makan, pemantauan pertumbuhan, dan suara menenangkan. 100% gratis, selamanya. Unduh sekarang!',
      'keywords': 'aplikasi pelacak bayi, pelacak tidur bayi, pelacak makan, pelacak pertumbuhan bayi, aplikasi perawatan bayi, aplikasi parenting, suara bayi, suara tidur, monitoring bayi, pelacak bayi baru lahir, perawatan bayi, perkembangan bayi, tools parenting, jadwal bayi, rutinitas bayi, aplikasi Flutter, aplikasi bayi gratis',
      'ogTitle': 'Sara Baby Tracker & Sounds - Pendamping Perawatan Bayi Lengkap',
      'ogDescription': 'Lacak setiap momen berharga dengan Sara Baby. Pendamping perawatan bayi lengkap untuk pelacakan tidur, jadwal makan, pemantauan pertumbuhan, dan suara menenangkan. 100% gratis, selamanya.',
      'twitterTitle': 'Sara Baby Tracker & Sounds - Pendamping Perawatan Bayi Lengkap',
      'twitterDescription': 'Lacak setiap momen berharga dengan Sara Baby. Pendamping perawatan bayi lengkap untuk pelacakan tidur, jadwal makan, pemantauan pertumbuhan, dan suara menenangkan. 100% gratis, selamanya.',
      'locale': 'id_ID',
      'language': 'Indonesian',
    },
  };

  /// Get SEO data for a specific language
  static Map<String, String> getSEOData(String languageCode) {
    return seoData[languageCode] ?? seoData['en']!;
  }

  /// Get all supported language codes
  static List<String> getSupportedLanguages() {
    return seoData.keys.toList();
  }

  /// Generate hreflang tags for all supported languages
  static String generateHreflangTags() {
    final supportedLanguages = getSupportedLanguages();
    final hreflangTags = StringBuffer();
    
    for (final lang in supportedLanguages) {
      hreflangTags.writeln('  <link rel="alternate" hreflang="$lang" href="https://www.sarababy.app/?lang=$lang">');
    }
    
    // Add x-default for English
    hreflangTags.writeln('  <link rel="alternate" hreflang="x-default" href="https://www.sarababy.app/">');
    
    return hreflangTags.toString();
  }

  /// Generate language-specific structured data
  static String generateStructuredData(String languageCode) {
    final seoData = getSEOData(languageCode);
    
    return '''
  {
    "@context": "https://schema.org",
    "@type": "WebApplication",
    "name": "Sara Baby Tracker & Sounds",
    "description": "${seoData['description']}",
    "url": "https://www.sarababy.app/",
    "applicationCategory": "HealthApplication",
    "operatingSystem": "Android, iOS",
    "offers": {
      "@type": "Offer",
      "price": "0",
      "priceCurrency": "USD"
    },
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "5.0",
      "ratingCount": "1000"
    },
    "author": {
      "@type": "Organization",
      "name": "Sara Baby Team"
    },
    "publisher": {
      "@type": "Organization",
      "name": "Sara Baby Team"
    },
    "screenshot": "https://www.sarababy.app/icons/Icon-512.png",
    "softwareVersion": "1.0.0",
    "datePublished": "2024-01-01",
    "dateModified": "2024-12-19",
    "inLanguage": "$languageCode"
  }''';
  }
}
