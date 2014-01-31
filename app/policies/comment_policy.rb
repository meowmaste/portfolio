CommentPolicy = Struct.new(:user, :comment) do
  self::Scope = Struct.new(:user, :scope) do
      def resolve
        if user.author? || user.editor?
          scope.all
        else
          scope.where(approved: true)
        end
      end
    end

  def approve?
  	user && (user.editor? || user.author?)
  end

end
