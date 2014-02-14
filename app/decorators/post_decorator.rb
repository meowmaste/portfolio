class PostDecorator < Draper::Decorator
  delegate_all

  def intro
    object.body[0..100]+"..."
  end
end
