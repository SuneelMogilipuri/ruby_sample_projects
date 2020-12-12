class ApplicationController < ActionController::Base  
    before_action :set_locale

    def content_not_found
        render file: "#{Rails.root}/public/404", layout: true, status: 404
    end
    private
        def default_url_options
            {locale: I18n.locale}
        end
        
        def set_locale
            I18n.locale = extract_locale || I18n.default_locale
        end

        def extract_locale
            parsed_locale = params[:locale]
            I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
                parsed_locale.to_sym : nil
        end
end
