# -*- encoding: utf-8 -*-
class Devise::Mailer < Devise.parent_mailer.constantize
  include Devise::Mailers::Helpers

  def confirmation_instructions(record, token, opts={})
    opts = opts.merge default_opts
    opts = opts.merge subject_confirmation
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    opts = opts.merge default_opts
    opts = opts.merge subject_reset_password
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
    opts = opts.merge default_opts
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end

private

  def default_opts
  {
    from: "ChoiStyle<admin@choistyle.net>"
  }
  end

  def subject_confirmation
  {
    subject: "【ChoiStyle】本登録用URLのお知らせ"
  }
  end

  def subject_reset_password
  {
    subject: "【ChoiStyle】パスワード再設定のお知らせ"
  }
  end
end
