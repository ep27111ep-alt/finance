// Настройки подключения к Supabase.
// Возьми их в Supabase: Project Settings → API (или Data API).
// Ключ anon/publishable можно хранить в открытом виде: доступ к данным
// защищают правила в базе (setup.sql), а не секретность этого ключа.
window.BUDGET_CONFIG = {
  supabaseUrl: "https://spjcqkdenecdiyuteart.supabase.co",        // например https://abcdefgh.supabase.co
  supabaseAnonKey: "sb_publishable_mDtpb8SoqsF2CvGCW-Am_g_YZEEHQPS"  // длинная строка, начинается с eyJ... или sb_publishable_
};
