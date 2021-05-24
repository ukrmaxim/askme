module ApplicationHelper
  def include_recaptcha_js
    raw %Q{<script src="https://www.google.com/recaptcha/api.js?render=#{ENV['RECAPTCHA_SITE_KEY']}"></script>}
  end

  def recaptcha_execute(action)
    id = "recaptcha_token_#{SecureRandom.hex(10)}"

    raw %Q{
      <input name="recaptcha_token" type="hidden" id="#{id}"/>
      <script>
        grecaptcha.ready(function() {
          grecaptcha.execute('#{ENV['RECAPTCHA_SITE_KEY']}', {action: '#{action}'}).then(function(token) {
            document.getElementById("#{id}").value = token;
          });
        });
      </script>
    }
  end

  # Этот метод возвращает ссылку на аватарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которую положим в app/assets/images
  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar.jpg')
  end

  # Хелпер, рисующий span тэг с иконкой из font-awesome
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
