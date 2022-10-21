class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    monster
  end

  def new
    @monster = Monster.new()
  end

  # Ejercicio 2
  # Crear las rutas para crear y actualizar monstruos
  def create
    # Se crea un monstruo
    @monster = Monster.new(monsters_params)
      
    if @monster.save 
      redirect_to edit_monster_path(@monster), notice: "Monstruo creado."
    else
        render :new
    end
  end

  def update
    monster
    if monster.update(monsters_params)
      redirect_to monster_path, notice: "Mounstruo editado"
    end
  end

  private
  # Strong Params
  def monsters_params
    params.require(:monster).permit(:name, :description, :phone, :birthdate)
  end

  def monster
    # Si esta seteado no hace nada, sino lo va a buscar
    @monster ||= Monster.find(params[:id])
  end
end
