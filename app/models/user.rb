class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         ROLES = ["Operador", "Administrador"]

  def operador?
    self.role == "Operador"
  end

  def administrador?
    self.role == "Administrador"
  end
end
