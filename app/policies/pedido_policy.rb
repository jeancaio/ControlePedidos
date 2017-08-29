class PedidoPolicy < ApplicationPolicy
  def liberacao?
    usuario.admin?
  end

  def destroy?
    usuario.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
