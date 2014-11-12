module LanguagesHelper
  def available_languages
    [:cs, :en, :pl, :de]
  end

  def flag_file(lang)
    case lang.to_s
    when 'cs'
      'flags/czech_flag.png'
    when 'en'
      'flags/english_flag.png'
    when 'pl'
      'flags/polish_flag.png'
    when 'de'
      'flags/german_flag.png'
    end
  end

end