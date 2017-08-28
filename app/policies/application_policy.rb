class ApplicationPolicy
  attr_reader :usuario, :record

  def initialize(usuario, record)
    @usuario = usuario
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(usuario, record.class)
  end

  class Scope
    attr_reader :usuario, :scope

    def initialize(usuario, scope)
      @usuario = usuario
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
