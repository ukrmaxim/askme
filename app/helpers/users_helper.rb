module UsersHelper
  def decline(questions, singular, singular_genitive, plurar_genitive)
    return plurar_genitive if (11..14).include?(questions % 100)

    ostatok = questions % 10

    case ostatok
    when 1
      singular
    when 2..4
      singular_genitive
    else
      plurar_genitive
    end
  end
end
