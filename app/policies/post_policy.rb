PostPolicy = Struct.new(:user, :post) do

  def create?
  	user.role == "author" || user.role == "editor"
  end

  def publish?
  	user.role == "editor"
  end
end
