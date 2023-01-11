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

  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar.jpg')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def text_with_hashtag_links(string)
    string&.gsub(Hashtag::TAG_STRING_REGEXP) do |hashtag|
      link_to hashtag, hashtag_path(hashtag.downcase.delete('#'))
    end
  end
end
