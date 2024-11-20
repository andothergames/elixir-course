defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, volume} = _volume_pair) do
    {:milliliter, 240 * volume}
  end

  def to_milliliter({:fluid_ounce, volume} = _volume_pair) do
    {:milliliter, 30 * volume}
  end

  def to_milliliter({:teaspoon, volume} = _volume_pair) do
    {:milliliter, 5 * volume}
  end

  def to_milliliter({:tablespoon, volume} = _volume_pair) do
    {:milliliter, 15 * volume}
  end

  def to_milliliter({:milliliter, volume} = _volume_pair) do
    {:milliliter, volume}
  end

  def from_milliliter(volume_pair, :cup = _unit) do
    {_, mls} = to_milliliter(volume_pair)
    {:cup, mls / 240}
  end

  def from_milliliter(volume_pair, :fluid_ounce = _unit) do
    {_, mls} = to_milliliter(volume_pair)
    {:fluid_ounce, mls / 30}
  end

  def from_milliliter(volume_pair, :teaspoon = _unit) do
    {_, mls} = to_milliliter(volume_pair)
    {:teaspoon, mls / 5}
  end

  def from_milliliter(volume_pair, :tablespoon = _unit) do
    {_, mls} = to_milliliter(volume_pair)
    {:tablespoon, mls / 15}
  end

  def from_milliliter(volume_pair, :milliliter = _unit) do
    {_, mls} = to_milliliter(volume_pair)
    {:milliliter, mls}
  end

  def convert(volume_pair, unit) do
    mls = to_milliliter(volume_pair)
    from_milliliter(mls, unit)
  end
end
