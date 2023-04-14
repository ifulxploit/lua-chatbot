-- Import library untuk membantu memproses bahasa alami
local nlp = require('nlp')

-- Definisikan daftar pertanyaan yang sering ditanyakan dan jawabannya
local frequently_asked_questions = {
  ["apa kabar?"] = "Saya baik-baik saja, terima kasih. Bagaimana dengan Anda?",
  ["siapa kamu?"] = "Saya adalah chatbot yang dibuat untuk membantu Anda."
  -- tambahkan pertanyaan dan jawaban lainnya di sini
}

-- Fungsi untuk menangani pertanyaan yang diberikan oleh pengguna
function handle_question(question)
  -- Gunakan library nlp untuk memproses pertanyaan
  local doc = nlp(question)
  
  -- Cari jawaban di daftar pertanyaan yang sering ditanyakan
  local answer = frequently_asked_questions[question]
  
  -- Jika pertanyaan tidak ditemukan di daftar pertanyaan yang sering ditanyakan, berikan jawaban default
  if not answer then
    answer = "Maaf, saya tidak mengerti pertanyaan Anda."
  end
  
  -- Kembalikan jawaban ke pengguna
  return answer
end

-- Fungsi untuk menjalankan chatbot
function run_chatbot()
  print("Selamat datang! Silakan tanyakan sesuatu.")
  while true do
    -- Baca input pengguna dari terminal
    io.write("> ")
    local question = io.read()
    
    -- Jika pengguna memasukkan "selesai", keluar dari loop dan tutup program
    if question == "selesai" then
      print("Terima kasih telah menggunakan chatbot ini.")
      break
    end
    
    -- Proses pertanyaan dan kirimkan jawaban ke pengguna
    local answer = handle_question(question)
    print(answer)
  end
end

-- Jalankan chatbot
run_chatbot()
