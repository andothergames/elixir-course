defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    unit = elem(volume_pair, 0)
    volume = get_volume(volume_pair)

    cond do
      unit === :cup -> {:milliliter, volume * 240}
      unit === :fluid_ounce -> {:milliliter, volume * 30}
      unit === :teaspoon -> {:milliliter, volume * 5}
      unit === :tablespoon -> {:milliliter, volume * 15}
      true -> {:milliliter, volume}
    end
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)

    cond do
      unit === :cup -> {unit, volume / 240}
      unit === :fluid_ounce -> {unit, volume / 30}
      unit === :teaspoon -> {unit, volume / 5}
      unit === :tablespoon -> {unit, volume / 15}
      true -> {unit, volume}
    end
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
