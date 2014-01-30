PostPolicy = Struct.new(:user, :post) do

  def create?
  	user.role == "author" || user.role == "editor"
  end

  def publish?
  	user.editor?
  end

  def update?
  	user && (user.editor? || post.author = user)
  end

  def delete?
  	user && user.editor?
  end

end
